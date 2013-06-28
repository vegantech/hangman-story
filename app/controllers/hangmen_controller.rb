class HangmenController < ApplicationController
  before_action :set_hangman, only: [:show, :edit, :update, :destroy]

  # GET /hangmen
  # GET /hangmen.json
  def index
    @hangmen = Hangman.all
  end

  # GET /hangmen/1
  # GET /hangmen/1.json
  def show
  end

  # GET /hangmen/new
  def new
    @hangman = Hangman.new
  end

  # GET /hangmen/1/edit
  def edit
  end

  # POST /hangmen
  # POST /hangmen.json
  def create
    @hangman = Hangman.new(hangman_params)

    respond_to do |format|
      if @hangman.save
        format.html { redirect_to @hangman, notice: 'Hangman was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hangman }
      else
        format.html { render action: 'new' }
        format.json { render json: @hangman.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hangmen/1
  # PATCH/PUT /hangmen/1.json
  def update
    respond_to do |format|
      if @hangman.update(hangman_params)
        format.html { redirect_to @hangman, notice: 'Hangman was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hangman.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hangmen/1
  # DELETE /hangmen/1.json
  def destroy
    @hangman.destroy
    respond_to do |format|
      format.html { redirect_to hangmen_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hangman
      @hangman = Hangman.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hangman_params
      params.require(:hangman).permit(:solution, :title, :puzzle)
    end
end
