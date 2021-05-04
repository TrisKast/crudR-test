# Test Project for Communication between several Docker Container

This is a small project to see and understand the way Docker container can communicate with eachother. Goal Setup: One Container is running a MySQL Client, the other a Shiny CRUD application for the mtcars dataset. 
Note that this example will only work with a specially tailored mtcars dataset, not the default one provided by R. 

#### Current State 
Currently the Shiny app is using SQLite which is run by itself. The MySQL database container ist set up, yet not connected.
The test dataset is due to small size and convenience at *external_data/mtcars.sqlite3*, but has to be moved out of the container and be mounted for persitent data storage.
To run the current Shiny container use:
```
docker run -d -v /path/to/mtcars.sqlite3_directory/:/srv/shiny-server/data -p 3838:3838 tristankast/crud-example:latest
```

- `-d`: Run the container in detached mode
- `-v`: Mount your local copy of the tailored dataset into the container
- `-p`: Expose under this port

Access the application under "http://localhost:3838/".