class NewsArticle < ActiveRecord::Base
  extend FriendlyId
  self.per_page = 6

  translates :title, :content, :short_description do
    validates :title, presence: true,
              length: { maximum: 255 }

    validates :short_description, presence: true,
              length: { maximum: 1000 }

    validates :content, presence: true,
              length: { maximum: 50000 }
  end

  attr_accessible :title, :content, :short_description

  validates :title, presence: true,
            length: { maximum: 255 }

  validates :short_description, presence: true,
            length: { maximum: 1_000 }

  validates :content, presence: true,
            length: { maximum: 50_000 }

  scope :latest, -> { order('created_at DESC') }


  friendly_id :generated_slug, use: :slugged

  private

  def generated_slug
    slug || (Translit.convert(title.dup, :english) if title)
  end
end