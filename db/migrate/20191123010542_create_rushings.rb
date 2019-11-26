class CreateRushings < ActiveRecord::Migration[6.0]
  def change
    create_table :rushings do |t|
      t.string :player
      t.string :team
      t.string :pos
      t.integer :att
      t.integer :att_g
      t.integer :yds
      t.float :avg
      t.integer :yds_g
      t.integer :td
      t.string :lng
      t.integer :first
      t.integer :first_pct
      t.integer :twenty_plus
      t.integer :forty_plus
      t.integer :fum
    end

    add_index :rushings, :player

  end
end
