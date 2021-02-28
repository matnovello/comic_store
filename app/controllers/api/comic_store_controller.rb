class Api::ComicStoreController < ApplicationController
  def index
    @comics = Comic.all

    render "index.json.jb"
  end

  def show
    @comic = Comic.find_by(id: params[:id])
    @id = @comic.id
    @name = @comic.name
    @year = @comic.year
    @price = @comic.price
    @rarity = @comic.rarity
    render "show.json.jb"
  end

  def patch
    @comic = Comic.find_by(id: params[:id])
    @id = @comic.id
    @name = params[:name] || @comic.name
    @year = params[:year] || @comic.year
    @price = params[:price] || @comic.price
    @rarity = params[:rarity] || @comic.rarity

    @comic.save
    render "show.json.jb"
  end

  def create
  end
end
