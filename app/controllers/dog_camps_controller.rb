class DogCampsController < ApplicationController
  before_action :set_dog_camp, only: [:show, :edit, :update, :destroy]

  # GET /dog_camps
  # GET /dog_camps.json
  def index
    @dog_camps = DogCamp.all
  end

  # GET /dog_camps/1
  # GET /dog_camps/1.json
  def show
  end

  # GET /dog_camps/new
  def new
    @dog_camp = DogCamp.new
  end

  # GET /dog_camps/1/edit
  def edit
  end

  # POST /dog_camps
  # POST /dog_camps.json
  def create
    @dog_camp = DogCamp.new(dog_camp_params)

    respond_to do |format|
      if @dog_camp.save
        format.html { redirect_to @dog_camp, notice: 'Dog camp was successfully created.' }
        format.json { render :show, status: :created, location: @dog_camp }
      else
        format.html { render :new }
        format.json { render json: @dog_camp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dog_camps/1
  # PATCH/PUT /dog_camps/1.json
  def update
    respond_to do |format|
      if @dog_camp.update(dog_camp_params)
        format.html { redirect_to @dog_camp, notice: 'Dog camp was successfully updated.' }
        format.json { render :show, status: :ok, location: @dog_camp }
      else
        format.html { render :edit }
        format.json { render json: @dog_camp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dog_camps/1
  # DELETE /dog_camps/1.json
  def destroy
    @dog_camp.destroy
    respond_to do |format|
      format.html { redirect_to dog_camps_url, notice: 'Dog camp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog_camp
      @dog_camp = DogCamp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dog_camp_params
      params.require(:dog_camp).permit(:name, :address, :capacity)
    end
end
