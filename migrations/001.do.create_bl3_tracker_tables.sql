CREATE TYPE wpn_type AS ENUM (
  'pistol',
  'assault rifle',
  'smg',
  'launcher',
  'shotgun',
  'sniper'
);

CREATE TYPE char_type AS ENUM (
  'Vault',
  'FL4K',
  'Zane',
  'Moze',
  'Amara'
);

CREATE TYPE char_class AS ENUM (
  'Universal',
  'Gunner',
  'Operative',
  'Beastmaster',
  'Siren'
);

CREATE TYPE rarity_type AS ENUM (
  'Legendary',
  'Epic',
  'Rare',
  'Uncommon',
  'Common'
);

CREATE TYPE elmnt AS ENUM (
  'normal',
  'fire',
  'corrosive',
  'shock',
  'cryo',
  'radiation'
);

CREATE TABLE manufacturers (
  id SERIAL PRIMARY KEY,
  mfr_name TEXT NOT NULL
);

CREATE TABLE weapons (
  id SERIAL PRIMARY KEY,
  mfr_id INTEGER REFERENCES manufacturers(id) ON DELETE CASCADE NOT NULL,
  weapon_type wpn_type NOT NULL,
  name TEXT NOT NULL,
  rarity rarity_type NOT NULL
);

CREATE TABLE shields (
  id SERIAL PRIMARY KEY,
  mfr_id INTEGER REFERENCES manufacturers(id) ON DELETE CASCADE NOT NULL,
  name TEXT NOT NULL,
  rarity rarity_type NOT NULL
);

CREATE TABLE grenades (
  id SERIAL PRIMARY KEY,
  mfr_id INTEGER REFERENCES manufacturers(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  rarity rarity_type NOT NULL
);

CREATE TABLE artifacts (
  id SERIAL PRIMARY KEY,
  mfr VARCHAR(7) DEFAULT 'Eridian',
  name TEXT NOT NULL,
  rarity rarity_type NOT NULL
);

CREATE TABLE class_mods (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  rarity rarity_type NOT NULL
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  user_name TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  date_created TIMESTAMP NOT NULL DEFAULT now(),
  date_modified TIMESTAMP
);

CREATE TABLE anointments (
  id SERIAL PRIMARY KEY,
  class char_class NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE prefixes (
  id SERIAL PRIMARY KEY,
  mfr_id INTEGER REFERENCES manufacturers(id) ON DELETE CASCADE,
  title TEXT NOT NULL
);

CREATE TABLE user_characters (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE NOT NULL,
  character char_type NOT NULL,
  character_name TEXT
);


CREATE TABLE user_weapons (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE NOT NULL,
  char_id INTEGER REFERENCES user_characters(id) ON DELETE SET NULL,
  item_id INTEGER REFERENCES weapons(id) ON DELETE CASCADE NOT NULL,
  prefix_1 INTEGER REFERENCES prefixes(id) ON DELETE SET NULL,
  prefix_2 INTEGER REFERENCES prefixes(id) ON DELETE SET NULL,
  element elmnt,
  anointment_id INTEGER REFERENCES anointments(id) ON DELETE SET NULL,
  item_score INTEGER, CHECK(item_score <= 621)
);
