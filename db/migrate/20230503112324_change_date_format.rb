class ChangeDateFormat < ActiveRecord::Migration[7.0]
  def change
    change_column :clicks, :date, :date
    change_column :clicks, :slug, :string
  end
end
