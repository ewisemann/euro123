class CreateToolcategories < ActiveRecord::Migration
  def change
    create_table :toolcategories do |t|
      t.string :level1
      t.string :level2
      t.string :level3

      t.timestamps null: false
    end
  end
end
