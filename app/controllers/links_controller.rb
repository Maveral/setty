class LinksController < ApplicationController
  def index
    @links = File.readlines("public/links.txt")
  end
end