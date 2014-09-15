class AddDropboxPathToImages < ActiveRecord::Migration
  def change
    add_column :images, :dropbox_path, :string
    add_index  :images, :dropbox_path, unique: true
  end
end
