module PolarisResource
  module Associations
    class HasOneAssociation < Association

      # The initializer calls out to the superclass' initializer and then
      # sets the options particular to itself.
      def initialize(owner, association, settings = {})
        super

        # The primary key is used in the generated url for the target. It
        # defaults to :id.
        @options[:primary_key] ||= :id
      end

      def with_filter(filter)
        HasOneAssociation.new(@owner, @association, :target => @target, :filters => @filters.dup.push(filter), :options => @options)
      end

      # When loading the target, the primary key is first checked. If the
      # key is nil, then an nil is returned. Otherwise, the target
      # is requested at the generated url. For a has_one :meeting
      # association on a class called Course, the generated url might look
      # like this: /courses/1/meeting, where the 1 is the primary key.
      def load_target!
        if primary_key = @owner.send(@options[:primary_key])
          attributes = [UrlBuilder.has_one(@owner.class, primary_key, @association_class), nil, { :id => primary_key }]
          @options[:class_name].constantize.get(*attributes) do
            while !@includes.empty?
              association = @includes.pop
              loaded_target.send(association.to_sym).try(:load_target!)
            end
          end
        end
      end

    end
  end
end