class Image < ActiveRecord::Base
  belongs_to :gallery

  def url
    @url ||= source.direct_url.url
  end

  def thumbnail
    @thumbnail ||= thumbnail_file.direct_url.url
  end

  def thumbnail_file
    dropbox.find("images_website/thumbs/#{title}.jpg")
  end

  def thumbnail_source
    source.thumbnail size: 'l'
  end

  private

  def source
    dropbox.ls(dropbox_path).first
  end
end
