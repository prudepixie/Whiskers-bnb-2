class WelcomeController < ApplicationController
  def index
    @hosts = Host.all
  end
end
