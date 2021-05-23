class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]
  before_action :init_html_options, only: [:index, :show]

  def index
    @lists = List.all
    @html_options[:banner] = { image: 'myke-simon-atsUqIm3wxo-unsplash.jpg' }
  end

  def show

    # @html_options[:banner] = { image: @list.bookmarks.sample.movie.poster_url }
    @html_options[:banner] = {}
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

  def init_html_options
    @html_options = { action: "#{params[:controller]}-#{params[:action]}" }
  end
end
