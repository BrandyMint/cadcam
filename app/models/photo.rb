class Photo < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  mount_uploader :image, PhotoUploader

  def link
    photo_url(self)
  end
end
