RSpec.describe Api::SessionsController, type: :request do
  describe "POST api/sessions" do

    it ' returns a "session" object with location and edition name for Västerås' do
      post "/api/sessions", params: { location: {latitude: 59.60, longitude: 16.55 }}
      expect(response_json["session"]["edition"]).to eq "Västerås"
    end

    it ' returns a "session" object with location and edition name Seattle' do
      post "/api/sessions", params: { location: {latitude: 47.60, longitude: -122.33 }}
      expect(response_json["session"]["edition"]).to eq "Seattle"
    end
  end
end