-- Contract data v2: corrected contract_len from PuckPedia salary columns
-- contract_yrs = years remaining from 2026-27, contract_len = total contract length
-- expiry_status = UFA/RFA

-- ANAHEIM
-- Carlsson: 5 salary cols shown, UFA 2031 = 5 yrs remaining, signed 2026 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Leo Carlsson';
-- Terry: 4 salary cols, UFA
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Troy Terry';
-- Sennecke: 1 col, RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Beckett Sennecke';
-- Gauthier: ELC RFA (no salary shown = ELC yr 1)
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Cutter Gauthier';
-- LaCombe: 5 salary cols, UFA 2034 = 8 yrs from 2026-27 → signed 8yr deal, 5 remaining? No: UFA 2034 = 8 seasons from 2026-27. contract_len=8, yrs=8
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Jackson LaCombe';
-- Mintyukov: 5 salary cols, UFA 2031 = 5 yrs
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Pavel Mintyukov';
-- Luneau: 1 col, RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Tristan Luneau';
-- Dostal: 4 salary cols, UFA
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Lukas Dostal';

-- BOSTON
-- Pastrnak: 5 salary cols shown, UFA 2031 = 5 yrs; original contract was 8yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'David Pastrnak';
-- Lindholm: 5 salary cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Elias Lindholm';
-- Peterka: 4 salary cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'John-Jason Peterka' OR name ILIKE 'JJ Peterka';
-- Mittelstadt: 1 col UFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Casey Mittelstadt';
-- Geekie: 5 salary cols, UFA 2031
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Morgan Geekie';
-- Zacha: 1 col UFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Pavel Zacha';
-- Hagens: 2 salary cols, RFA
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'RFA' WHERE name ILIKE 'James Hagens';
-- Khusnutdinov: 1 col RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Marat Khusnutdinov';
-- Minten: 1 col shown + signing bonus cols = ELC, but has 5 more signing bonus yrs shown → 5yr deal, yr 1
UPDATE poolers_players SET contract_yrs = 1, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Fraser Minten';
-- McAvoy: 4 salary cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Charlie McAvoy';
-- H.Lindholm: 4 salary cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Hampus Lindholm';
-- Lohrei: 1 col RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Mason Lohrei';
-- Swayman: 5 salary cols, UFA 2032 → signed 6yr deal, yr 2
UPDATE poolers_players SET contract_yrs = 5, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Jeremy Swayman';

-- BUFFALO
-- Thompson: 4 salary cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Tage Thompson';
-- Benson: 5 cols, UFA 2033 → 7yr deal, yr 3 = 5 remaining. contract_len=7
UPDATE poolers_players SET contract_yrs = 5, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Zach Benson';
-- Norris: 4 salary cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Josh Norris';
-- Doan: 5 cols, UFA 2033 → 7yr deal, yr 3 = 5 remaining
UPDATE poolers_players SET contract_yrs = 5, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Josh Doan';
-- McLeod: 3 salary cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Ryan McLeod';
-- Quinn: 1 col RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Jack Quinn';
-- Ostlund: 1 col RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Noah Ostlund';
-- Dahlin: 5 cols, UFA 2032 → 6yr deal, yr 2 = 5 remaining. contract_len=6
UPDATE poolers_players SET contract_yrs = 5, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Rasmus Dahlin';
-- Power: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Owen Power';
-- Zellweger: 3 salary cols, RFA
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Olen Zellweger';
-- Luukkonen: 3 salary cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Ukko-Pekka Luukkonen';

-- CAROLINA
-- Aho: 5 cols, UFA 2032 → 6yr deal, yr 2 = 5 remaining. contract_len=6
UPDATE poolers_players SET contract_yrs = 5, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Sebastian Aho';
-- Ehlers: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Nikolaj Ehlers';
-- Svechnikov: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Andrei Svechnikov';
-- Jarvis: 5 cols, UFA 2032 → 6yr deal, yr 2
UPDATE poolers_players SET contract_yrs = 5, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Seth Jarvis';
-- Stankoven: 5 cols, UFA 2034 → 8yr deal, yr 4. contract_len=8
UPDATE poolers_players SET contract_yrs = 5, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Logan Stankoven';
-- Blake: 5 cols, UFA 2034 → 8yr deal, yr 4
UPDATE poolers_players SET contract_yrs = 5, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Jackson Blake';
-- K'Andre Miller: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 5, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'K''Andre Miller';
-- Kochetkov: 1 col UFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Pyotr Kochetkov';
-- Nikishin: no salary shown, RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Alexander Nikishin';

