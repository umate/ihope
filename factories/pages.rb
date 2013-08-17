FactoryGirl.define do
  factory :cms_page, class: Page do
    title { Faker::Lorem.sentence(5) }
    content { Faker::Lorem.paragraphs(3).join('<br />') }
    slug { Faker::Lorem.word }
  end
end
