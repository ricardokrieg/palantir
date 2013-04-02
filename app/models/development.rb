class Development < ActiveRecord::Base
    belongs_to :user
    belongs_to :site
    belongs_to :category
    has_many :changes

    validates :user_id, presence: true, uniqueness: {scope: [:site_id, :category_id]}
    validates :site_id, presence: true
    validates :category_id, presence: true
    validates_associated :user, :site, :category
end
