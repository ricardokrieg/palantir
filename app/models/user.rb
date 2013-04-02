class User < ActiveRecord::Base
    devise :database_authenticatable, :rememberable, :trackable, :omniauthable, :lockable, :timeoutable
end
