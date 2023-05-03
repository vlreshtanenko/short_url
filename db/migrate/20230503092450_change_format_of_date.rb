class ChangeFormatOfDate < ActiveRecord::Migration[7.0]
  def change
    change_column :clicks, :slug, :date
  end
end
