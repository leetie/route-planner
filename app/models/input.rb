class Input < ApplicationRecord
  has_one_attached :input_file


  # geocode api methods
  def convert_to_csv
    # turn input file into CSV 
  end

  def generate_geocode_str
    
  end

  def call_geocode_api

  end

  def write_geocode_response

  end

  def parse_geocode_response

  end

  def get_coordinate_array
    
  end

  #osrm api methods
  def generate_query_string

  end

  def call_osrm_api

  end

  def parse_osrm_response

  end

end
