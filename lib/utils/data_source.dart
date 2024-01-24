class DataSource {
  static dynamic usersDataSource = {
    "Users": [
      {
        "id": 12345,
        "username": "testUser",
        "music_style": "Rock",
        "favorite_song_name": "Dreams",
        "playlist": {
          "id": 12,
          "name": "Old rocks",
          "number_of_songs": 10,
          "user_id": 12345,
          "songs": [
            {
              "id": 5,
              "name": "Dreams",
              "duration": 100,
              "artist": {
                "id": 5,
                "name": "Stevie Nicks",
                "age": 65,
                "music_style": "Rock",
              }
            },
            {
              "id": 6,
              "name": "Rocket Man",
              "duration": 110,
              "artist": {
                "id": 5,
                "name": "Elton John Nicks",
                "age": 55,
                "music_style": "Rock",
              }
            }
          ]
        }
      },
      {
        "id": 1234,
        "username": "testUser",
        "music_style": "Pop",
        "favorite_song_name": "Flowers",
        "playlist": {
          "id": 14,
          "name": "First Playlist",
          "number_of_songs": 5,
          "user_id": 1234,
          "songs": [
            {
              "id": 8,
              "name": "Flowers",
              "duration": 100,
              "artist": {
                "id": 11,
                "name": "Miley Cyrus",
                "age": 65,
                "music_style": "Pop",
              }
            },
            {
              "id": 6,
              "name": "Rocket Man",
              "duration": 110,
              "artist": {
                "id": 5,
                "name": "Elton John Nicks",
                "age": 55,
                "music_style": "Rock",
              }
            }
          ]
        }
      },
    ]
  };

  static dynamic artistDataSource = {
    "Artists": [
      {
        "id": 5,
        "name": "Stevie Nicks",
        "age": 65,
        "music_style": "Rock",
        "songs": [
          {
            "id": 5,
            "name": "Dreams",
            "duration": 100,
            "artist": {
              "id": 5,
              "name": "Stevie Nicks",
              "age": 65,
              "music_style": "Rock",
            }
          },
          {
            "id": 6,
            "name": "Rocket Man",
            "duration": 110,
            "artist": {
              "id": 5,
              "name": "Elton John Nicks",
              "age": 55,
              "music_style": "Rock",
            }
          }
        ],
      },
      {
        "id": 11,
        "name": "Miley Cyrus",
        "age": 65,
        "music_style": "Pop",
        "songs": [
          {
            "id": 8,
            "name": "Flowers",
            "duration": 100,
            "artist": {
              "id": 11,
              "name": "Miley Cyrus",
              "age": 65,
              "music_style": "Pop",
            }
          },
        ],
      },
    ]
  };
}
