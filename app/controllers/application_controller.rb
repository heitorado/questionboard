class ApplicationController < ActionController::Base

    # Overrides devise's redirection after login
    def after_sign_in_path_for(resource)
        questions_pending_path
    end

end
