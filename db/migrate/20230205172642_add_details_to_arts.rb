class AddDetailsToArts < ActiveRecord::Migration[6.1]
  def change
    add_column :arts, :lat, :float
    add_column :arts, :lng, :float
  end
end
