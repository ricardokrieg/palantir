module LinkHelper
    def link_to_sign_in
        link_to "<i class='icon-github icon-2x'></i> Sign in via Github".html_safe, user_omniauth_authorize_path(:github), class: 'btn btn-large btn-danger'
    end

    def link_to_add
        link_to "<i class='icon-plus icon-large'></i> Add".html_safe, :new_development, class: 'btn btn-large btn-success'
    end
end
