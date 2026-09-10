-- Contract data update from PuckPedia (2026-27 season)
-- contract_yrs = years remaining, contract_len = total length, expiry_status = UFA/RFA

-- ANAHEIM
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Leo Carlsson';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Troy Terry';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Beckett Sennecke';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Cutter Gauthier';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Jackson LaCombe';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Pavel Mintyukov';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Tristan Luneau';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Lukas Dostal';

-- BOSTON
UPDATE poolers_players SET contract_yrs = 5, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'David Pastrnak';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Elias Lindholm';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'JJ Peterka' OR name ILIKE 'John-Jason Peterka';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Casey Mittelstadt';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Morgan Geekie';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Pavel Zacha';
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'RFA' WHERE name ILIKE 'James Hagens';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Marat Khusnutdinov';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Fraser Minten';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Charlie McAvoy';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Hampus Lindholm';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Mason Lohrei';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Jeremy Swayman';

-- BUFFALO
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Tage Thompson';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Zach Benson';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Josh Norris';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Josh Doan';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Ryan McLeod';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Jack Quinn';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Noah Ostlund';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Rasmus Dahlin';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Owen Power';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Olen Zellweger';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Ukko-Pekka Luukkonen';

-- CAROLINA
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Sebastian Aho';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Nikolaj Ehlers';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Andrei Svechnikov';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Seth Jarvis';
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Logan Stankoven';
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Jackson Blake';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'K''Andre Miller';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Pyotr Kochetkov';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Alexander Nikishin';

-- COLUMBUS
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Valeri Nichushkin';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Conor Garland';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Cole Sillinger';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Dmitri Voronkov';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Kirill Marchenko';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Kent Johnson';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Adam Fantilli';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Zach Werenski';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Ivan Provorov';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Damon Severson';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Denton Mateychuk';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Jet Greaves';

-- CALGARY
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Jonathan Huberdeau';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Matt Coronato';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Zayne Parekh';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Simon Nemec';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Dustin Wolf';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Matvei Gridin';

-- CHICAGO
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Connor Bedard';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Frank Nazar';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Anton Frondell';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Sacha Boisvert';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Roman Kantserov';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Bowen Byram';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Spencer Knight';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Artyom Levshunov';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Sam Rinzel';

-- COLORADO
UPDATE poolers_players SET contract_yrs = 5, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Nathan MacKinnon';
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Martin Necas';
UPDATE poolers_players SET contract_yrs = 9, contract_len = 9, expiry_status = 'UFA' WHERE name ILIKE 'Cale Makar';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Devon Toews';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Sam Malinski';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'MacKenzie Blackwood';

-- DALLAS
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Mikko Rantanen';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Jason Robertson';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Roope Hintz';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Wyatt Johnston';
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Thomas Harley';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Miro Heiskanen';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Jake Oettinger';

-- DETROIT
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Dylan Larkin';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Lucas Raymond';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Alex Debrincat';
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Viktor Arvidsson';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Moritz Seider';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Axel Sandin-Pellikka';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Simon Edvinsson';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Marco Kasper';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Emmitt Finnie';

-- EDMONTON
UPDATE poolers_players SET contract_yrs = 7, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Leon Draisaitl';
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Connor McDavid';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Evan Bouchard';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Jake Walman';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Matthew Savoie';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Vasily Podkolzin';

-- FLORIDA
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Aleksander Barkov';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Matthew Tkachuk';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Sam Reinhart';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Brady Tkachuk';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Sam Bennett';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Carter Verhaeghe';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Brad Marchand';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Anton Lundell';
UPDATE poolers_players SET contract_yrs = 9, contract_len = 9, expiry_status = 'UFA' WHERE name ILIKE 'Eetu Luostarinen';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Seth Jones';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Aaron Ekblad';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Gustav Forsling';
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Akira Schmid';

-- LOS ANGELES
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Artemi Panarin';
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Adrian Kempe';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Kevin Fiala';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Quinton Byfield';
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'RFA' WHERE name ILIKE 'Alex Laferriere';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Mats Zuccarello';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Brandt Clarke';

-- MINNESOTA
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Kirill Kaprizov';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Matt Boldy';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Joel Eriksson Ek';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Bobby Brink';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Danila Yurov';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Brock Faber';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Quinn Hughes';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Jesper Wallstedt';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Filip Gustavsson';

-- MONTREAL
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Nick Suzuki';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Cole Caufield';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Juraj Slafkovsky';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Ivan Demidov';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Noah Dobson';
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Lane Hutson';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Jacob Fowler';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Jakub Dobes';

