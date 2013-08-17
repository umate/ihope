class Page < ActiveRecord::Base
  attr_accessible :title, :slug, :content

  translates :title, :content do
    validates :title, length: { maximum: 255 }, presence: true
    validates :content, length: { maximum: 20_000 }
  end

  validates :title, length: { maximum: 255 }, presence: true
  validates :content, length: { maximum: 20_000 }

  validates :slug, presence: true,
            uniqueness: true,
            format: { with: /[\w-]+/ },
            length: { maximum: 255 }
end