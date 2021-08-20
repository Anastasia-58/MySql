USE vk;

DROP TABLE IF EXISTS presents;
CREATE TABLE presents(
    id SERIAL,
    name VARCHAR(255),
    image JSON
);

DROP TABLE IF EXISTS users_presents;
CREATE TABLE users_presents(
   id SERIAL,
   user_id BIGINT UNSIGNED NOT NULL,
   present_id BIGINT UNSIGNED NOT NULL,
   
   congratulation TEXT,
   created_at DATETIME DEFAULT NOW(),
   
   FOREIGN KEY (user_id) REFERENCES users(id),
   FOREIGN KEY (present_id) REFERENCES presents(id)
);

DROP TABLE IF EXISTS songs;
CREATE TABLE songs(
    id SERIAL,
	singer_name VARCHAR(255),
    song_name VARCHAR(255),
    file BLOB
);

DROP TABLE IF EXISTS playlist;
CREATE TABLE playlist(
   id SERIAL,
   user_id BIGINT UNSIGNED NOT NULL,
   songs_id BIGINT UNSIGNED NOT NULL,
   
   description_playlist TEXT,
   created_at DATETIME DEFAULT NOW(),
   
   FOREIGN KEY (user_id) REFERENCES users(id),
   FOREIGN KEY (songs_id) REFERENCES songs(id)
);