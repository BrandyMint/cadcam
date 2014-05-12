class API_v1 < Grape::API
  #version 'v1', using: :header
  format :json

  helpers do
    params :photo do
      requires :latitude 
      requires :longitude
      requires :device_id
      requires :image
      optional :comment
    end
  end

  params do
    use :photo
  end

  post '/cadcam' do
    photo = Photo.create params[:photo]

    present photo, with: Entities::Photo
  end

end
