class User < ActiveRecord::Base
    devise :omniauthable, :rememberable, :trackable, :lockable, :timeoutable, omniauth_providers: [:github]
end
