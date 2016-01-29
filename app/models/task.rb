class Task < ActiveRecord::Base
  include AASM

  belongs_to :user

  aasm column: :state do
    state :new, initial: true
    state :started
    state :finished

    event :start do
      transitions from: :new, to: :started
    end

    event :finish do
      transitions from: :new, to: :finished
      transitions from: :started, to: :finished
    end
  end
end
