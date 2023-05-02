class AddDateToClicks < ActiveRecord::Migration[7.0]
  def change
    add_column :clicks, :date, :string
  end
end
