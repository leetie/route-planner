class InputsController < ApplicationController
  before_action :set_input, only: [:show, :edit, :update, :destroy]

  # GET /inputs
  # GET /inputs.json
  def index
    @inputs = Input.all
  end

  # GET /inputs/1
  # GET /inputs/1.json
  def show
  end

  # GET /inputs/new
  def new
    @input = Input.new
  end

  # GET /inputs/1/edit
  def edit
  end

  # POST /inputs
  # POST /inputs.json
  def create
    @input = Input.new(input_params)

    respond_to do |format|
      if @input.save
        @file = @input.input_file.download
        data = CSV.parse(@file, headers: true)
        # TODO S in SOLID
        coords_ary = []
        data.each do |i|
          # iterate each row (address), call geolocate api for each
          # to get lat-lon coords
          i = i.to_h
          zip = i["Zipcode"]
          addr = i["Address"]
          town = i["Town"]
          state = i["State"]
          # POST or GET
          response = RestClient.get "https://app.geocodeapi.io/api/v1/search?apikey=#{ENV['GEOLOCATION_KEY']}&text=#{addr},#{town},#{state},#{zip},United States"
          parsed = JSON.parse(response)
          coords = parsed["features"][0]["geometry"]["coordinates"].reverse
          puts "coordinates for #{addr}, #{town} #{state}, #{zip}"
          puts coords
          coords_ary << coords
          File.write('response.json', parsed)
        end
        osrm_api(coords_ary)
        format.html { redirect_to @input, notice: 'Input was successfully created.' }
        format.json { render :show, status: :created, location: @input }
      else
        format.html { render :new }
        format.json { render json: @input.errors, status: :unprocessable_entity }
      end
    end
  end

  def osrm_api(coords)
    # coords is array of coordinates, eg 
    # [
    #   [0.0,0.0],
    #   [1.1,1.1]
    # ]

    # for some reason, the input expected by osrm and address->coord api is expected to be the reverse of a service like google.

    #iterate through array of coordinates, generate string for api call to OSRM
    str = ""
    coords.each do |i|
      # reversing order here
      str << i[1].to_s
      str << ","
      str << i[0].to_s
      #append semicolon to query string if this is not the last coord pair
      if i != coords[-1]
        str << ";"
      end
    end
    p "coords are #{coords}"
    p "str is #{str}"

    response = RestClient.get("127.0.0.1:5000/trip/v1/driving/#{str}")
    puts response
    # TODO
    # move this logic to models where it belongs
    # write methods for handling OSRM response
    # break up methods
  end

  # PATCH/PUT /inputs/1
  # PATCH/PUT /inputs/1.json
  def update
    respond_to do |format|
      if @input.update(input_params)
        format.html { redirect_to @input, notice: 'Input was successfully updated.' }
        format.json { render :show, status: :ok, location: @input }
      else
        format.html { render :edit }
        format.json { render json: @input.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inputs/1
  # DELETE /inputs/1.json
  def destroy
    @input.destroy
    respond_to do |format|
      format.html { redirect_to inputs_url, notice: 'Input was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_input
      @input = Input.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def input_params
      params.require(:input).permit(:input_file)
    end
end
