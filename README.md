# Route planner built with Rails and OSRM 🚚

`rails active_storage:install rails db:migrate`

#### OSRM server will be running locally in a docker container listening on port 5000

- sudo docker run -t -i -p 5000:5000 -v "${PWD}:/data" osrm/osrm-backend osrm-routed --algorithm mld /data/your-data-latest.osrm

# TODO

- Pass array of lon-lat coordinates to OSRM api
- Build output file from response, add errors to array
- Catch routing errors. Search within certain radius??