-- COLUMBUS
-- Nichushkin: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Valeri Nichushkin';
-- Garland: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 5, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Conor Garland';
-- Sillinger: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Cole Sillinger';
-- Voronkov: 1 col RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Dmitri Voronkov';
-- Marchenko: 1 col RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Kirill Marchenko';
-- Johnson: 1 col RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Kent Johnson';
-- Fantilli: ELC RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Adam Fantilli';
-- Werenski: 1 col UFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Zach Werenski';
-- Provorov: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 5, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Ivan Provorov';
-- Severson: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Damon Severson';
-- Mateychuk: 1 col RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Denton Mateychuk';
-- Greaves: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Jet Greaves';

-- CALGARY
-- Huberdeau: 5 cols, UFA 2031 = 5yr deal (IR)
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Jonathan Huberdeau';
-- Coronato: 5 cols, UFA 2032 → 6yr deal, yr 2
UPDATE poolers_players SET contract_yrs = 5, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Matt Coronato';
-- Nemec: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Simon Nemec';
-- Parekh: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Zayne Parekh';
-- Gridin: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Matvei Gridin';
-- Wolf: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 5, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Dustin Wolf';

-- CHICAGO
-- Bedard: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Connor Bedard';
-- Nazar: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 5, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Frank Nazar';
-- Kantserov: 3 cols RFA
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Roman Kantserov';
-- Frondell: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Anton Frondell';
-- Boisvert: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Sacha Boisvert';
-- Byram: 5 cols, UFA 2033 → 7yr deal (signing bonus shows 5 more cols = big deal). contract_len=7
UPDATE poolers_players SET contract_yrs = 5, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Bowen Byram';
-- Knight: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Spencer Knight';
-- Levshunov: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Artyom Levshunov';
-- Rinzel: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Sam Rinzel';

-- COLORADO
-- MacKinnon: 5 cols, UFA 2031 = originally 8yr deal signed 2023 (8 yrs, 5 remaining). contract_len=8
UPDATE poolers_players SET contract_yrs = 5, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Nathan MacKinnon';
-- Necas: 5 cols, UFA 2034 → 8yr deal. contract_len=8
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Martin Necas';
-- Makar: 5 cols, UFA 2035 → 9yr deal. contract_len=9
UPDATE poolers_players SET contract_yrs = 9, contract_len = 9, expiry_status = 'UFA' WHERE name ILIKE 'Cale Makar';
-- Toews: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Devon Toews';
-- Malinski: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Sam Malinski';
-- Blackwood: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'MacKenzie Blackwood';

-- DALLAS
-- Rantanen: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Mikko Rantanen';
-- Robertson: 1 col UFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Jason Robertson';
-- Hintz: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Roope Hintz';
-- Johnston: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Wyatt Johnston';
-- Harley: 5 cols, UFA 2034 → 8yr deal, yr 4. contract_len=8
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Thomas Harley';
-- Heiskanen: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Miro Heiskanen';
-- Oettinger: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Jake Oettinger';

-- DETROIT
-- Larkin: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Dylan Larkin';
-- Raymond: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 5, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Lucas Raymond';
-- DeBrincat: 1 col UFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Alex Debrincat';
-- Arvidsson: 2 cols
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Viktor Arvidsson';
-- Seider: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Moritz Seider';
-- Sandin-Pellikka: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Axel Sandin-Pellikka' OR name ILIKE 'Axel Sandin Pellikka';
-- Edvinsson: no salary shown, RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Simon Edvinsson';
-- Kasper: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Marco Kasper';
-- Finnie: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Emmitt Finnie';

-- EDMONTON
-- Draisaitl: 5 cols, UFA 2033 → originally 8yr deal. contract_len=8
UPDATE poolers_players SET contract_yrs = 7, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Leon Draisaitl';
-- McDavid: 2 cols (UFA 2028 original deal)
UPDATE poolers_players SET contract_yrs = 2, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Connor McDavid';
-- Bouchard: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Evan Bouchard';
-- Walman: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Jake Walman';
-- Savoie: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Matthew Savoie';
-- Podkolzin: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Vasily Podkolzin';

