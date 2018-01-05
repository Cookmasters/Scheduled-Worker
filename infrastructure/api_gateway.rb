# frozen_string_literal: true

require 'http'

module RecipeBuddy
  # API gateway
  class ApiGateway
    # API response
    class ApiResponse
      HTTP_STATUS = {
        200 => :ok,
        201 => :created,
        202 => :processing,
        204 => :no_content,

        403 => :forbidden,
        404 => :not_found,
        400 => :bad_request,
        409 => :conflict,
        422 => :cannot_process,

        500 => :internal_error
      }.freeze

      attr_reader :status, :message

      def initialize(code, message)
        @code = code
        @status = HTTP_STATUS[code]
        @message = message
      end

      def ok?
        HTTP_STATUS[@code] == :ok
      end

      def processing?
        HTTP_STATUS[@code] == :processing
      end
    end

    def initialize(config)
      @config = config
    end

    def all_pages
      call_api(:get, %w[page all])
    end

    def update_page(pagename)
      call_api(:put, ['page', pagename])
    end

    def call_api(method, resources)
      url_route = [@config.API_HOST, @config.API_VER, resources].flatten
                                                                .join('/')

      result = HTTP.send(method, url_route)
      raise(result.parse['message']) if result.code >= 300
      ApiResponse.new(result.code, result.to_s)
    end
  end
end
