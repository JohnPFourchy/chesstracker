class ApplicationController < ActionController::Base
    protected

    # Redirects the user to their dashboard after sign in
    def after_sign_in_path_for(resource)
      stored_location_for(resource) || dashboard_path
    end
end
