CREATE TABLE Players (
    PlayerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Position VARCHAR(30),
    Nationality VARCHAR(30),
    Age INT,
    GoalsScored INT DEFAULT 0
);

CREATE TABLE Matches (
    MatchID INT PRIMARY KEY AUTO_INCREMENT,
    Opponent VARCHAR(50),
    MatchDate DATE,
    Score VARCHAR(10),
    Competition VARCHAR(50)
);

CREATE TABLE Transfers (
    TransferID INT PRIMARY KEY AUTO_INCREMENT,
    PlayerID INT,
    TransferType ENUM('In', 'Out') NOT NULL,
    Fee DECIMAL(10,2),
    TransferDate DATE,
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID)
);

CREATE TABLE PlayerMatchStats (
    PlayerID INT,
    MatchID INT,
    Goals INT DEFAULT 0,
    Assists INT DEFAULT 0,
    PRIMARY KEY (PlayerID, MatchID),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID)
);