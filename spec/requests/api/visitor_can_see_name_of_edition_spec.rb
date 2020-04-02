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

    it ' returns a "session" object with location and edition name Stockholm' do
      post "/api/sessions", params: { location: {latitude: 59.31, longitude: 18.07 }}
      binding.pry
      expect(response_json["session"]["edition"]).to eq "Stockholm kommun"
    end
  end
end