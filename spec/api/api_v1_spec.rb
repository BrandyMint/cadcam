require 'spec_helper'

describe API do
  describe "post /api/v1/cadcam" do
    let(:image) { Rack::Test::UploadedFile.new(File.join(ActionController::TestCase.fixture_path, "test.jpg"), 'image/jpg') }
    let(:params) { { latitude: -10, longitude: +60, device_id: "112233aa", image: image, comment: "test comment" } }

    it "post image and return url" do
      post '/api/v1/photo', params

      expect(response).to be_success
      expect(response.body).to eq(EntityPhoto.new(Photo.last).to_json)
    end
  end
end
