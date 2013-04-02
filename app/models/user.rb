class User < ActiveRecord::Base
    devise :omniauthable, :rememberable, :trackable, :lockable, :timeoutable, omniauth_providers: [:github]

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :uid, presence: true, uniqueness: true
    validates :provider, presence: true, inclusion: {in: ['github']}
end
