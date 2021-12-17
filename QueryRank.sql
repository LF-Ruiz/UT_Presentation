SELECT pl.player_id,
	df.pick,
	df.year,
	ta.t_name,
	cf.c_name
FROM nfl_player pl
RIGHT OUTER JOIN nfl_draft df
ON pl.player_id = df.player_id
LEFT OUTER JOIN ncaa_teams ta
ON pl.i_id = ta.i_id
LEFT OUTER JOIN ncaa_conferences cf
ON cf.c_id = ta.c_id
WHERE ta.i_id = '10551'
ORDER BY pick ASC;


SELECT * FROM nfl_draft
ORDER BY pick ASC;

Select * from nfl_player
WHERE i_id = '10546'
ORDER BY i_id

SELECT * FROM ncaa_teams
WHERE t_name LIKE '%Texas%'
ORDER BY i_id