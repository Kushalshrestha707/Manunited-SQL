INSERT INTO Players (Name, Position, Nationality, Age, GoalsScored)
VALUES 
    ('Bruno Fernandes', 'Midfielder', 'Portugal', 30, 10),
    ('Alejandro Garnacho', 'Winger', 'Argentina', 21, 5),
    ('Benjamin Sesko', 'Striker', 'Slovenia', 22, 0);

INSERT INTO Matches (Opponent, MatchDate, Score, Competition)
VALUES 
    ('Everton', '2025-08-04', '2-2', 'Friendly'),
    ('Bournemouth', '2025-08-01', '4-1', 'Premier League'),
    ('Fiorentina', '2025-08-10', '0-0', 'Premier League');

INSERT INTO Transfers (PlayerID, TransferType, Fee, TransferDate)
VALUES 
    ((SELECT PlayerID FROM Players WHERE Name = 'Benjamin Sesko'), 'In', 74.00, '2025-08-07'),
    ((SELECT PlayerID FROM Players WHERE Name = 'Alejandro Garnacho'), 'Out', NULL, '2025-08-07');

INSERT INTO PlayerMatchStats (PlayerID, MatchID, Goals, Assists)
VALUES 
    ((SELECT PlayerID FROM Players WHERE Name = 'Bruno Fernandes'), 
     (SELECT MatchID FROM Matches WHERE Opponent = 'Bournemouth'), 1, 2),
	
        ((SELECT PlayerID FROM Players WHERE Name = 'Alejandro Garnacho'), 
     (SELECT MatchID FROM Matches WHERE Opponent = 'Everton'), 0, 1);
  