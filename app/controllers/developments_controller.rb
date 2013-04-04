class DevelopmentsController < ApplicationController
    def index
        @developments = Development.all
    end

    def new
        @development = Development.new

        @development.build_user
        @development.build_site
    end

    def create
        @user = User.find_or_create_by username: params[:development].try(:[], :user_attributes).try(:[], :username)
        @site = Site.find_or_create_by name: params[:development].try(:[], :site_attributes).try(:[], :name)

        @development = Development.new user: @user, site: @site, category_id: params[:development].try(:[], :category_id)

        if @development.save
            redirect_to @site, notice: 'OK'
        else
            render :new
        end
    end
end
