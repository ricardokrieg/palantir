require 'faker'

FactoryGirl.define do
    factory :site do
        url {Faker::Internet.url}
        name {Faker::Internet.domain_word}
    end
end
