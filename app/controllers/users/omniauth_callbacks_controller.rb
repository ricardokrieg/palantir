class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def github
        user = User.find_or_create_github_oauth request.env['omniauth.auth']

        if user.present?
            flash[:notice] = 'Success'
            sign_in_and_redirect user, event: :authentication
        else
            flash[:error] = 'Error'
            redirect_to root_path
        end
    end
end
