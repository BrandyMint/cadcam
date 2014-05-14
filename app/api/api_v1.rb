require 'action_controller/metal/strong_parameters'

class API_v1 < Grape::API
  version 'v1'
  format :json

  resource :photo do
    params do
      requires :latitude,  type: Float
      requires :longitude, type: Float
      requires :device_id, type: String
      requires :image,     type: Rack::Multipart::UploadedFile
      optional :comment,   type: String
    end

    post do
      photo_params = ActionController::Parameters.new(params).permit(:latitude, :longitude, :device_id, :image, :comment)

      # Почему-то strong_parameters его режет
      photo_params[:image]= params[:image]

      photo = Photo.create! photo_params

      present photo, with: EntityPhoto
    end
  end

end