-- FLORIDA
-- Barkov: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Aleksander Barkov';
-- M.Tkachuk: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Matthew Tkachuk';
-- Reinhart: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 5, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Sam Reinhart';
-- B.Tkachuk: 1 col UFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Brady Tkachuk';
-- Bennett: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Sam Bennett';
-- Verhaeghe: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Carter Verhaeghe';
-- Marchand: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Brad Marchand';
-- Lundell: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Anton Lundell';
-- Luostarinen: 5 cols, UFA 2035 → 9yr deal, yr 5. contract_len=9
UPDATE poolers_players SET contract_yrs = 9, contract_len = 9, expiry_status = 'UFA' WHERE name ILIKE 'Eetu Luostarinen';
-- Seth Jones: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Seth Jones';
-- Ekblad: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Aaron Ekblad';
-- Forsling: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Gustav Forsling';
-- Schmid: 2 cols
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Akira Schmid';

-- LOS ANGELES
-- Panarin: 1 col UFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Artemi Panarin';
-- Kempe: 5 cols, UFA 2034 → 8yr deal, yr 4. contract_len=8
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Adrian Kempe';
-- Fiala: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Kevin Fiala';
-- Byfield: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Quinton Byfield';
-- Laferriere: 2 cols RFA
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'RFA' WHERE name ILIKE 'Alex Laferriere';
-- Zuccarello: 1 col UFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Mats Zuccarello';
-- Clarke: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Brandt Clarke';

-- MINNESOTA
-- Kaprizov: 5 cols, UFA 2034 → 8yr deal, yr 4. contract_len=8
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Kirill Kaprizov';
-- Boldy: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Matt Boldy';
-- Eriksson Ek: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Joel Eriksson Ek';
-- Brink: 1 col RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Bobby Brink';
-- Yurov: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Danila Yurov';
-- Faber: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Brock Faber';
-- Q.Hughes: 1 col UFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Quinn Hughes';
-- Wallstedt: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Jesper Wallstedt';
-- Gustavsson: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Filip Gustavsson';

-- MONTREAL
-- Suzuki: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Nick Suzuki';
-- Caufield: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Cole Caufield';
-- Slafkovsky: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Juraj Slafkovsky';
-- Demidov: ELC 1 col + big signing bonus future = 5yr deal UFA 2035. contract_len=5, yrs=1
UPDATE poolers_players SET contract_yrs = 1, contract_len = 5, expiry_status = 'RFA' WHERE name ILIKE 'Ivan Demidov';
-- Dobson: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Noah Dobson';
-- Hutson: 5 cols, UFA 2034 → 8yr deal, yr 4. contract_len=8
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Lane Hutson';
-- Fowler: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Jacob Fowler';
-- Dobes: 1 col + big future signing bonus = extension. yrs=1
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Jakub Dobes';

-- NEW JERSEY
-- Meier: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Timo Meier';
-- J.Hughes: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Jack Hughes';
-- Bratt: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Jesper Bratt';
-- Hischier: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Nico Hischier';
-- L.Hughes: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Luke Hughes';
-- Mercer: 1 col RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Dawson Mercer';
-- Evangelista: 1 col RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Luke Evangelista';

-- NASHVILLE
-- Forsberg: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Filip Forsberg';
-- Stamkos: 1 col UFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Steven Stamkos';
-- Bourque: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Mavrik Bourque';
-- Skjei: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Brady Skjei';
-- Saros: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Juuse Saros';

-- NY ISLANDERS
-- Barzal: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Mathew Barzal';
-- Horvat: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Bo Horvat';
-- Sorokin: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Ilya Sorokin';
-- Schaefer: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Matthew Schaefer';
-- Ritchie: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Calum Ritchie';
-- Holmstrom: 1 col RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Simon Holmstrom';
-- Maccelli: 1 col RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Matias Maccelli';

-- NY RANGERS
-- Dorofeyev: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Pavel Dorofeyev';
-- Zibanejad: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Mika Zibanejad';
-- JT Miller: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'J.T. Miller' OR name ILIKE 'JT Miller';
-- Lafreniere: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Alexis Lafreniere';
-- Cuylle: 1 col RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Will Cuylle';
-- Perreault: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Gabe Perreault';
-- Fox: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Adam Fox';
-- Gavrikov: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Vladislav Gavrikov';
-- Shesterkin: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Igor Shesterkin';

-- OTTAWA
-- Stutzle: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Tim Stutzle';
-- Pinto: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Shane Pinto';
-- Cozens: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Dylan Cozens';
-- Eklund: 3 cols RFA
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'William Eklund';
-- Batherson: 1 col UFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Drake Batherson';
-- Greig: 3 cols RFA
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Ridly Greig';
-- Yakemchuk: 3 cols RFA ELC
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Carter Yakemchuk';
-- Sanderson: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Jake Sanderson';
-- Chabot: 2 cols
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Thomas Chabot';
-- Spence: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Jordan Spence';
-- Ullmark: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Linus Ullmark';

