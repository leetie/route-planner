{
  "geocoding"=>{
    "version"=>"0.2",
    "attribution"=>"https://geocodeapi.io/attribution",
    "query"=>{
      "text"=>"85 Manchester St,Concord,NH,03301,United States",
      "size"=>10,
      "private"=>false,
      "lang"=>{
        "name"=>"English",
        "iso6391"=>"en",
        "iso6393"=>"eng",
        "defaulted"=>true
      },
      "querySize"=>20,
      "parser"=>"libpostal",
      "parsed_text"=>{
        "housenumber"=>"85",
        "street"=>"manchester st",
        "city"=>"concord",
        "state"=>"nh",
        "postalcode"=>"03301",
        "country"=>"united states"
      }
    },
    "engine"=>{
      "name"=>"Pelias",
      "author"=>"Mapzen",
      "version"=>"1.0"
    },
    "timestamp"=>1607294894082
  },
  "type"=>"FeatureCollection",
  "features"=>[
    {
      "type"=>"Feature",
      "geometry"=>{
        "type"=>"Point",
        "coordinates"=>[
          -71.5103568,
          43.1914536
        ]
      },
      "properties"=>{
        "id"=>"polyline:27146412",
        "gid"=>"openaddresses:address:polyline:27146412",
        "layer"=>"address",
        "source"=>"openaddresses",
        "source_id"=>"polyline:27146412",
        "name"=>"85 Manchester Street",
        "housenumber"=>"85",
        "street"=>"Manchester Street",
        "confidence"=>0.8,
        "match_type"=>"interpolated",
        "accuracy"=>"point",
        "country"=>"United States",
        "country_gid"=>"whosonfirst:country:85633793",
        "country_a"=>"USA",
        "region"=>"New Hampshire",
        "region_gid"=>"whosonfirst:region:85688689",
        "region_a"=>"NH",
        "county"=>"Merrimack County",
        "county_gid"=>"whosonfirst:county:102086515",
        "county_a"=>"ME",
        "localadmin"=>"Concord",
        "localadmin_gid"=>"whosonfirst:localadmin:404477159",
        "locality"=>"Concord",
        "locality_gid"=>"whosonfirst:locality:85975075",
        "continent"=>"North America",
        "continent_gid"=>"whosonfirst:continent:102191575",
        "label"=>"85 Manchester Street, Concord, NH, USA"
      }
    }
  ],
  "bbox"=>[
    -71.5103568,
    43.1914536,
    -71.5103568,
    43.1914536
  ]
}