BEGIN;

TRUNCATE
  manufacturers,
  weapons,
  shields,
  prefixes,
  anointments
  RESTART IDENTITY CASCADE;


INSERT INTO manufacturers (mfr_name) values
('Anshin'),
('Atlas'),
('COV'),
('DAHL'),
('Hyperion'),
('Jakobs'),
('Maliwan'),
('Pangolin'),
('Tediore'),
('TORGUE'),
('Vladof');

COMMIT;

BEGIN;


INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Rebel Yell', 'Legendary' from manufacturers where mfr_name like 'Atlas';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Carrier', 'Legendary' from manufacturers where mfr_name like 'Atlas';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Linc', 'Legendary' from manufacturers where mfr_name like 'Atlas';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'launcher','Freeman', 'Legendary' from manufacturers where mfr_name like 'Atlas';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'launcher','Ruby''s Wrath', 'Legendary' from manufacturers where mfr_name like 'Atlas';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Embrace the Pain', 'Legendary' from manufacturers where mfr_name like 'COV';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Pain is Power', 'Legendary' from manufacturers where mfr_name like 'COV';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Sawbar', 'Legendary' from manufacturers where mfr_name like 'COV';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','SkekSil', 'Legendary' from manufacturers where mfr_name like 'COV';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Linoge', 'Legendary' from manufacturers where mfr_name like 'COV';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Pestilence', 'Legendary' from manufacturers where mfr_name like 'COV';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Psycho Stabber', 'Legendary' from manufacturers where mfr_name like 'COV';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Barrage', 'Legendary' from manufacturers where mfr_name like 'DAHL';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Breath of the Dying', 'Legendary' from manufacturers where mfr_name like 'DAHL';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Kaos', 'Legendary' from manufacturers where mfr_name like 'DAHL';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Star Helix', 'Legendary' from manufacturers where mfr_name like 'DAHL';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Warlord', 'Legendary' from manufacturers where mfr_name like 'DAHL';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','AAA', 'Legendary' from manufacturers where mfr_name like 'DAHL';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Nemesis', 'Legendary' from manufacturers where mfr_name like 'DAHL';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Night Flyer', 'Legendary' from manufacturers where mfr_name like 'DAHL';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Venomous Hornet', 'Legendary' from manufacturers where mfr_name like 'DAHL';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Shocking 9-Volt', 'Legendary' from manufacturers where mfr_name like 'DAHL';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Night Hawkin', 'Legendary' from manufacturers where mfr_name like 'DAHL';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Hellfire', 'Legendary' from manufacturers where mfr_name like 'DAHL';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Ripper', 'Legendary' from manufacturers where mfr_name like 'DAHL';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Sleeping Giant', 'Legendary' from manufacturers where mfr_name like 'DAHL';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Vanquisher', 'Legendary' from manufacturers where mfr_name like 'DAHL';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'sniper','Stalker', 'Legendary' from manufacturers where mfr_name like 'DAHL';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'sniper','Malak''s Bane', 'Legendary' from manufacturers where mfr_name like 'DAHL';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','Brainstormer', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','Conference Call', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','Face-puncher', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','Fearmonger', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','Phebert', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','The Butcher', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Bitch', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Crossroad', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Handsome Jackhammer', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Hyperfocus XZ41', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Bankrolled Predatory Lending', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'sniper','Masterwork Crossbow', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'sniper','Woodblocker', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Bekah', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Gatlin'' Gatling Gun', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Hand of Glory', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Lead Sprinkler', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Rowan''s Call', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Amazing Grace', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','King''s Call', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Queen''s Call', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Maggie', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','The Companion', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','The Duc', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','The Flood', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Unforgiven', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Wagon Wheel', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','Hellwalker', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','Nimble Jack', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','One Pump Chump', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','Sledge''s Shotgun', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','T.K''s Shock Wave', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','T.K''s Heat Wave', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','The Garcia', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','The Tidal Wave', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'sniper','Headsplosion', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'sniper','Monocle ', 'Legendary' from manufacturers where mfr_name like 'Jakobs'; 
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Hellshock', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Hyper-Hydrator', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Sellout', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Superball', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Thunderball Fists', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','Kill-o''-the-Wisp', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','Mind-Killer', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','Recursion', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','Trevonator', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Cloud Kill', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Cutsman', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Destructo Spinner', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Devoted', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Tsunami', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Vault Hero', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Westergun', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'sniper','ASMD', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'sniper','Firestorm', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'sniper','Krakatoa', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'sniper','Storm', 'Legendary' from manufacturers where mfr_name like 'Maliwan';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Baby Maker ++', 'Legendary' from manufacturers where mfr_name like 'Tediore';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Bangarang XL', 'Legendary' from manufacturers where mfr_name like 'Tediore';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Gunerang XL', 'Legendary' from manufacturers where mfr_name like 'Tediore';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Scorpio XL', 'Legendary' from manufacturers where mfr_name like 'Tediore';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','Creeping Death', 'Legendary' from manufacturers where mfr_name like 'Tediore';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','The Horizon', 'Legendary' from manufacturers where mfr_name like 'Tediore';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','Polybius', 'Legendary' from manufacturers where mfr_name like 'Tediore';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Firesale Long Musket ++', 'Legendary' from manufacturers where mfr_name like 'Tediore';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Smart Gun XXL', 'Legendary' from manufacturers where mfr_name like 'Tediore';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'smg','Ten Gallon', 'Legendary' from manufacturers where mfr_name like 'Tediore';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Alchemist', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Laser-Sploder', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Bearcat', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Try-Bolt', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Breeder', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Devastator', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Devils Foursum', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Girth Blaster Elite', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Occultist', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Roisen''s Thorns', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Echo', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'launcher','Hive', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'launcher','R.Y.N.A.H. ', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'launcher','Scourge', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'launcher','Stuffed Quadomizer', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'launcher','Tunguska', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','Flakker', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','Redline', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','The Boring Gun', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'shotgun','The Lob', 'Legendary' from manufacturers where mfr_name like 'TORGUE';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Damned', 'Legendary' from manufacturers where mfr_name like 'Vladof';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Engulfing Shredifier', 'Legendary' from manufacturers where mfr_name like 'Vladof';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Faisor', 'Legendary' from manufacturers where mfr_name like 'Vladof';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Lucian''s Call', 'Legendary' from manufacturers where mfr_name like 'Vladof';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Ogre', 'Legendary' from manufacturers where mfr_name like 'Vladof';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','The Dictator', 'Legendary' from manufacturers where mfr_name like 'Vladof';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'assault rifle','Sickle', 'Legendary' from manufacturers where mfr_name like 'Vladof';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Infinity', 'Legendary' from manufacturers where mfr_name like 'Vladof';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'pistol','Unending Magnificent', 'Legendary' from manufacturers where mfr_name like 'Vladof';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'launcher','Jericho', 'Legendary' from manufacturers where mfr_name like 'Vladof';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'launcher','Mongol', 'Legendary' from manufacturers where mfr_name like 'Vladof';
INSERT INTO weapons (mfr_id, weapon_type, name, rarity)
select id ,'sniper','Lyuda', 'Legendary' from manufacturers where mfr_name like 'Vladof';

