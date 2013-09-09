# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :non_disclosure_agreement do
    body "MyText"
    name "MyString"
  end
end
