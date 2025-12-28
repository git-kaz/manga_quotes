class ChangeSceneTypeInQuotes < ActiveRecord::Migration[7.2]
  def up
    change_column :quotes, :scene, :text
  end

  def down
    change_column :quotes, :scene, :integer
  end
  
end
