require 'rails_helper'

RSpec.describe TaskFilesController, type: :controller do
  render_views

  let(:user) { create :user }

  before { login_user user }

  describe 'GET #destroy' do
    let(:task) { create :task, user: user }
    let(:task_file) { create :task_file, task: task }

    before do
      xhr :delete, :destroy, id: task_file.id
    end

    specify do
      expect(response).to have_http_status(:success)
      expect(response).to render_template('task_files/destroy')
      expect(response).to render_template('tasks/_task')
      expect(assigns(:task)).to eq(task)
      expect(assigns(:task_file).id).to eq(task_file.id)
      expect(assigns(:task_file)).to be_destroyed
    end
  end
end
