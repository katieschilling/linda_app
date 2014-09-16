class Image < ActiveRecord::Base
  belongs_to :gallery

  def to_param
    title.parameterize
  end

  def url
    @url ||= source.direct_url.url
  end

  def thumbnail
    @thumbnail ||= thumbnail_file.public_url.to_s
  end

  def thumbnail_file
    s3.objects["thumbs/#{title}.jpg"]
  end

  def thumbnail_source
    source.thumbnail size: 'l'
  end

  private

  def source
    dropbox.ls(dropbox_path).first
  end
end
