class QuotesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_quote, only: %i[show edit update destroy]
  before_action :set_search

  def index
    @q = Quote.ransack(params[:q])
    @quotes = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = current_user.quotes.build(quote_params)
    if @quote.save
      redirect_to quotes_path, notice: 'Quote was successfully created.'
    else
      render :new
    end
  
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def edit
  end

  def update
    if @quote.update(quote_params)
      redirect_to quote_path(@quote), notice: 'Quote was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, notice: 'Quote was successfully deleted.'
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:content, :source, :scene)
  end

  def set_search
    @q = Quote.ransack(params[:q])
  end


end
