FactoryBot.define do
  factory :user do
    nickname              {'name'}
    email                 {'ono@ono'}
    password              {'000000'}
    password_confirmation {password}
  end
end