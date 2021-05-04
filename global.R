library(shiny)
library(DT)
library(DBI)
library(RSQLite)
library(shinyjs)
library(shinycssloaders)
library(lubridate)
library(shinyFeedback)
library(dplyr)
library(dbplyr)
#library(RMySQL)

db_config <- config::get()$db

# How it could work in future
#if(Sys.getenv("DB_TECH") == 'sqlite'){
#  # Create database connection to SQLite DB
#  conn <- dbConnect(
#    RSQLite::SQLite(),
#    dbname = db_config$dbname
#  )
#}else{
#  # Create database connection to MySql DB
#  conn <- dbConnect(
#    RMySQL::MySQL(),
#    dbname = db_config$databaseName,
#    host = db_config$host,
#    port = db_config$port,
#    user = db_config$user, 
#    password = db_config$password
#  )
#}

# Create database connection to SQLite DB
conn <- dbConnect(
  RSQLite::SQLite(),
  dbname = db_config$dbname
)

# Stop database connection when application stops
shiny::onStop(function() {
  dbDisconnect(conn)
})

# Turn off scientific notation
options(scipen = 999)

# Set spinner type (for loading)
options(spinner.type = 8)
