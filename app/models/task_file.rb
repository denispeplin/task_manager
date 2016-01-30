class TaskFile < ActiveRecord::Base
  has_attached_file :attachment

  belongs_to :task, touch: true

  validates :task, presence: true
  do_not_validate_attachment_file_type :attachment # PROTOTYPE ONLY
end
