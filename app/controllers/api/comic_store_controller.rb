class Api::ComicStoreController < ApplicationController
  def index
    @comics = Comic.all

    render "index.json.jb"
  end

  def show
  end
end
