class DevelopmentsController < ApplicationController
    def index
        @developments = Development.all
    end

    def new
        @development = Development.new
    end

    def create
        user = User.find_or_create_by_username params[:user]
        site = Site.find_or_create_by_name params[:site]

        @development = Development.create! user: user, site: site, category_id: params[:category_id]
    end
end
