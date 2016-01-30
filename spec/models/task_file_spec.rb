require 'rails_helper'

RSpec.describe TaskFile, type: :model do
  describe 'associations' do
    specify do
      expect(subject).to belong_to(:task).touch(true)
    end
  end

  describe 'validations' do
    specify do
      expect(subject).to validate_presence_of(:task)
    end
  end
end
