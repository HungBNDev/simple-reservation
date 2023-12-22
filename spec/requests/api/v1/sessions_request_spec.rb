# frozen_string_literal: true

RSpec.describe 'User Login', type: :request do
  let(:user) { create(:user) }
  let(:valid_credentials) { { email: user.email, password: user.password } }
  let(:invalid_credentials) { { email: user.email, password: 'wrong' } }

  describe 'POST /login' do
    context 'with valid credentials' do
      it 'authenticates the user' do
        post "/api/v1/users/sign_in", params: valid_credentials
        expect(response).to have_http_status(:ok) # Adjust based on your app's response
        # Test for token or session creation if applicable
      end
    end

    context 'with invalid credentials' do
      it 'does not authenticate the user' do
        post "/api/v1/users/sign_in", params: invalid_credentials
        expect(response).to have_http_status(:unauthorized) # Adjust based on your app's response
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user) }

    context 'when user is signed in' do
      before do
        # Simulate the user being signed in
        allow(controller).to receive(:authenticate_user!).and_return(true)
        allow(controller).to receive(:current_user).and_return(user)
      end

      # it 'invalidates the user token and returns a success message' do
      #   delete "/api/v1/users/sign_out", headers: { 'Authorization' => "Bearer #{user.generate_jwt}" }

      #   user.reload
      #   expect(response).to have_http_status(:unauthorized)
      #   expect(JSON.parse(response.body)["message"]).to eq('You have been successfully signed out.')
      # end
    end

    context 'when no user is signed in' do
      it 'returns an unauthorized response' do
        delete "/api/v1/users/sign_out"

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
