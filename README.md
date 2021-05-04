# Test Project for Communication between several Docker Container

This is a small projet to see and understand the way docker container can communicte with eachother. One Container is running a MySQL Client, the other one is a Shiny CRUD application for the mtcars dataset. 
Note that this example will only work with a specifically tailored mtcars dataset, not the default one, provided by R. 

#### Current State 
Currently the Shiny app is running a SQLite by itself, the MySQL database is not connected yet. To run the container use:
```
docker run -d -v /path/to/mtcars.sqlite3:/srv/shiny-server/data -p 3838:3838 tristankast/crud-example
```

- `-d`: Run the container in detached mode
- `-v`: Mount your local copy of the tailored dataset into the container
- `-p`: Expose under this port

Access the application under "http://localhost:3838/"