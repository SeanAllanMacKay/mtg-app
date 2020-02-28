class ApplicationController < ActionController::Base
    before_action :set_header

    def set_header
        @params = params
    end
end
