resource "spotify_playlist" "Tollywood" {
  name   = "Tollywood"
  tracks = ["72TbxAuOqZAKGYdOc708mK", "131yybV7A3TmC34a0qE8u8", "14mxoVNHA77ja4bre40T1p", "3yHyiUDJdz02FZ6jfUbsmY"]
}

# Data source to search for tracks by Arijit Singh
data "spotify_search_track" "Arijit_Singh" {
  artist = "Arijit Singh"
}

# Resource to create a playlist with the searched tracks
resource "spotify_playlist" "Arijit" {
  name   = "Arijit"
  tracks = flatten([data.spotify_search_track.Arijit_Singh.tracks[*].id])
}

resource "spotify_library_albums" "my_album" {
  albums = [
    data.spotify_album.only_in_dreams.id,
    data.spotify_album.the_promised_land.id,
  ]
}

data "spotify_album" "only_in_dreams" {
  spotify_id = "35axN2yrxRiycF2pA8mZaB"
}

data "spotify_album" "the_promised_land" {
  url = "https://open.spotify.com/album/3nRnJkUJYFfxcOGgU6LNci"
}
