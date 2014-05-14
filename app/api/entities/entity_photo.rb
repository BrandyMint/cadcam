class EntityPhoto < Grape::Entity
  expose :id
  expose :image, using: EntityImage do |photo, options|
    photo.image
  end
  expose :url do |photo, options|
    Rails.application.routes.url_helpers.photo_url photo
  end
end
