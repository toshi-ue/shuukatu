class Managers::PositionsController < ApplicationController
  before_action :set_managers_position, only: [:show, :edit, :update, :destroy]

  # GET /managers/positions
  # GET /managers/positions.json
  def index
    @managers_positions = Managers::Position.all
  end

  # GET /managers/positions/1
  # GET /managers/positions/1.json
  def show
  end

  # GET /managers/positions/new
  def new
    @managers_position = Managers::Position.new
  end

  # GET /managers/positions/1/edit
  def edit
  end

  # POST /managers/positions
  # POST /managers/positions.json
  def create
    @managers_position = Managers::Position.new(managers_position_params)

    respond_to do |format|
      if @managers_position.save
        format.html { redirect_to @managers_position, notice: 'Position was successfully created.' }
        format.json { render :show, status: :created, location: @managers_position }
      else
        format.html { render :new }
        format.json { render json: @managers_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /managers/positions/1
  # PATCH/PUT /managers/positions/1.json
  def update
    respond_to do |format|
      if @managers_position.update(managers_position_params)
        format.html { redirect_to @managers_position, notice: 'Position was successfully updated.' }
        format.json { render :show, status: :ok, location: @managers_position }
      else
        format.html { render :edit }
        format.json { render json: @managers_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managers/positions/1
  # DELETE /managers/positions/1.json
  def destroy
    @managers_position.destroy
    respond_to do |format|
      format.html { redirect_to managers_positions_url, notice: 'Position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_managers_position
      @managers_position = Managers::Position.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def managers_position_params
      params.require(:managers_position).permit(:title, :description, :address, :latitude, :longitude, :manager_id)
    end
end
