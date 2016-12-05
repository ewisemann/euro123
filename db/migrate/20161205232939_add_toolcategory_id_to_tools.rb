class AddToolcategoryIdToTools < ActiveRecord::Migration
  def change
    add_column :tools, :toolcategory_id, :integer
  end
end
