class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :case
      t.references :round
      t.text :observed
      t.string :status
      t.timestamps
    end
    add_index :results, :case_id
    add_index :results, :round_id
  end
end
