class WelcomeController < ApplicationController
  def index
    @tasks = Task.preload(:user).order(updated_at: :desc)
  end
end
