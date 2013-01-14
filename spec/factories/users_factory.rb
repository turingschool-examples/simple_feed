FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "User_#{n}" }
    email { "#{username}@example.com" }
    password "hungry"
    password_confirmation { password }

    factory(:jeff) do
      username "j3"
    end

    factory(:matt) do
      username "mattyoho"
    end
  end
end
