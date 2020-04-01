RSpec.describe Api::SessionsController, type: :request do
  describe "POST api/sessions" do

    it ' returns a "session" object with location and edition name for outside Västerås and Seattle' do
      post "/api/sessions", params: { location: {latitude: 48.85, longitude: 2.35 }}
      expect(response_json["session"]["edition"]).to eq "Global"
    end

    it ' returns a "session" object with location and edition name for Västerås kommun' do
      post "/api/sessions", params: { location: {latitude: 59.59, longitude: 16.67 }}
      expect(response_json["session"]["edition"]).to eq "Västerås kommun"
    end

    it ' returns a "session" object with location and edition name Seattle' do
      post "/api/sessions", params: { location: {latitude: 47.60, longitude: -122.33 }}
      expect(response_json["session"]["edition"]).to eq "King County"
    end
  end
end