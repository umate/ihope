class Setting < ActiveRecord::Base
  attr_accessible :name, :content, :internal

  translates :content do
    validates :content, length: { maximum: 5000 }
  end

  validates :name, presence: true, uniqueness: true,
            format: { with: /\A[\w_]+\Z/ }, length: { maximum: 255 }

  validates :content, length: { maximum: 20_000 }

  scope :public, -> { where(internal: false) }

  def self.value(name)
    setting = self.find_all_by_name(name)
    setting.content if setting
  end
end