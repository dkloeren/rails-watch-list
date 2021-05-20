# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb

Movie.destroy_all

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

url = "http://tmdb.lewagon.com/movie/top_rated?"
movie_list_serialized = URI.open(url).read
movies = JSON.parse(movie_list_serialized)

movies["results"].each do |movie|
  poster_url = "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
  Movie.create!(title: movie["title"], overview: movie["overview"], rating: movie["vote_average"].to_f, poster_url: poster_url)
end

# {
#   "adult": false,
#   "backdrop_path": "/pm0RiwNpSja8gR0BTWpxo5a9Bbl.jpg",
#   "genre_ids": [
#   12,
#   14,
#   28
#   ],
#   "id": 122,
#   "original_language": "en",
#   "original_title": "The Lord of the Rings: The Return of the King",
#   "overview": "Aragorn is revealed as the heir to the ancient kings as he, Gandalf and the other members of the broken fellowship struggle to save Gondor from Sauron's forces. Meanwhile, Frodo and Sam take the ring closer to the heart of Mordor, the dark lord's realm.",
#   "popularity": 54.257,
#   "poster_path": "/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg",
#   "release_date": "2003-12-01",
#   "title": "The Lord of the Rings: The Return of the King",
#   "video": false,
#   "vote_average": 8.5,
#   "vote_count": 17636
# }

