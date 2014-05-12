class Photo < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  def link
    photo_url(self)
  end
end
