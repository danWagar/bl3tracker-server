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

CREATE TYPE shld_prefix AS ENUM(
  'Absorb',
  'Adaptive',
  'Adrenaline',
  'Amp',
  'Booster',
  'Brimming',
  'Delay',
  'Fallout',
  'Fleet',
  'Fortify Charge',
  'Health',
  'Health Charge',
  'Nova',
  'Power Charge',
  'Projected',
  'Ratch',
  'Recharge',
  'Reflect',
  'Resistant',
  'Roid',
  'Run-and-Gun',
  'Safe-Space',
  'Spike',
  'Sucker',
  'Trigger Happy',
  'Turtle',
  'Vagabond'
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
  description varchar(500) NOT NULL
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
  char_id INTEGER REFERENCES user_characters(id) ON DELETE CASCADE NOT NULL,
  weapon_id INTEGER REFERENCES weapons(id) ON DELETE CASCADE NOT NULL,
  prefix_1 INTEGER REFERENCES prefixes(id) ON DELETE SET NULL,
  prefix_2 INTEGER REFERENCES prefixes(id) ON DELETE SET NULL,
  element elmnt,
  anointment_id INTEGER REFERENCES anointments(id) ON DELETE SET NULL,
  item_score INTEGER, CHECK(item_score <= 621),
  damage VARCHAR(7),
  accuracy INTEGER, CHECK(accuracy <= 100),
  handling INTEGER, CHECK(handling <= 100),
  reload_time DECIMAL(3,1),
  fire_rate DECIMAL(4,2),
  magazine_size INTEGER, CHECK(magazine_size <= 999)
);

CREATE TABLE user_shields (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE NOT NULL,
  char_id INTEGER REFERENCES user_characters(id) ON DELETE CASCADE NOT NULL,
  shield_id INTEGER REFERENCES shields(id) ON DELETE CASCADE NOT NULL,
  prefix shld_prefix,
  element elmnt,
  capacity INTEGER,
  recharge_delay DECIMAL(3,1),
  recharge_rate INTEGER
);
