class HomeController < ApplicationController
  def index
    @tasks = Task.all
  end

  def introduction
  end

  def services
  end

  def contact
  end

  def request_programmer
  end
end
