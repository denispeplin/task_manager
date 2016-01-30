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

    before do
      get :index
    end

    specify do
      expect(response).to have_http_status(:success)
      expect(assigns(:tasks)).to eq([task2, task1])
    end
  end

  describe 'POST #create' do
    context 'successfull creation' do
      let(:task) { build :task }

      before do
        xhr :post, :create, task: task.attributes
      end

      specify do
        expect(response).to have_http_status(:success)
        expect(response).to render_template('tasks/_task')
        expect(response).to render_template('tasks/_form')
        expect(response).to render_template('tasks/create')
        expect(assigns(:task)).to be_persisted
      end
    end

    context 'invalid task' do
      let(:task) { build :task, name: '' }

      before do
        xhr :post, :create, task: task.attributes
      end

      specify do
        expect(response).to have_http_status(:success)
        expect(response).to render_template('tasks/create')
        expect(assigns(:task)).to be_new
        expect(assigns(:task)).to_not be_valid
      end
    end
  end

  describe 'GET #edit' do
    let(:task) { create :task, user: user }

    before do
      xhr :get, :edit, id: task.id
    end

    specify do
      expect(response).to have_http_status(:success)
      expect(response).to render_template('tasks/edit')
      expect(response).to render_template('tasks/_form')
      expect(assigns(:task).id).to eq(task.id)
    end
  end

  describe 'PUT #update' do
    context 'successful update' do
      let(:task) { create :task, user: user }

      before do
        task.assign_attributes(name: 'new name', description: 'new description')
        xhr :put, :update, id: task.id, task: task.attributes
      end

      specify do
        expect(response).to have_http_status(:success)
        expect(response).to render_template('tasks/update')
        expect(response).to render_template('tasks/_form')
        expect(response).to render_template('tasks/_task')
        expect(assigns(:task).id).to eq(task.id)
        expect(assigns(:task).slice(:name, :description)).
          to eq('name' => 'new name', 'description' => 'new description')
      end
    end

    context 'invalid task' do
      let(:task) { create :task, user: user }

      before do
        task.assign_attributes(name: '')
        xhr :put, :update, id: task.id, task: task.attributes
      end

      specify do
        expect(response).to have_http_status(:success)
        expect(response).to render_template('tasks/update')
        expect(assigns(:task).id).to eq(task.id)
        expect(assigns(:task)).to_not be_valid
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:task) { create :task, user: user }

    before do
      xhr :delete, :destroy, id: task.id
    end

    specify do
      expect(response).to have_http_status(:success)
      expect(response).to render_template('tasks/destroy')
      expect(assigns(:task).id).to eq(task.id)
      expect(assigns(:task)).to be_destroyed
    end
  end
end
