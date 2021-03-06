ActiveAdmin.register Photo do

  decorate_with PhotoDecorator

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #

  index do
    column :created_at
    column :image do |photo|
      photo.image_tag(:thumb)
    end
    column :position
    default_actions
  end


  form do |f|
    f.inputs do
      f.input :latitude
      f.input :longitude
      f.input :image
      f.input :device_id
      f.input :comment
      # f.input :state_event, as: :radio, collection: f.object.state_events
    end
    f.actions
  end
  permit_params :latitude, :longitude, :image, :comment, :device_id #, :state_event

  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
