require 'rails_helper'

RSpec.describe TasksHelper do
  describe '#links_to_files' do
    let(:user) { create :user }
    let(:task) { create :task, user: user }
    let(:fixtures_path) { 'spec/fixtures/attachments' }
    attachments = %w(rails-logo.svg rails.txt rails.zip)

    before do
      attachments.map do |attachment|
        create :task_file,
          task: task,
          attachment: File.new(Rails.root.join(fixtures_path, attachment))
      end
    end

    specify do
      attachments.each do |attachment|
        expect(helper.links_to_files(task)).
          to match(Regexp.new("<a href=.*#{attachment}"))
      end
    end
  end
end
