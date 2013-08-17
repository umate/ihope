class CreateSettings < ActiveRecord::Migration
  def up
    create_table :settings do |t|
      t.string   :name
      t.text     :content
      t.boolean  :formatted, default: true

      t.timestamps
    end
    Setting.create_translation_table! content: :text
    add_index :settings, :name
  end

  def down
    drop_table :settings
    Setting.drop_translation_table!
  end
end
