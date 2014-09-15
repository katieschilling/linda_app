class Image < ActiveRecord::Base
  belongs_to :gallery

  def url
    @url ||= source.direct_url.url
  end

  private

  def source
    dropbox.ls(dropbox_path).first
  end
end
