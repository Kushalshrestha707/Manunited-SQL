select   * from matches;

-- List top goal scorers

select p.name, sum(pms.goals)
as totalgoals
from players p
join playermatchstats pms on
p.PlayerID = pms.PlayerID
group by p.name
order by totalgoals desc;


-- List top assists

select p.name, sum(pms.assists)
as totalassists
from players p
join playermatchstats pms on
p.PlayerID = pms.PlayerID
group by p.name
order by totalassists desc;



-- List recent transfers

SELECT p.Name, t.TransferType, t.Fee, t.TransferDate
FROM Players p
JOIN Transfers t ON p.PlayerID = t.PlayerID
WHERE t.TransferDate >= '2025-08-01';

-- Matches with player contributions

select m.Opponent, m.MatchDate, p.Name, pms.Goals, pms.Assists
FROM Matches m
JOIN PlayerMatchStats pms ON m.MatchID = pms.MatchID
JOIN Players p ON pms.PlayerID = p.PlayerID
WHERE  pms.Goals >= 0  ;

DELIMITER //
CREATE PROCEDURE AddMatch(
    IN opponent VARCHAR(50),
    IN matchDate DATE,
    IN score VARCHAR(10),
    IN competition VARCHAR(50)
)
BEGIN
    INSERT INTO Matches (Opponent, MatchDate, Score, Competition)
    VALUES (opponent, matchDate, score, competition);
END //
DELIMITER ;

-- Test the procedure
CALL AddMatch('Liverpool', '2025-08-15', '3-2', 'Premier League');

DELIMITER //
CREATE TRIGGER UpdateGoals
AFTER INSERT ON PlayerMatchStats
FOR EACH ROW
BEGIN
    UPDATE Players
    SET GoalsScored = GoalsScored + NEW.Goals
    WHERE PlayerID = NEW.PlayerID ;
    end //
    delimiter ;
    INSERT INTO PlayerMatchStats (PlayerID, MatchID, Goals, Assists)
VALUES ((SELECT PlayerID FROM Players WHERE Name = 'Benjamin Sesko' LIMIT 1), 
        (SELECT MatchID FROM Matches WHERE Opponent = 'Fiorentina' LIMIT 1), 2, 0);
SELECT Name, GoalsScored FROM Players WHERE Name = 'Benjamin Sesko';