-- NEW JERSEY
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Timo Meier';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Jack Hughes';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Jesper Bratt';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Nico Hischier';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Luke Hughes';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Dawson Mercer';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Luke Evangelista';

-- NASHVILLE
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Filip Forsberg';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Steven Stamkos';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Mavrik Bourque';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Brady Skjei';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Juuse Saros';

-- NY ISLANDERS
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Mathew Barzal';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Bo Horvat';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Ilya Sorokin';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Matthew Schaefer';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Calum Ritchie';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Simon Holmstrom';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Matias Maccelli';

-- NY RANGERS
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Pavel Dorofeyev';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Mika Zibanejad';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'JT Miller' OR name ILIKE 'J.T. Miller';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Alexis Lafreniere';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Gabe Perreault';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Will Cuylle';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Adam Fox';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Vladislav Gavrikov';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Igor Shesterkin';

-- OTTAWA
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Tim Stutzle';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Shane Pinto';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Dylan Cozens';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'William Eklund';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Drake Batherson';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Ridly Greig';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Carter Yakemchuk';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Jake Sanderson';
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Thomas Chabot';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Jordan Spence';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Linus Ullmark';

-- PHILADELPHIA
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Trevor Zegras';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Travis Konecny';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Sean Couturier';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Owen Tippett';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Christian Dvorak';
UPDATE poolers_players SET contract_yrs = 9, contract_len = 9, expiry_status = 'UFA' WHERE name ILIKE 'Tyson Foerster';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Matvei Michkov';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Porter Martone';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Travis Sanheim';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Jamie Drysdale';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Cam York';
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Joseph Woll';

-- PITTSBURGH
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Sidney Crosby';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Evgeni Malkin';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Egor Chinakhov';
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Bryan Rust';
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Rickard Rakell';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Erik Karlsson';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Arturs Silovs';

-- SEATTLE
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Matty Beniers' OR name ILIKE 'Matthew Beniers';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Chandler Stephenson';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Bobby McMann';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Brandon Montour';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Ryker Evans';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Berkly Catton';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Shane Wright';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Mackie Samoskevich';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Joey Daccord';

-- SAN JOSE
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Macklin Celebrini';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Will Smith';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Mason Marchment';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Darnell Nurse';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Jacob Trouba';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Sam Dickinson';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Yaroslav Askarov';

-- ST. LOUIS
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Robert Thomas';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Pavel Buchnevich';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Dylan Holloway';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Mason McTavish';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Connor McMichael';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Jake Neighbours';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Philip Broberg';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Cam Fowler';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Jimmy Snuggerud';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Dalibor Dvorsky';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Jordan Binnington';

-- TAMPA BAY
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Nikita Kucherov';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Brayden Point';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Jake Guentzel';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Brandon Hagel';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Anthony Cirelli';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Victor Hedman';
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'John Carlson';
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Andrei Vasilevskiy';
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Janis Moser' OR name ILIKE 'JJ Moser';

-- TORONTO
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Auston Matthews';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'William Nylander';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Matthew Knies';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'John Tavares';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Gavin McKenna';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Easton Cowan';
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Darren Raddysh';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Sergei Bobrovsky';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Anthony Stolarz';

-- UTAH
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Logan Cooley';
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Nick Schmaltz';
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Clayton Keller';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Dylan Guenther';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Mikhail Sergachev';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'MacKenzie Weegar';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Karel Vejmelka';

-- VANCOUVER
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Elias Pettersson';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Brock Boeser';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Jake DeBrusk';
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'RFA' WHERE name ILIKE 'Marco Rossi';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Filip Hronek';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Zeev Buium';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Tom Willander';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Thatcher Demko';

-- VEGAS
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Jack Eichel';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Mitch Marner';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Tomas Hertl';
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Rasmus Andersson';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Shea Theodore';
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Noah Hanifin';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Adin Hill';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Carter Hart';

-- WASHINGTON
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Alex Tuch';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Pierre-Luc Dubois';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Jordan Kyrou';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Tom Wilson';
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Boone Jenner';
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Dylan Strome';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Alex Ovechkin';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Aliaksei Protas';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Ryan Leonard';
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Ilya Protas';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Jakob Chychrun';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Martin Fehervary';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Logan Thompson';
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Cole Hutson';

-- WINNIPEG
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Kyle Connor';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Mark Scheifele';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Gabriel Vilardi';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Cole Perfetti';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Neal Pionk';
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Connor Hellebuyck';
