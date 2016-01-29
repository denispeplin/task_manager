require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    specify do
      expect(subject).to have_many(:tasks)
    end
  end
end
