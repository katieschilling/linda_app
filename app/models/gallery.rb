class Gallery < ActiveRecord::Base
  has_many :images

  private

  def source
    dropbox.find dropbox_path
  end
end
