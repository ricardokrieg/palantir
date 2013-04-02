class Change < ActiveRecord::Base
    belongs_to :user
    belongs_to :development
    belongs_to :action

    validates :user_id, presence: true
    validates :development_id, presence: true
    validates :action_id, presence: true
    validates_associated :user, :development, :action
end