COMMIT;

BEGIN;

INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Deluxe Badass Combustor', 'Legendary' from manufacturers where mfr_name like 'Anshin';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Frozen Heart', 'Legendary' from manufacturers where mfr_name like 'Anshin';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Messy Breakup', 'Legendary' from manufacturers where mfr_name like 'Anshin';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Nova Berner', 'Legendary' from manufacturers where mfr_name like 'Anshin';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Red Card', 'Legendary' from manufacturers where mfr_name like 'Anshin';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Re-Router', 'Legendary' from manufacturers where mfr_name like 'Anshin';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Resonant Back Ham', 'Legendary' from manufacturers where mfr_name like 'Anshin';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Rough Rider', 'Legendary' from manufacturers where mfr_name like 'Anshin';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Scream of Terror', 'Legendary' from manufacturers where mfr_name like 'Anshin';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Whiskey Tango Foxtrot', 'Legendary' from manufacturers where mfr_name like 'Anshin';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Black Hole', 'Legendary' from manufacturers where mfr_name like 'Pangolin';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Band of Sitorak', 'Legendary' from manufacturers where mfr_name like 'Pangolin';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Big Boom Blaster', 'Legendary' from manufacturers where mfr_name like 'Pangolin';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Impaler', 'Legendary' from manufacturers where mfr_name like 'Pangolin';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Red Suit', 'Legendary' from manufacturers where mfr_name like 'Pangolin';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Shooting Star', 'Legendary' from manufacturers where mfr_name like 'Pangolin';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Front Loader', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Re-Charger', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Rectifier', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Stop-Gap', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'The Transformer', 'Legendary' from manufacturers where mfr_name like 'Hyperion';
INSERT INTO shields (mfr_id, name, rarity)
SELECT id, 'Ward', 'Legendary' from manufacturers where mfr_name like 'Hyperion';

