class CreateNewsArticle < ActiveRecord::Migration
  def up
    create_table :news_articles do |t|
      t.string   :slug
      t.string   :title
      t.text     :content
      t.text     :short_description

      t.timestamps
    end

    NewsArticle.create_translation_table! title: :string, content: :text, short_description: :text
    add_index :news_articles, :slug
  end

  def down
    drop_table :news_articles
    NewsArticle.drop_translation_table!
  end
end
