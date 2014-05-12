require 'spec_helper'

describe API do
  describe "post /api/v1/cadcam" do
    it "return url" do
      image = Rack::Test::UploadedFile.new(File.join(ActionController::TestCase.fixture_path, "test.jpg"), 'image/jpg')

      post '/api/v1/cadcam', latitude: -10, longitude: +60, device_id: "112233aa", image: image, comment: "test"

      expect(response).to be_success
      expect(response.body).to eq(EntityPhoto.new(Photo.last).to_json) 
    end
  end
end
