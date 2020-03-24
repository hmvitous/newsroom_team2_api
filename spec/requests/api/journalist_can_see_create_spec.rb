RSpec.describe 'POST /auth/sign_in', type: :request do
    let(:headers) { { HTTP_ACCEPT: 'application/json' } }
    let(:user) { create(:user) }
    let(:expected_response) do
      {
        'data' => {
          'id' => user.id, 'role' => user.role, 'name' => user.name, 'uid' => user.email, 'email' => user.email,
          'provider' => 'email', 'allow_password_change' => false
        }
      }
    end

    describe 'with valid credentials' do
      before do
        post '/auth/sign_in',
             params: {
               email: user.email,
               password: user.password
             },
             headers: headers
      end
  
      it 'returns 200 response status' do
        expect(response). to have_http_status 200
      end
  
      it 'returns the expected response' do
        expect(response_json).to eq expected_response
      end
    end
end