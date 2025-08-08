# Manchester United Football Club Database
## Overview
A MySQL database to manage Manchester United’s players, matches, transfers, and coaches, built to demonstrate SQL skills.

## Schema
- Tables: Players, Matches, Transfers, PlayerMatchStats, Coaches

## Setup
1. Install MySQL and MySQL Workbench.
2. Run create_tables.sql and insert_data.sql.
3. Test queries in queries.sql.

## Sample Query
```sql
SELECT m.Opponent, m.MatchDate, p.Name, pms.Goals, pms.Assists
FROM Matches m
JOIN PlayerMatchStats pms ON m.MatchID = pms.MatchID
JOIN Players p ON pms.PlayerID = p.PlayerID
WHERE pms.Goals > 0 OR pms.Assists > 0;
