FactoryBot.define do
  factory :article, class: '::Article' do
    sequence :name do |n|
      "Test article #{n}"
    end

    sequence :content do |n|
      "Test content #{n}"
    end

    source { ['blog', 'facebook', 'tweet', 'other'].sample }

    story
  end
end
