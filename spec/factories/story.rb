FactoryBot.define do
  factory :story do
    sequence :name do |n|
      "Test story #{n}"
    end
  end
end
