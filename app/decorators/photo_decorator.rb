class PhotoDecorator < Draper::Decorator
  delegate_all

  def image_tag version=:main
    h.image_tag source.image.url version
  end

  def position
    source.position.join ','
  end

  def location
    position
  end

  def url
    h.photo_url source
  end

  def created_at
    I18n.l source.created_at, format: :default
  end
end
