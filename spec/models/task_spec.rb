require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    specify do
      expect(subject).to belong_to(:user)
    end
  end

  describe 'state machine' do
    context 'new' do
      specify do
        expect(subject).to be_new
      end

      describe '#start' do
        before do
          subject.start
        end

        specify do
          expect(subject).to be_started
        end
      end

      describe '#finish' do
        before do
          subject.finish
        end

        specify do
          expect(subject).to be_finished
        end
      end
    end

    context 'started' do
      subject { build :task, :started }

      describe '#finish' do
        before do
          subject.finish
        end

        specify do
          expect(subject).to be_finished
        end
      end
    end
  end
end
