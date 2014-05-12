require 'spec_helper'

describe API do
  describe "post /api/v1/cadcam" do
    it "return url" do
      image = fixture_file_upload('test.jpg', 'image/jpg')
      post '/api/v1/cadcam', latitude: -10, longitude: +60, device_id: "112233aa", image: image, comment: "test"
      binding.pry
    end
  end
end
