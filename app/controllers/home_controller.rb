class HomeController < ApplicationController
  def index
    @content = File.read("public/about.txt")
  end
end