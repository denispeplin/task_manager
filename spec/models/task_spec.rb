require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    specify do
      expect(subject).to belong_to(:user)
      expect(subject).to have_many(:task_files).dependent(:destroy)
    end
  end

  describe 'delegations' do
    specify do
      expect(subject).to delegate_method(:email).to(:user).with_prefix
    end
  end

  describe 'validations' do
    specify do
      expect(subject).to validate_presence_of(:name)
      expect(subject).to validate_presence_of(:user)
    end
  end

  describe 'state machine' do
    let(:user) { create :user }

    context 'new' do
      subject { create :task, user: user }

      specify do
        expect(subject).to be_new
      end

      describe '#start' do
        before do
          subject.start!
        end

        specify do
          expect(subject.reload).to be_started
        end
      end

      describe '#finish' do
        before do
          subject.finish!
        end

        specify do
          expect(subject.reload).to be_finished
        end
      end
    end

    context 'started' do
      subject { create :task, :started, user: user }

      describe '#finish' do
        before do
          subject.finish!
        end

        specify do
          expect(subject.reload).to be_finished
        end
      end
    end
  end
end
