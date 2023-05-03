class ChangeFormatOfCounts < ActiveRecord::Migration[7.0]
  def change
    change_column :urls, :clicks_count, :bigint
    change_column :urls, :unique_clicks_count, :bigint
  end
end
