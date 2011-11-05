module PolarisResource
  module UrlSupport
    extend ActiveSupport::Concern

    module ClassMethods

      def url_name
        @url_name ||= model_name.underscore
      end
      alias_method :singular_url_name, :url_name

      def plural_url_name
        url_name.pluralize
      end

      def set_base_url(url_name)
        @url_name = url_name
      end

      def attributes_root
        @attributes_root ||= model_name.underscore
      end

      def set_attributes_root(name)
        @attributes_root = name
      end

      def set_base_model_name(name)
        set_base_url(name)
        set_attributes_root(name)
      end

    end

  end
end
