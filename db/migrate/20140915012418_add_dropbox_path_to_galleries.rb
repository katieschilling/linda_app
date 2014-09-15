class AddDropboxPathToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :dropbox_path, :string
    add_index  :galleries, :dropbox_path, unique: true
  end
end
