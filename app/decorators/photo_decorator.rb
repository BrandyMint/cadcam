class PhotoDecorator < Draper::Decorator
  delegate_all

  def image_tag version=:main
    h.image_tag source.image.url version
  end

  def position
    source.position.join ','
  end

  def url
    h.photo_url source
  end
end
