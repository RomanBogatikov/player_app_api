class CreateLedgers < ActiveRecord::Migration[5.2]
  def change
    create_table :ledgers do |t|
      t.references :song, foreign_key: true
      t.references :playlist, foreign_key: true
      t.integer :plays

      t.timestamps
    end
  end
end
