class RenameAdressColumnToArts < ActiveRecord::Migration[6.1]
  def change
    rename_column :arts, :adress, :address
  end
end
