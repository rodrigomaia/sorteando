FactoryGirl.define do
  factory :concorrente do
    sequence(:nome) { |n| "nome_#{n}" } 
    sequence(:email) { |n| "nome_#{n}@email.com" } 
    association :sorteio
  end
end
