SELECT pl.player_id, df.pick AS "Pick", df.round AS "Round", df.year AS "Year", 
	ta.t_name AS "College", cf.c_name AS "Conference", l.state AS "State",
	CASE
		WHEN pick > 0 AND pick <= 5 THEN 10
		WHEN pick > 5 AND pick <= 10 THEN 9
		WHEN pick > 10 AND pick <= 32 THEN 8
		WHEN pick > 32 AND pick <= 48 THEN 7
		WHEN pick > 48 AND pick <= 64 THEN 6
		WHEN pick > 64 AND pick <= 96 THEN 5
		WHEN pick > 96 AND pick <= 128 THEN 4
		WHEN pick > 128 AND pick <= 160 THEN 3
		WHEN pick > 160 AND pick <= 192 THEN 2
		ELSE 1
	END "Coeficient" 
FROM nfl_player pl
RIGHT OUTER JOIN nfl_draft df
ON pl.player_id = df.player_id
LEFT OUTER JOIN ncaa_teams ta
ON pl.i_id = ta.i_id
LEFT OUTER JOIN ncaa_conferences cf
ON cf.c_id = ta.c_id
LEFT OUTER JOIN loc l
ON pl.i_id = l.i_id
ORDER BY pick, year, round, pick ASC;





