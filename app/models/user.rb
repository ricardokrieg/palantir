class User < ActiveRecord::Base
    devise :omniauthable, :rememberable, :trackable, :lockable, :timeoutable
end
