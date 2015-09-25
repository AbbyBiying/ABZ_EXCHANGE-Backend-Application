require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "POST #create" do
    context 'when password is invalid' do
      it 'renders the page with error' do
        user = create(:user)

        post :create, session: { username: user.username, password: "invalid" }

        expect(response).to render_template(:new)
       end
    end

    context 'when password is valid' do
      it 'sets the user in the session and redirects them to their dashboard' do
        user = create(:user)

        post :create, session: { username: user.username, password: user.password_digest }

        expect(response).to redirect_to root_path
        expect(controller.current_user).to eq user
      end
    end
  end
end
