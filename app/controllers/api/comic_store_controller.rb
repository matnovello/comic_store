class Api::ComicStoreController < ApplicationController
  def index
    @comics = Comic.all

    render "index.json.jb"
  end

  def show
    @comic = Comic.find_by(id: params[:id])
    # @id = @comic.id
    # @name = @comic.name
    # @year = @comic.year
    # @price = @comic.price
    # @rarity = @comic.rarity
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
    @random_year = Random.new.rand(1990..2000)
    @random_rarity = Random.new.rand(1..10)
    @random_price = Random.new.rand(20..30)

    @comic = Comic.new({
      name: params[:name] || Faker::TvShows::RickAndMorty.character,
      year: params[:year] || @random_year,
      price: params[:price] || @random_price,
      rarity: params[:rarity] || @random_rarity,
    })
    @comic.save
    render "show.json.jb"
  end

  def destroy
    @comic = Comic.find_by(id: params[:id])
    @comic.destroy
    render json: { message: "#{@comic.name} of ID number #{@comic.id} was destroyed" }
  end
end
