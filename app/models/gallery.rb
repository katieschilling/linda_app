class Gallery < ActiveRecord::Base
  has_many :images

  def to_param
    title.parameterize
  end

  private

  def source
    dropbox.find dropbox_path
  end
end
