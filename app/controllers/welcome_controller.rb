class WelcomeController < ApplicationController
  def index
    @tasks = Task.preload(:user).order(created_at: :desc)
  end
end
