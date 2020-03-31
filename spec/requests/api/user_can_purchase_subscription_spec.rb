require 'stripe_mock'

RSpec.describe 'POST api/subscription', type: :request do
    let!(:stripe_helper) { StripeMock.create_test_helper }
    before(:each) { StripeMock.start }
    after(:each) { StripeMock.stop }

    let(:card_token) { stripe_helper.generate_card_token }
    let(:invalid_token) { "12345678910" }

    let(:product) {stripe_helper.create_product}
    let!(:plan) { stripe_helper.create_plan(
        id: 'urban_subscription',
        amount: 699,
        currency: 'usd',
        interval: 'year',
        interval_count: 1,
        name: 'Urban living subscription',
        product: product.id
    )}

    let(:user) { create(:user, role: 'registered_user') }
    let(:user_credentials) { user.create_new_auth_token }
    let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials) }
  
    describe "User buys subscription" do
    before do
        post '/api/subscriptions',
        params: {
            stripeToken: card_token,
            email: "user@mail.com"
        },
        headers: headers
        user.reload
    end

    it "check if subscription route is there" do
        expect(response.status).to eq 200
    end

    it "check if user bought a subscription" do
        expect(response_json['message']).to eq "Transaction cleared"
    end
  end

  describe "Unsuccessfully invalid token" do
    before do
        post '/api/subscriptions',
        params: {
            stripeToken: invalid_token,
            email: "user@mail.com"
        },
        headers: headers
        user.reload
    end

    it "user token invalid" do
        expect(response.status).to eq 400
    end

    it "invalid token error message" do
        expect(response_json['error_message']).to eq "Invalid token id: 12345678910"
    end
  end

  describe "Without token" do
    before do
        post '/api/subscriptions',
        params: {
            email: "user@mail.com"
        },
        headers: headers
        user.reload
    end

    it "user doesnt have token" do
        expect(response.status).to eq 400
    end

    it "error message for missing token" do
        expect(response_json['error_message']).to eq "No stripe token sent"
    end
  end

  describe "When user is not login" do
    before do
        post '/api/subscriptions',
        params: {
            stripeToken: card_token,
        }
    end

    it "user not logged in" do
        expect(response.status).to eq 401
    end

    it "user not logged in error message" do
        expect(response_json['errors'].first).to eq "You need to sign in or sign up before continuing."
    end
  end

#   describe "When stripe declines subscription for user" do
#     before do

#         custom_error = StandarError.new("Subscription couldn't be created")
#         StripeMock.prepare_error(custom_error, :create_subscription )
#         post '/api/subscriptions',
#         params: {
#             stripeToken: card_token,
#             email: user.email
#         }
#         headers: headers
#         user.reload
#     end

#     it "check if subcription route is there" do
#         expect(response.status).to eq 400
#     end

#     it "returns error message" do
#         expect(response_json['status']).to eq "paid"
#     end
#   end
end