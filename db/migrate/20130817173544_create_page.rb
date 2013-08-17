class CreatePage < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.string   'title'
      t.string   'slug'
      t.text     'content'
      t.timestamps
    end

    add_index :pages, :slug
    Page.create_translation_table! title: :string, content: :text
  end

  def down
    drop_table :pages
    Page.drop_translation_table!
  end
end
