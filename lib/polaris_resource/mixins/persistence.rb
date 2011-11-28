module PolarisResource
  module Persistence
    extend ActiveSupport::Concern

    module InstanceMethods

      def save(with_validations = true)
        attributes_for_save = { self.class.attributes_root => attributes_without_basic_attributes.reject { |k,v| v.nil? } }

        if with_validations
          return false unless valid?
        end

        if new_record?
          built_object = self.class.post(*UrlBuilder.save(self.class, nil, attributes_for_save))
        else
          built_object = self.class.put(*UrlBuilder.save(self.class, id, attributes_for_save))
        end
        built_object.instance_variables.each do |iv|
          self.instance_variable_set(iv, built_object.instance_variable_get(iv))
        end
        @valid
      end

      def update_attributes(new_attributes)
        merge_attributes(new_attributes)
        save
      end

      def destroy
        self.class.delete(UrlBuilder.destroy(self.class, id))
      end

    end

    module ClassMethods

      def create(new_attributes = {})
        new(new_attributes).tap { |new_instance| new_instance.save }
      end
      alias :create! :create

    end

  end
end
