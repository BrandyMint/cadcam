class Photo < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  mount_uploader :image, PhotoUploader

  state_machine :state, initial: :hidden do
    event :show do
      transition all => :displayed
    end
    
    event :hide do
      transition all => :hidden
    end
  end

  def link
    photo_url(self)
  end
end
