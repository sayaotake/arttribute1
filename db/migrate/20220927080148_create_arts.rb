class CreateArts < ActiveRecord::Migration[6.1]
  def change
    create_table :arts do |t|
      t.string :title
      t.string :artist
      t.text :about
      t.string :adress

      t.timestamps
    end
  end
end
