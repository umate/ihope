class Setting < ActiveRecord::Base
  attr_accessible :name, :content, :formatted

  before_validation :check_content_formatting

  translates :content do
    validates :content, length: { maximum: 5000 }
  end

  validates :name, presence: true, uniqueness: true,
            format: { with: /\A[\w_]+\Z/ }, length: { maximum: 255 }

  validates :content, length: { maximum: 20_000 }


  def self.value(name)
    setting = self.find_all_by_name(name)
    setting.content if setting
  end


  protected

  def check_content_formatting
    if !self.formatted && self.content.present?
      self.content.gsub!(/(<[^>]*>)|\n|\t/s) { '' }
    end
  end
end