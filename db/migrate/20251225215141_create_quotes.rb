class CreateQuotes < ActiveRecord::Migration[7.2]
  def change
    create_table :quotes do |t|
      t.text :content
      t.string :source
      t.integer :scene
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
