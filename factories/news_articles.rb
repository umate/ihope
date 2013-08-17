FactoryGirl.define do
  factory :cms_news_article, class: NewsArticle do
    title { Faker::Lorem.sentence }
    short_description { Faker::Lorem.sentences(3).join(' ') }
    descr { Faker::Lorem.paragraphs(4).join('<br />') }
  end
end
