# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
dropbox_directories.find_all(&:is_dir).each do |dir|
  gallery = Gallery.find_or_create_by! dropbox_path: dir.path do |g|
              g.title = dir.path.split('/').last
            end

  dir.ls.reject(&:is_dir).each do |file|
    Image.find_or_create_by! dropbox_path: file.path do |img|
      img.title = file.path.split('/').last.gsub('.jpg', '')
      img.gallery = gallery
    end
  end
end
