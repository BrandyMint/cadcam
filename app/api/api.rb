require 'grape-swagger'
class API < Grape::API
  mount API_v1
  add_swagger_documentation api_version: 'v1', markdown: true, base_path: '/api'
end
