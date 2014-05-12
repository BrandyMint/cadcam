class API_v1 < Grape::API
  #version 'v1', using: :header
  format :json

  params do
    requires :latitude 
    requires :longitude
    requires :device_id
    requires :image
    optional :comment
  end

  post '/cadcam' do
    photo = Photo.create latitude: params[:latitude], longitude: params[:longitude], device_id: params[:device_id], image: params[:image], comment: params[:comment]

    present photo, with: EntityPhoto
  end

end
