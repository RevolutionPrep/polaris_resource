module PolarisResource
  module Associations
    class BelongsToAssociation < Association
      
      def initialize(owner, association, target = nil, options = {})
        super
        # Associations can be marked as polymorphic. These associations will use
        # the returned found type to instantiate the associated object.
        @options[:polymorphic] = options[:polymorphic] || false
        
        @options[:foreign_key] = options[:foreign_key] || "#{@association.to_s}_id".to_sym
      end
      
      def load_target!
        if association_id = @owner.send(@options[:foreign_key])
          polymorphic_class = @options[:polymorphic] ? @owner.send("#{@association}_type".to_sym).constantize : @options[:class_name].constantize
          polymorphic_class.send(:find, association_id)
        end
      end
      
    end
  end
end