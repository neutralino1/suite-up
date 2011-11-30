class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :theme

      t.timestamps
    end
    add_index :rounds, :theme_id
  end
end
