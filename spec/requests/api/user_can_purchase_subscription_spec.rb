RSpec.describe 'POST api/subscription', type: :request do
    describe "User buys subscription" do
    before do
        post '/api/subscriptions',
        params: {
            stripeToken: "123456",
            email: "user@mail.com"
        }
    end

    it "check if subcription route is there" do
        expect(response.status).to eq 200
    end

    it "check if user bought a subcription" do
        expect(response_json['status']).to eq "paid"
    end
  end
end