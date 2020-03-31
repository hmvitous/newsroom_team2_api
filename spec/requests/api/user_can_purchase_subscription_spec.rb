RSpec.describe 'POST api/subscription', type: :request do
    let!(:stripe_helper)


    let(:user) { create(:user, role: 'registered_user') }
    let(:user_credentials) { user.create_new_auth_token }
    let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials) }
  
    describe "User buys subscription" do
    before do
        post '/api/subscriptions',
        params: {
            stripeToken: "123456",
            email: "user@mail.com"
        }
        headers: headers
        user.reload
    end

    it "check if subcription route is there" do
        expect(response.status).to eq 200
    end

    it "check if user bought a subcription" do
        expect(response_json['status']).to eq "paid"
    end

    it 'creates or retrieves a customer on stripe' do
        expect(Stripe::Customer.list.data.first.email).to eq ''
    end
  end

  describe "Unsuccessfully invalid token" do
    before do
        post '/api/subscriptions',
        params: {
            stripeToken: "123456",
            email: "user@mail.com"
        }
        headers: headers
        user.reload
    end

    it "check if subcription route is there" do
        expect(response.status).to eq 400
    end

    it "check if user bought a subcription" do
        expect(response_json['status']).to eq "paid"
    end

    it 'creates or retrieves a customer on stripe' do
        expect(Stripe::Customer.list.data.first.email).to eq ''
    end
  end

  describe "Without token" do
    before do
        post '/api/subscriptions',
        params: {
            stripeToken: "",
            email: "user@mail.com"
        }
        headers: headers
        user.reload
    end

    it "check if subcription route is there" do
        expect(response.status).to eq 200
    end

    it "check if user bought a subcription" do
        expect(response_json['status']).to eq "paid"
    end

    it 'creates or retrieves a customer on stripe' do
        expect(Stripe::Customer.list.data.first.email).to eq ''
    end
  end

  describe "When user is not login" do
    before do
        post '/api/subscriptions',
        params: {
            stripeToken: "123456",
            email: "user@mail.com"
        }
        headers: headers
        user.reload
    end

    it "check if subcription route is there" do
        expect(response.status).to eq 200
    end

    it "check if user bought a subcription" do
        expect(response_json['status']).to eq "paid"
    end

    it 'creates or retrieves a customer on stripe' do
        expect(Stripe::Customer.list.data.first.email).to eq ''
    end
  end


end