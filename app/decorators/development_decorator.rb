class DevelopmentDecorator < Draper::Decorator
    delegate_all

    def username
        model.user.username
    end

    def sitename
        model.site.name
    end
end
