class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.text :action
      t.text :expected
      t.references :theme

      t.timestamps
    end
    add_index :cases, :theme_id
  end
end
