DROP TABLE albums;
DROP TABLE artists;


CREATE TABLE artists(
  id    SERIAL8 PRIMARY KEY,
  name  VARCHAR(255)
  );

CREATE TABLE albums(
  id      SERIAL8 PRIMARY KEY,
  title   VARCHAR(255),
  genre   VARCHAR(255),
  artist_id INT8 REFERNCES artists(id)
  );