COMMIT;

BEGIN;


INSERT INTO prefixes (title, mfr_id)
SELECT 'Cost-Effective', id FROM manufacturers m WHERE mfr_name ILIKE 'Atlas';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Overencumbered', id FROM manufacturers m WHERE mfr_name ILIKE 'Atlas';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Brr', id FROM manufacturers m WHERE mfr_name ILIKE 'COV';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Hawt', id FROM manufacturers m WHERE mfr_name ILIKE 'COV';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Kemik', id FROM manufacturers m WHERE mfr_name ILIKE 'COV';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Melty', id FROM manufacturers m WHERE mfr_name ILIKE 'COV';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Moar', id FROM manufacturers m WHERE mfr_name ILIKE 'COV';
INSERT INTO prefixes (title, mfr_id)
SELECT 'MOARR', id FROM manufacturers m WHERE mfr_name ILIKE 'COV';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Pointy', id FROM manufacturers m WHERE mfr_name ILIKE 'COV';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Stabby', id FROM manufacturers m WHERE mfr_name ILIKE 'COV';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Zappy', id FROM manufacturers m WHERE mfr_name ILIKE 'COV';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Adapting', id FROM manufacturers m WHERE mfr_name ILIKE 'Dahl';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Arctic', id FROM manufacturers m WHERE mfr_name ILIKE 'Dahl';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Bladed', id FROM manufacturers m WHERE mfr_name ILIKE 'Dahl';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Daunting', id FROM manufacturers m WHERE mfr_name ILIKE 'Dahl';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Dauntless', id FROM manufacturers m WHERE mfr_name ILIKE 'Dahl';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Decaying', id FROM manufacturers m WHERE mfr_name ILIKE 'Dahl';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Disciplined', id FROM manufacturers m WHERE mfr_name ILIKE 'Dahl';
INSERT INTO prefixes (title, mfr_id)
SELECT 'High Capacity', id FROM manufacturers m WHERE mfr_name ILIKE 'Dahl';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Reflexive', id FROM manufacturers m WHERE mfr_name ILIKE 'Dahl';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Relentless', id FROM manufacturers m WHERE mfr_name ILIKE 'Dahl';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Searing', id FROM manufacturers m WHERE mfr_name ILIKE 'Dahl';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Shocking', id FROM manufacturers m WHERE mfr_name ILIKE 'Dahl';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Tamed', id FROM manufacturers m WHERE mfr_name ILIKE 'Dahl';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Trained', id FROM manufacturers m WHERE mfr_name ILIKE 'Dahl';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Venomous', id FROM manufacturers m WHERE mfr_name ILIKE 'Dahl';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Auditing', id FROM manufacturers m WHERE mfr_name ILIKE 'Hyperion';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Bleeding Edge', id FROM manufacturers m WHERE mfr_name ILIKE 'Hyperion';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Cash-Infused', id FROM manufacturers m WHERE mfr_name ILIKE 'Hyperion';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Defrauding', id FROM manufacturers m WHERE mfr_name ILIKE 'Hyperion';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Holistic', id FROM manufacturers m WHERE mfr_name ILIKE 'Hyperion';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Hostile', id FROM manufacturers m WHERE mfr_name ILIKE 'Hyperion';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Popular', id FROM manufacturers m WHERE mfr_name ILIKE 'Hyperion';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Powerhouse', id FROM manufacturers m WHERE mfr_name ILIKE 'Hyperion';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Redundant', id FROM manufacturers m WHERE mfr_name ILIKE 'Hyperion';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Undermining', id FROM manufacturers m WHERE mfr_name ILIKE 'Hyperion';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Viral', id FROM manufacturers m WHERE mfr_name ILIKE 'Hyperion';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Bloodsoaked', id FROM manufacturers m WHERE mfr_name ILIKE 'Jakobs';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Bowie', id FROM manufacturers m WHERE mfr_name ILIKE 'Jakobs';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Cuttin''', id FROM manufacturers m WHERE mfr_name ILIKE 'Jakobs';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Dastardly', id FROM manufacturers m WHERE mfr_name ILIKE 'Jakobs';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Deadeye', id FROM manufacturers m WHERE mfr_name ILIKE 'Jakobs';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Quad', id FROM manufacturers m WHERE mfr_name ILIKE 'Jakobs';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Quickdraw', id FROM manufacturers m WHERE mfr_name ILIKE 'Jakobs';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Speedloadin''', id FROM manufacturers m WHERE mfr_name ILIKE 'Jakobs';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Trick', id FROM manufacturers m WHERE mfr_name ILIKE 'Jakobs';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Wicked', id FROM manufacturers m WHERE mfr_name ILIKE 'Jakobs';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Binary ', id FROM manufacturers m WHERE mfr_name ILIKE 'Maliwan';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Expert', id FROM manufacturers m WHERE mfr_name ILIKE 'Maliwan';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Hazardous', id FROM manufacturers m WHERE mfr_name ILIKE 'Maliwan';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Mocking', id FROM manufacturers m WHERE mfr_name ILIKE 'Maliwan';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Stark', id FROM manufacturers m WHERE mfr_name ILIKE 'Maliwan';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Clearance', id FROM manufacturers m WHERE mfr_name ILIKE 'Tediore';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Maxed Out', id FROM manufacturers m WHERE mfr_name ILIKE 'Tediore';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Firesale', id FROM manufacturers m WHERE mfr_name ILIKE 'Tediore';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Frozen', id FROM manufacturers m WHERE mfr_name ILIKE 'Tediore';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Poison', id FROM manufacturers m WHERE mfr_name ILIKE 'Tediore';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Precision', id FROM manufacturers m WHERE mfr_name ILIKE 'Tediore';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Rad', id FROM manufacturers m WHERE mfr_name ILIKE 'Tediore';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Same-Day', id FROM manufacturers m WHERE mfr_name ILIKE 'Tediore';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Supercharged', id FROM manufacturers m WHERE mfr_name ILIKE 'Tediore';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Turbo', id FROM manufacturers m WHERE mfr_name ILIKE 'Tediore';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Burning', id FROM manufacturers m WHERE mfr_name ILIKE 'Torgue';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Casual ', id FROM manufacturers m WHERE mfr_name ILIKE 'Torgue';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Cocky', id FROM manufacturers m WHERE mfr_name ILIKE 'Torgue';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Double Penetrating', id FROM manufacturers m WHERE mfr_name ILIKE 'Torgue';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Gratifying', id FROM manufacturers m WHERE mfr_name ILIKE 'Torgue';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Itchy', id FROM manufacturers m WHERE mfr_name ILIKE 'Torgue';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Nasty', id FROM manufacturers m WHERE mfr_name ILIKE 'Torgue';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Oozing', id FROM manufacturers m WHERE mfr_name ILIKE 'Torgue';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Packin''', id FROM manufacturers m WHERE mfr_name ILIKE 'Torgue';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Shrinking', id FROM manufacturers m WHERE mfr_name ILIKE 'Torgue';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Stimulating', id FROM manufacturers m WHERE mfr_name ILIKE 'Torgue';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Stuffed', id FROM manufacturers m WHERE mfr_name ILIKE 'Torgue';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Triple', id FROM manufacturers m WHERE mfr_name ILIKE 'Torgue';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Triple-Penetrating', id FROM manufacturers m WHERE mfr_name ILIKE 'Torgue';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Annexed', id FROM manufacturers m WHERE mfr_name ILIKE 'Vladof';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Englufing', id FROM manufacturers m WHERE mfr_name ILIKE 'Vladof';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Molten', id FROM manufacturers m WHERE mfr_name ILIKE 'Vladof';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Negating', id FROM manufacturers m WHERE mfr_name ILIKE 'Vladof';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Nuclear', id FROM manufacturers m WHERE mfr_name ILIKE 'Vladof';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Otchky', id FROM manufacturers m WHERE mfr_name ILIKE 'Vladof';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Pestilent', id FROM manufacturers m WHERE mfr_name ILIKE 'Vladof';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Resolute', id FROM manufacturers m WHERE mfr_name ILIKE 'Vladof';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Storming', id FROM manufacturers m WHERE mfr_name ILIKE 'Vladof';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Unending', id FROM manufacturers m WHERE mfr_name ILIKE 'Vladof';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Vicious', id FROM manufacturers m WHERE mfr_name ILIKE 'Vladof';
INSERT INTO prefixes (title, mfr_id)
VALUES ('Bottomless',null);
INSERT INTO prefixes (title, mfr_id)
SELECT 'Dangerous', id FROM manufacturers m WHERE mfr_name ILIKE 'Maliwan';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Dueling', id FROM manufacturers m WHERE mfr_name ILIKE 'Jakobs';
INSERT INTO prefixes (title, mfr_id)
VALUES ('Express',null);
INSERT INTO prefixes (title, mfr_id)
VALUES ('Freezing',null);
INSERT INTO prefixes (title, mfr_id)
SELECT 'Humongous', id FROM manufacturers m WHERE mfr_name ILIKE 'Tediore';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Loaded', id FROM manufacturers m WHERE mfr_name ILIKE 'Jakobs';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Loyal', id FROM manufacturers m WHERE mfr_name ILIKE 'Vladof';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Shredded', id FROM manufacturers m WHERE mfr_name ILIKE 'Torgue';
INSERT INTO prefixes (title, mfr_id)
VALUES ('Wunderkind',null);
INSERT INTO prefixes (title, mfr_id)
SELECT 'Compressing', id FROM manufacturers m WHERE mfr_name ILIKE 'Maliwan';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Delux', id FROM manufacturers m WHERE mfr_name ILIKE 'Tediore';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Super', id FROM manufacturers m WHERE mfr_name ILIKE 'Tediore';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Abundant', id FROM manufacturers m WHERE mfr_name ILIKE 'Maliwan';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Compressing', id FROM manufacturers m WHERE mfr_name ILIKE 'Maliwan';
INSERT INTO prefixes (title, mfr_id)
SELECT 'Deluxe', id FROM manufacturers m WHERE mfr_name ILIKE 'Tediore';

