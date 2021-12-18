SELECT pl.player_id,
	df.pick,
	df.year,
	ta.t_name,
	cf.c_name,
	l.state
FROM nfl_player pl
RIGHT OUTER JOIN nfl_draft df
ON pl.player_id = df.player_id
LEFT OUTER JOIN ncaa_teams ta
ON pl.i_id = ta.i_id
LEFT OUTER JOIN ncaa_conferences cf
ON cf.c_id = ta.c_id
LEFT OUTER JOIN loc l
ON pl.i_id = l.i_id
WHERE t_name LIKE 'Texas%'
ORDER BY t_name ASC;





