module PolarisResource
  module Attributes
    extend ActiveSupport::Concern

    module ClassMethods
      
      def property(name, typecast_class = nil)
        typecast_attributes.store(name.to_sym, typecast_class)
        default_attributes.store(name.to_sym, nil)

        define_method name.to_sym do
          attributes[name.to_sym]
        end

        define_method "#{name}=".to_sym do |value|
          send("#{name}_will_change!")
          update_attribute(name, value)
        end

        define_attribute_methods [name]
      end

      def default_attributes
        @attributes ||= HashWithIndifferentAccess.new(superclass.respond_to?(:default_attributes) ? superclass.default_attributes : {})
      end

      def typecast_attributes
        @typecast_attributes ||= HashWithIndifferentAccess.new(superclass.respond_to?(:default_attributes) ? superclass.default_attributes : {})
      end

      def attribute_defined?(attribute)
        default_attributes.keys.include?(attribute.to_s)
      end

    end
    
    module InstanceMethods

      def attributes
        @attributes ||= self.class.default_attributes.dup
      end

      def read_attribute_for_validation(key)
        attributes[key]
      end

      def typecast(attribute, value)
        TypeCaster.cast(value, self.class.typecast_attributes[attribute.to_sym])
      end

      def attributes_without_id
        attributes.reject { |k,v| k == 'id' }
      end
      
      def update_attribute(attribute, value)
        reflection = self.class.reflect_on_association(attribute)
        if reflection
          if reflection.macro == :has_many # need to construct each member of array one-by-one
            association_object = send(attribute)
            value.each do |a_value|
              if a_value.instance_of? reflection.klass
                target = a_value
              else
                target = reflection.build_association(a_value)
              end
              association_object << target
            end
          else 
            if value.instance_of? reflection.klass
              target = value
            else
              target = reflection.build_association(value)
            end
            send("#{attribute}=", target)
          end
        else
          attributes[attribute.to_sym] = typecast(attribute, value)
        end
      end

      def merge_attributes(new_attributes)
        new_attributes.each do |key, value|
          if key.to_sym == :errors
            value.each do |k, v|
              v.each do |message|
                errors.add(k, message)
              end
            end
          else
            update_attribute(key, value)
          end
        end
        self
      end
      private :merge_attributes
      
      def define_attribute_accessor(method)
        if method.to_s.include?('=')
          self.class.send(:define_method, method) do |value|
            attributes[method.to_s.delete('=')] = value
          end
        else
          self.class.send(:define_method, method) do
            attributes[method]
          end
        end
      end
      private :define_attribute_accessor
      
    end

  end
end