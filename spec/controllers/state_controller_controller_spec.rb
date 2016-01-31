require 'rails_helper'

RSpec.describe StateControllerController, type: :controller do
  render_views

  let(:user) { create :user }

  before { login_user user }

  describe 'GET #start' do
    let!(:task) { create :task, user: user }

    before do
      xhr :post, :start, id: task.id
    end

    specify do
      expect(response).to have_http_status(:success)
      expect(response).to render_template('state_controller/start')
      expect(task.reload).to be_started
    end
  end

  describe 'GET #finish' do
    let!(:task) { create :task, :started, user: user }

    before do
      xhr :post, :finish, id: task.id
    end

    specify do
      expect(response).to have_http_status(:success)
      expect(response).to render_template('state_controller/finish')
      expect(task.reload).to be_finished
    end
  end
end
