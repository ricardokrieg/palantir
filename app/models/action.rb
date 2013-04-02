class Action < ActiveRecord::Base
    has_many :changes

    validates :name, presence: true, uniqueness: true
end
