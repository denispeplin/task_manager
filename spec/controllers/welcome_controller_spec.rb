require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  render_views

  describe 'GET #index' do
    let(:user1) { create :user }
    let(:user2) { create :user }
    let!(:task1) { create :task, user: user1 }
    let!(:task2) { create :task, user: user2 }
    let!(:task3) { create :task, user: user2 }

    specify do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:tasks)).to match_array([task1, task2, task3])
    end
  end
end
