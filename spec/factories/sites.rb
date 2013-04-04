require 'faker'

FactoryGirl.define do
    factory :site do
        name {Faker::Internet.domain_word}
    end
end
