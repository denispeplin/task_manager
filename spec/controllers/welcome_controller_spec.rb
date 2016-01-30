require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  render_views

  let(:user) { create :user }

  before { login_user(user) }

  describe 'GET #index' do
    let(:user1) { create :user }
    let(:user2) { create :user }
    let!(:task1) { create :task, user: user1 }
    let!(:task2) { create :task, user: user2 }
    let!(:task3) { create :task, user: user2 }

    specify do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:tasks)).to eq([task3, task2, task1])
    end
  end
end
