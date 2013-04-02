class Site < ActiveRecord::Base
    validates :url, presence: true
    validates :name, presence: true
end
