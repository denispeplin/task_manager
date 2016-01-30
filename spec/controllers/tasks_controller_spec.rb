require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  render_views

  let(:user) { create :user }

  before { login_user(user) }

  describe 'GET #index' do
    let!(:task1) { create :task, user: user }
    let!(:task2) { create :task, user: user }
    let(:other_user) { create :user }
    let!(:other_task) { create :task, user: other_user }

    specify do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:tasks)).to match_array([task1, task2])
    end
  end
end