-- PHILADELPHIA
-- Zegras: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Trevor Zegras';
-- Konecny: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7 (originally signed 8yr in 2025)
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Travis Konecny';
-- Couturier: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Sean Couturier';
-- Tippett: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Owen Tippett';
-- Foerster: 5 cols, UFA 2035 → 9yr deal, yr 5. contract_len=9
UPDATE poolers_players SET contract_yrs = 9, contract_len = 9, expiry_status = 'UFA' WHERE name ILIKE 'Tyson Foerster';
-- Michkov: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Matvei Michkov';
-- Martone: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Porter Martone';
-- Sanheim: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Travis Sanheim';
-- Drysdale: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Jamie Drysdale';
-- York: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Cam York';
-- Woll: 2 cols
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Joseph Woll';

-- PITTSBURGH
-- Crosby: 1 col UFA +35
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Sidney Crosby';
-- Malkin: 1 col UFA +35
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Evgeni Malkin';
-- Chinakhov: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Egor Chinakhov';
-- Rust: 2 cols
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Bryan Rust';
-- Rakell: 2 cols
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Rickard Rakell';
-- Karlsson: 1 col UFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Erik Karlsson';
-- Silovs: 1 col RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Arturs Silovs';

-- SEATTLE
-- Beniers: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Matthew Beniers' OR name ILIKE 'Matty Beniers';
-- Stephenson: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Chandler Stephenson';
-- McMann: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Bobby McMann';
-- Montour: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Brandon Montour';
-- Evans: 1 col RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Ryker Evans';
-- Catton: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Berkly Catton';
-- Wright: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Shane Wright';
-- Samoskevich: 3 cols RFA
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Mackie Samoskevich';
-- Daccord: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Joey Daccord';

-- SAN JOSE
-- Celebrini: ELC 1 col + 5 signing bonus yrs shown → 5yr deal UFA 2032. contract_len=5, yrs=1 (ELC yr 2 actually)
UPDATE poolers_players SET contract_yrs = 1, contract_len = 5, expiry_status = 'RFA' WHERE name ILIKE 'Macklin Celebrini';
-- Will Smith: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Will Smith';
-- Marchment: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Mason Marchment';
-- Nurse: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Darnell Nurse';
-- Trouba: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Jacob Trouba';
-- Dickinson: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Sam Dickinson';
-- Askarov: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Yaroslav Askarov';

-- ST. LOUIS
-- R.Thomas: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Robert Thomas';
-- Buchnevich: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Pavel Buchnevich';
-- Holloway: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Dylan Holloway';
-- McTavish: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Mason McTavish';
-- McMichael: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Connor McMichael';
-- Neighbours: 1 col RFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'RFA' WHERE name ILIKE 'Jake Neighbours';
-- Broberg: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Philip Broberg';
-- Fowler: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Cam Fowler';
-- Snuggerud: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Jimmy Snuggerud';
-- Dvorsky: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Dalibor Dvorsky';
-- Binnington: 1 col UFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Jordan Binnington';

-- TAMPA BAY
-- Kucherov: 1 col UFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Nikita Kucherov';
-- Point: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Brayden Point';
-- Guentzel: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Jake Guentzel';
-- Hagel: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Brandon Hagel';
-- Cirelli: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Anthony Cirelli';
-- Hedman: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Victor Hedman';
-- Carlson: 2 cols +35
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'John Carlson';
-- Vasilevskiy: 2 cols
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Andrei Vasilevskiy';
-- Moser: 5 cols, UFA 2034 → 8yr deal, yr 4. contract_len=8
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Janis Moser' OR name ILIKE 'JJ Moser';

-- TORONTO
-- Matthews: 2 cols
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Auston Matthews';
-- Nylander: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'William Nylander';
-- Knies: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Matthew Knies';
-- Tavares: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'John Tavares';
-- McKenna: 3 cols RFA ELC
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Gavin McKenna';
-- Cowan: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Easton Cowan';
-- D.Raddysh: 5 cols, UFA 2034 → 8yr deal, yr 4. contract_len=8
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Darren Raddysh';
-- Bobrovsky: 3 cols +35
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Sergei Bobrovsky';
-- Stolarz: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Anthony Stolarz';

