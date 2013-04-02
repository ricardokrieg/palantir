# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0)
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :string(255)
#  last_sign_in_ip     :string(255)
#  failed_attempts     :integer          default(0)
#  unlock_token        :string(255)
#  locked_at           :datetime
#  created_at          :datetime
#  updated_at          :datetime
#  provider            :string(255)
#  uid                 :string(255)
#  email               :string(255)
#  username            :string(255)
#

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
