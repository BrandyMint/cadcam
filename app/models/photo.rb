class Photo < ActiveRecord::Base

  scope :ordered, -> { order 'created_at desc' }

  mount_uploader :image, ImageUploader

  validates :longitude, :latitude, :device_id, :image, presence: true

  #state_machine :state, initial: :hidden do
    #event :show do
      #transition :hidden => :displayed
    #end

    #event :hide do
      #transition :displayed => :hidden
    #end
  #end

  def position
    [longitude, latitude]
  end

end