-- UTAH
-- Cooley: 5 cols, UFA 2034 → 8yr deal, yr 4. contract_len=8
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Logan Cooley';
-- Schmaltz: 5 cols, UFA 2034 → 8yr deal, yr 4. contract_len=8
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Nick Schmaltz';
-- Keller: 2 cols
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Clayton Keller';
-- Guenther: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Dylan Guenther';
-- Sergachev: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Mikhail Sergachev';
-- Weegar: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'MacKenzie Weegar';
-- Vejmelka: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Karel Vejmelka';

-- VANCOUVER
-- Pettersson: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Elias Pettersson';
-- Boeser: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Brock Boeser';
-- DeBrusk: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Jake DeBrusk';
-- Rossi: 2 cols RFA
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'RFA' WHERE name ILIKE 'Marco Rossi';
-- Hronek: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Filip Hronek';
-- Willander: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Tom Willander';
-- Buium: 1 col + big signing bonus = 5yr deal UFA 2035. contract_len=5, yrs=1
UPDATE poolers_players SET contract_yrs = 1, contract_len = 5, expiry_status = 'RFA' WHERE name ILIKE 'Zeev Buium';
-- Demko: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Thatcher Demko';

-- VEGAS
-- Eichel: 5 cols, UFA 2034 → 8yr deal, yr 4. contract_len=8
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Jack Eichel';
-- Marner: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Mitch Marner';
-- Hertl: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Tomas Hertl';
-- Andersson: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 7, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Rasmus Andersson';
-- Theodore: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Shea Theodore';
-- Hanifin: 5 cols, UFA 2032 → 6yr deal, yr 2. contract_len=6
UPDATE poolers_players SET contract_yrs = 6, contract_len = 6, expiry_status = 'UFA' WHERE name ILIKE 'Noah Hanifin';
-- Hill: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Adin Hill';
-- Hart: 1 col UFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Carter Hart';

-- WASHINGTON
-- Tuch: 5 cols, UFA 2034 → 8yr deal, yr 4. contract_len=8
UPDATE poolers_players SET contract_yrs = 5, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Alex Tuch';
-- Dubois: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Pierre-Luc Dubois';
-- Kyrou: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Jordan Kyrou';
-- Wilson: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Tom Wilson';
-- Jenner: 4 cols
UPDATE poolers_players SET contract_yrs = 4, contract_len = 4, expiry_status = 'UFA' WHERE name ILIKE 'Boone Jenner';
-- Strome: 2 cols
UPDATE poolers_players SET contract_yrs = 2, contract_len = 2, expiry_status = 'UFA' WHERE name ILIKE 'Dylan Strome';
-- Ovechkin: 1 col UFA
UPDATE poolers_players SET contract_yrs = 1, contract_len = 1, expiry_status = 'UFA' WHERE name ILIKE 'Alex Ovechkin';
-- Protas A: 3 cols
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'UFA' WHERE name ILIKE 'Aliaksei Protas';
-- Leonard: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Ryan Leonard';
-- Protas I: 3 cols RFA ELC
UPDATE poolers_players SET contract_yrs = 3, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Ilya Protas';
-- Chychrun: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 5, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Jakob Chychrun';
-- Fehervary: 5 cols, UFA 2033 → 7yr deal, yr 3. contract_len=7
UPDATE poolers_players SET contract_yrs = 5, contract_len = 7, expiry_status = 'UFA' WHERE name ILIKE 'Martin Fehervary';
-- Thompson L: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Logan Thompson';
-- Hutson C: 1 col RFA ELC
UPDATE poolers_players SET contract_yrs = 1, contract_len = 3, expiry_status = 'RFA' WHERE name ILIKE 'Cole Hutson';

-- WINNIPEG
-- Connor: 5 cols, UFA 2034 → 8yr deal, yr 4. contract_len=8
UPDATE poolers_players SET contract_yrs = 8, contract_len = 8, expiry_status = 'UFA' WHERE name ILIKE 'Kyle Connor';
-- Scheifele: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Mark Scheifele';
-- Vilardi: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Gabriel Vilardi';
-- Perfetti: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Cole Perfetti';
-- Pionk: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Neal Pionk';
-- Hellebuyck: 5 cols, UFA 2031 = 5yr deal
UPDATE poolers_players SET contract_yrs = 5, contract_len = 5, expiry_status = 'UFA' WHERE name ILIKE 'Connor Hellebuyck';
