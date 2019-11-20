BEGIN;

TRUNCATE
  manufacturers,
  weapons,
  prefixes
  RESTART IDENTITY CASCADE;


INSERT INTO manufacturers (mfr_name) values
('Atlas'),
('COV'),
('DAHL'),
('Hyperion'),
('Jakobs'),
('Maliwan'),
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