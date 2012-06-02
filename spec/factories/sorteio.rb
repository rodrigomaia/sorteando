FactoryGirl.define do
  factory :sorteio do
    sequence(:nome) { |n| "sorteio_#{n}" } 
    qtd_premios 1
  end
end
