class CreateClicksTable < ActiveRecord::Migration[7.0]
  def change
    create_table :clicks do |t|
      t.string :platform
      t.string :country
      t.string :operating_system
      t.string :source

      t.timestamps
    end

    add_reference :clicks, :url, foreign_key: true
  end
end
