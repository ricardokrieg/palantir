class User < ActiveRecord::Base
    devise :omniauthable, :rememberable, :trackable, :lockable, :timeoutable, omniauth_providers: [:github]

    has_many :developments
    has_many :changes

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :uid, presence: true, uniqueness: true
    validates :provider, presence: true, inclusion: {in: ['github']}

    def self.find_or_create_github_oauth(auth)
        user = User.where(provider: auth.provider, uid: auth.uid).first

        unless user
            user = User.create! username: auth.info.nickname, email: auth.info.email, provider: auth.provider, uid: auth.uid
        end

        user
    end
end
