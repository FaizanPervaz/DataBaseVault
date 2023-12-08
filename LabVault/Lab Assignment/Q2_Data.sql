INSERT INTO AppUser (UserID, Email, FullName, Password, Country, Username)
VALUES
    (1, 'user1@example.com', 'User One', 'password1', 'Country A', 'user1'),
    (2, 'user2@example.com', 'User Two', 'password2', 'Country B', 'user2'),
    (3, 'user3@example.com', 'User Three', 'password3', 'Country C', 'user3'),
    (4, 'user4@example.com', 'User Four', 'password4', 'Country D', 'user4');

INSERT INTO Game (GameID, StartDateTime, Status, Mode)
VALUES
    (1, '2023-10-30 10:00:00', 'Finished', 'Multiplayer'),
    (2, '2023-10-29 15:30:00', 'Ongoing', 'Dual Player'),
    (3, '2023-10-28 09:15:00', 'Finished', 'Multiplayer'),
    (4, '2023-10-27 14:45:00', 'Ongoing', 'Multiplayer');

INSERT INTO Player (PlayerID, UserID, GameID, CurrentTurn)
VALUES
    (1, 1, 1, 1),
    (2, 2, 1, 2),
    (3, 3, 1, 3),
    (4, 4, 1, 4);

INSERT INTO Token (TokenID, Position, Status)
VALUES
    (1, 0, 'In Yard'),
    (2, 0, 'In Yard'),
    (3, 0, 'In Yard'),
    (4, 0, 'In Yard');

INSERT INTO Invitation (InvitationID, SenderID, ReceiverID, GameID, AcceptanceStatus)
VALUES
    (1, 1, 2, 1, 'Accepted'),
    (2, 2, 3, 1, 'Declined'),
    (3, 3, 4, 2, 'Pending'),
    (4, 4, 1, 2, 'Accepted');

INSERT INTO ScoreBoard (ScoreBoardID, GameID, PlayerID, Standing)
VALUES
    (1, 1, 1, 1),
    (2, 1, 2, 2),
    (3, 1, 3, 3),
    (4, 1, 4, 4);
