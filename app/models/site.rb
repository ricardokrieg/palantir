class Site < ActiveRecord::Base
    has_many :developments

    validates :url, presence: true
    validates :name, presence: true
end
