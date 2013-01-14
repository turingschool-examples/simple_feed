FactoryGirl.define do
  factory :text_item do
    sequence(:body) {|n| "Text Item #{n}" }
  end
end
