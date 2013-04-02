require 'faker'

FactoryGirl.define do
    factory :user do
        email       {Faker::Internet.email}
        username    {Faker::Internet.user_name}
        provider    'github'
        uid         '123'
    end
end
