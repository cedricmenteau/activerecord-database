require 'sqlite3'

# opens the database
database_path = "db/jukebox.sqlite"
db = SQLite3::Database.new(database_path)

def number_of_rows(db,table_name)
  db.execute("SELECT COUNT(*) FROM #{table_name}")
end


puts "There are #{number_of_rows(db,"Artist").join} artists"
puts "There are #{number_of_rows(db,"Track").join} tracks"
puts "There are #{number_of_rows(db,"Album").join} albums"
puts "There are #{number_of_rows(db,"Genre").join} genres"
puts "There are #{number_of_rows(db,"MediaType").join} media types"


# returns all the artists sorted by alphabetical order.
artists = db.execute("SELECT name FROM Artist ORDER BY Name")
puts artists

# returns all the love songs
love_songs_list = db.execute("SELECT Name FROM Track WHERE Name LIKE '%love%' ESCAPE '#' ORDER BY Name")
puts love_songs_list


# returns all the tracks that are longer than 5 minutes.
long_tracks = db.execute("SELECT name FROM Track WHERE Milliseconds > 700000 ORDER BY Name")
puts long_tracks