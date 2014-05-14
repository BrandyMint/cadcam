class EntityImage < Grape::Entity
  expose :original_url, proc: ->(object, env){ object.url }
  expose :main_url,     proc: ->(object, env){ object.url(:main) }
  expose :thumb_url,    proc: ->(object, env){ object.url(:thumb) }
end
