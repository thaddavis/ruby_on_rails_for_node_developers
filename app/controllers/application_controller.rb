class ApplicationController < ActionController::API

    rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ::NameError, with: :error_occurred
    rescue_from ::ActionController::RoutingError, with: :error_occurred
    # Don't resuce from Exception as it will resuce from everything as mentioned here "http://stackoverflow.com/questions/10048173/why-is-it-bad-style-to-rescue-exception-e-in-ruby" Thanks for @Thibaut Barrère for mention that
    # rescue_from ::Exception, with: :error_occurred 

    protected

    def record_not_found(exception)
        render json: {error: exception.message}.to_json, status: 404
        return
    end

    def error_occurred(exception)
        render json: {error: exception.message}.to_json, status: 500
        return
    end

end