COMMIT;

BEGIN;

INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, The next 2 magazines will have 50% additional bonus fire damage.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, The next 2 magazines will have 50% additional bonus shock damage.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, The next 2 magazines will have 50% additional bonus corrosive damage.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, The next 2 magazines will have 50% additional bonus cryo damage.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, The next 2 magazines will have 50% additional bonus radiation damage.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, Weapon Status Effect Damage & Chance are increased by 75% for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, Splash Damage is increased by 125% for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, Weapon Damage is increased by 100% for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, Deal 125% more Weapon Damage to Badass, Named, and Boss enemies for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, Melee Damage is increased by 100% for a short time. [shield]');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, Critical Damage is increased by 25% for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, Gain 15% Life Steal for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, Regenerate 5% max health per second for a short time. [shield]');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, Damage taken is reduced by 13% for a short time. [shield]');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, Weapon Accuracy & Handling are greatly increased for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, Projectile Speed is increased by 100% for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, Movement speed is increased by 5% for a short time. [shield]');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, Fire rate is increased by 11%, & reload speed by 26% for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, Action skill cooldown rate is increased by 20% for a short time. [shield]');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill Start, Regenerate 1 grenade. [grenade]');
INSERT INTO anointments (class, description) 
VALUES ('Siren', 'On Action Skill End, deal 20% bonus radiation damage for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Siren', 'On Action Skill End, 30% of damage taken is returned to the attacker for a short time. [shield]');
INSERT INTO anointments (class, description) 
VALUES ('Siren', 'After using Phasecast, Weapon Damage is increased by 250% for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Siren', 'After using Phasecast, Status Effect Chance is increased by 50% for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Siren', 'After using Phaseslam, Weapon Damage is increased by 300% for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Siren', 'After using Phaseslam, Melee Damage is increased by 200% for a short time. [shield]');
INSERT INTO anointments (class, description) 
VALUES ('Siren', 'While Phasegrasp is active, Amara constantly triggers novas that deal 3718 damage. (lvl 50) [shield]');
INSERT INTO anointments (class, description) 
VALUES ('Siren', 'While Phasegrasp is active, Weapon charge time is decreased by 71% and Fire Rate is increased by 12%.');
INSERT INTO anointments (class, description) 
VALUES ('Siren', 'After using Phaseslam, damage taken is reduced by 20% and movespeed is increased by 12%. [shield]');
INSERT INTO anointments (class, description) 
VALUES ('Siren', 'After using Phasegrasp, Weapon Accuracy and Handling are greatly increased.');
INSERT INTO anointments (class, description) 
VALUES ('Beastmaster', 'After using Rakk Attack!, gain 25% critical hit damage for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Beastmaster', 'Enemies damaged by Rakk Attack! take 50% increased damage for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Beastmaster', 'Grants an extra charge of Rakk Attack!');
INSERT INTO anointments (class, description) 
VALUES ('Beastmaster', 'When exiting Fade Away, create a nova that deals 13013 damage. (lvl 50)');
INSERT INTO anointments (class, description) 
VALUES ('Beastmaster', 'While Gamma Burst is active, gain 65% bonus radiation damage.');
INSERT INTO anointments (class, description) 
VALUES ('Beastmaster', 'After using Attack Command, gain 30% lifesteal for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Beastmaster', 'After issuing an Attack Command, gain 8% Movement Speed for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Beastmaster', 'While Fade Away is active, gain greatly increased Accuracy and Handling.');
INSERT INTO anointments (class, description) 
VALUES ('Gunner', 'When entering and exiting Iron Bear, create a nova that deals 13013 damage. (lvl50)');
INSERT INTO anointments (class, description) 
VALUES ('Gunner', 'After exiting Iron Bear, the next 2 magazines will have 10% increased fire rate and 20% critical damage.');
INSERT INTO anointments (class, description) 
VALUES ('Gunner', 'After exiting Iron Bear, the next 2 magazines will have 40% bonus incendiary damage.');
INSERT INTO anointments (class, description) 
VALUES ('Gunner', 'After exiting Iron Bear, gain 120% increased Splash damage for 18 seconds.');
INSERT INTO anointments (class, description) 
VALUES ('Gunner', 'While Auto Bear is active, deals 20% bonus incendiary damage');
INSERT INTO anointments (class, description) 
VALUES ('Gunner', 'While Auto Bear is active, taking damage has 20% chance to spawn a grenade. [grenade]');
INSERT INTO anointments (class, description) 
VALUES ('Gunner', 'After exiting Iron Bear, gain 75% increased shields and health for 25 seconds. [shield]');
INSERT INTO anointments (class, description) 
VALUES ('Gunner', 'After exiting Iron Bear, the next 3 magazines will have 33% incrased reload speed and 67% increased handling');
INSERT INTO anointments (class, description) 
VALUES ('Gunner', 'After exiting Iron Bear, kills increase Iron Bear''s cooldown rate by 30%. [shield]');
INSERT INTO anointments (class, description) 
VALUES ('Gunner', 'After exiting Iron Bear, do not consume ammo for 5 seconds.');
INSERT INTO anointments (class, description) 
VALUES ('Gunner', 'While Auto Bear is active, constantly regenerate 8% of magazine size per second. [shield]');
INSERT INTO anointments (class, description) 
VALUES ('Operative', 'After swapping places with your Digi-Clone, Weapon Damage is increased by 75% for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Operative', 'While Barrier is active, Status Effect Chance is increased by 50%');
INSERT INTO anointments (class, description) 
VALUES ('Operative', 'While Barrier is active, Accuracy is increased by 60%, and Critical Hit damage is increased by 30%');
INSERT INTO anointments (class, description) 
VALUES ('Operative', 'While SNTNL is active, Gain 50% of damage as bonus Cryo damage.');
INSERT INTO anointments (class, description) 
VALUES ('Operative', 'When Barrier is Deployed, instantly start recharging your shields. [shield]');
INSERT INTO anointments (class, description) 
VALUES ('Operative', 'While Digi-Clone is active, regenerate 3% max health per second. [shield]');
INSERT INTO anointments (class, description) 
VALUES ('Operative', 'While SNTNL is active, Fire Rate is increased by 9% and Reload Speed by 23%.');
INSERT INTO anointments (class, description) 
VALUES ('Operative', 'While SNTNL is active, Movespeed is increased by 15%. [shield]');
INSERT INTO anointments (class, description) 
VALUES ('Operative', 'After swapping places with your Digi-Clone, your weapon is reloaded.');
INSERT INTO anointments (class, description) 
VALUES ('Operative', 'While Digi-Clone is active, regenerate 12% of magazine ammo per second.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'While Terrified, gain increased crit damage. The more Terror you have, the higher the bonus.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'While Terrified, gain increased damage and fire rate. The more Terror you have, the higher the bonus.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'While Terrified, gain ammo regeneration. The more Terror you have, the higher the bonus. ');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'While Terrified, gain health regeneration. The more Teror you have, the higher the bonus.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'While Terrified, deal 50% bonus cryo damage.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'While Terrified, you have a chance to fire an extra projectile per shot. The more Terror you have, the higher the bonus.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'While Terrified, enemy bullets have a chance to reflect off of you. The more Terror you have, the higher the bonus.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'While Terrified, reduce all incoming damage by a small amount. The more Terror you have, the higher the bonus.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, heal 25% max health, effect is increased by 15% per terror stack. Consumes all Terror. ');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'On Action Skill End, apply Terror to yourself every 5 seconds for the next 18 seconds.');
INSERT INTO anointments (class, description) 
VALUES ('Universal', 'Melee Attacks have a 25% chance to apply Terror to yourself.');
INSERT INTO anointments (class, description) 
VALUES ('Siren', 'After Phasegrasping an enemy, Amara fires Terror skulls at the grasped target dealing 3718 damage. (lvl 50)');
INSERT INTO anointments (class, description) 
VALUES ('Beastmaster', 'After Using Attack Command, consume all Terror and Fl4K''s Pet gains 50% bonus fire damage for a short time.');
INSERT INTO anointments (class, description) 
VALUES ('Operative', 'While SNTNL is active, SNTNL gains 100% lifesteal while you are affected by Terror. ');
INSERT INTO anointments (class, description) 
VALUES ('Gunner', 'After Reloading, consume all Terror and create a nova that deals cryo damage.');

COMMIT;