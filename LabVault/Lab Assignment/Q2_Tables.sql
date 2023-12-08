CREATE TABLE AppUser (
    UserID INT PRIMARY KEY,
    Email VARCHAR(255),
    FullName VARCHAR(255),
    Password VARCHAR(255),
    Country VARCHAR(50),
    Username VARCHAR(50) UNIQUE
);

CREATE TABLE Game (
    GameID INT PRIMARY KEY,
    StartDateTime DATETIME,
    EndDateTime DATETIME,
    Status VARCHAR(20),
    Mode VARCHAR(20)
);

CREATE TABLE Player (
    PlayerID INT PRIMARY KEY,
    UserID INT,
    GameID INT,
    CurrentTurn INT,
    FOREIGN KEY (UserID) REFERENCES AppUser(UserID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID)
);

CREATE TABLE Token (
    TokenID INT PRIMARY KEY,
    Position INT,
    Status VARCHAR(20)
);

CREATE TABLE Invitation (
    InvitationID INT PRIMARY KEY,
    SenderID INT,
    ReceiverID INT,
    GameID INT,
    AcceptanceStatus VARCHAR(20),
    FOREIGN KEY (SenderID) REFERENCES Player(PlayerID),
    FOREIGN KEY (ReceiverID) REFERENCES Player(PlayerID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID)
);

CREATE TABLE ScoreBoard (
    ScoreBoardID INT PRIMARY KEY,
    GameID INT,
    PlayerID INT,
    Standing INT,
    FOREIGN KEY (GameID) REFERENCES Game(GameID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)
);
