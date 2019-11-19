BEGIN;

TRUNCATE
  manufacturers,
  weapons
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