class AddSlugToClicks < ActiveRecord::Migration[7.0]
  def change
    add_column :clicks, :slug, :string
  end
end
