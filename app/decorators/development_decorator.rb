class DevelopmentDecorator < Draper::Decorator
    delegate_all

    def user
        model.user.username
    end

    def site
        model.site.name
    end
end
