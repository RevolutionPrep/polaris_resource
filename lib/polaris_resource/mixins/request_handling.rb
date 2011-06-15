module PolarisResource
  module RequestHandling
    extend ActiveSupport::Concern

    module ClassMethods

      def request_queue
        @request_queue ||= RequestQueue.new
      end

      def get(path, params = nil, metadata = {})
        request = build_request(:get, path, params)
        quick_request(request)
        response_from_request(request, metadata)
      end

      def post(path, params = nil, metadata = {})
        request = build_request(:post, path, params)
        quick_request(request)
        response_from_request(request, metadata)
      end

      def put(path, params = nil, metadata = {})
        request = build_request(:put, path, params)
        quick_request(request)
        response_from_request(request, metadata)
      end

      def quick_request(request)
        request_queue << request
        request_queue.run!
      end

      def build_request(method, path, params)
        options = { :method => method }
        options.merge!(:params => params) if params
        Request.new(path, options)
      end

    end

  end
end