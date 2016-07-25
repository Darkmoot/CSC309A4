CREATE TABLE Users (
userid SERIAL PRIMARY KEY,
username VARCHAR(16) UNIQUE NOT NULL,
password VARCHAR(16) NOT NULL,
name VARCHAR(100) NOT NULL,
postalcode CHAR(7) NOT NULL,
rating INTEGER default 0
);

CREATE INDEX user_pcode_index ON Users(postalcode);
CREATE INDEX user_rating_index ON Users(rating);

CREATE TABLE Parties (
partyid SERIAL PRIMARY KEY,
partyname VARCHAR(100) NOT NULL,
reqskill INTEGER CONSTRAINT reqskill_constraint CHECK (reqskill > 0 AND reqskill < 6),
reqrating INTEGER CONSTRAINT reqrating_constraint CHECK (reqrating > 0 AND reqrating < 6),
maxnumpeople INTEGER CONSTRAINT maxnumpeople_constraint CHECK (maxnumpeople > 0)
);

CREATE TABLE Raids (
raidid SERIAL PRIMARY KEY,
raidname VARCHAR(100) NOT NULL,
address VARCHAR(100) NOT NULL,
postalcode CHAR(7) NOT NULL,
raiddate DATE NOT NULL,
raidtime TIME NOT NULL
);

CREATE INDEX raid_pcode_index ON Raids(postalcode);

CREATE TABLE Games (
gameid SERIAL PRIMARY KEY,
gamename VARCHAR(100) UNIQUE NOT NULL,
minplayers INTEGER NOT NULL,
maxplayers INTEGER NOT NULL,
difficulty INTEGER default 0,
numdiff INTEGER default 0,
rating INTEGER default 0,
numrate INTEGER default 0,
CONSTRAINT numplayers_constraint CHECK (minplayers <= maxplayers)
);

CREATE TABLE GameCategory (
  gamecategory VARCHAR(30) PRIMARY KEY
);

/* Matches a game to a game category */
CREATE TABLE OfCategory (
  gameid INTEGER REFERENCES Games(gameid),
  gamecategory VARCHAR(30) REFERENCES GameCategory(gamecategory)
);

CREATE TABLE RaidReviews (
reviewid SERIAL PRIMARY KEY,
review VARCHAR(2000)
);

CREATE TABLE Messages (
messageid SERIAL PRIMARY KEY,
message VARCHAR(2000)
);

CREATE TABLE PartyMessages (
pmessageid SERIAL PRIMARY KEY,
message VARCHAR(2000)
);

/* Matches party message to a sender and a receiving party */
CREATE TABLE PartyMessaged (
userid INTEGER REFERENCES Users(userid)
ON DELETE CASCADE,
partyid INTEGER REFERENCES Parties(partyid)
ON DELETE CASCADE,
pmessageid INTEGER REFERENCES PartyMessages(pmessageid)
ON DELETE CASCADE
);

/* Matches a message to a sender and receiver */
CREATE TABLE Messaged (
senderid INTEGER REFERENCES Users(userid)
ON DELETE CASCADE,
receiverid INTEGER REFERENCES Users(userid)
ON DELETE CASCADE,
messageid INTEGER REFERENCES Messages(messageid)
ON DELETE CASCADE
);

/* Matches a review to a reviewer and a raid */
CREATE TABLE Reviewed (
reviewerid INTEGER REFERENCES Users(userid)
ON DELETE CASCADE,
raidid INTEGER REFERENCES Raids(raidid)
ON DELETE CASCADE,
reviewid INTEGER REFERENCES RaidReviews(reviewid)
ON DELETE CASCADE
);

/* Specific user member of specific party */
CREATE TABLE Member_of (
userid INTEGER REFERENCES users(userid)
ON DELETE CASCADE,
partyid INTEGER REFERENCES Parties(partyid)
ON DELETE CASCADE
);

/* Specific user owns specific game */
CREATE TABLE Owns (
userid INTEGER REFERENCES users(userid)
ON DELETE CASCADE,
gameid INTEGER REFERENCES games(gameid)
ON DELETE CASCADE
);

/* Game that a specific user is interested in along with their skill level */
CREATE TABLE Interested_in (
userid INTEGER REFERENCES users(userid)
ON DELETE CASCADE,
gameid INTEGER REFERENCES games(gameid)
ON DELETE CASCADE,
skill INTEGER CONSTRAINT skill_constraint CHECK (skill > 0 AND skill < 6)
);

/* Specific party hosting specific raid */
CREATE TABLE Hosting (
partyid INTEGER REFERENCES parties(partyid)
ON DELETE CASCADE,
raidid INTEGER REFERENCES raids(raidid)
ON DELETE CASCADE
);

/* Specific user attending specific raid */
CREATE TABLE Attending (
userid INTEGER REFERENCES users(userid)
ON DELETE CASCADE,
raidid INTEGER REFERENCES raids(raidid)
ON DELETE CASCADE
);

/* Self relationship between different users */
CREATE TABLE Friends_with (
userid INTEGER REFERENCES users(userid)
ON DELETE CASCADE,
friendid INTEGER REFERENCES users(userid)
ON DELETE CASCADE
);
