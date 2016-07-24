CREATE TABLE Users (
userid integer primary key autoincrement,
username text UNIQUE not null CONSTRAINT uname_constraint CHECK (length(username) < 17),
password text not null CONSTRAINT pw_constraint CHECK (password != '' AND length(password) < 17),
name text not null CONSTRAINT name_constraint CHECK (length(name) < 101),
postalcode text not null,
rating integer default 0
);

CREATE INDEX user_pcode_index ON Users(postalcode);
CREATE INDEX user_rating_index ON Users(rating);

CREATE TABLE Parties (
partyid integer primary key autoincrement,
partyname text not null CONSTRAINT pname_constraint CHECK (length(partyname) < 101),
reqskill integer CONSTRAINT reqskill_constraint CHECK (reqskill > 0 AND reqskill < 6),
reqrating integer CONSTRAINT reqrating_constraint CHECK (reqrating > 0 AND reqrating < 6),
maxnumpeople integer
);

CREATE TABLE Raids (
raidid integer primary key autoincrement,
raidname text not null CONSTRAINT rname_constraint CHECK (length(raidname) < 101),
address text not null CHECK (length(raidname) < 101),
postalcode text not null,
raiddate date not null,
raidtime time not null
);

CREATE INDEX raid_pcode_index ON Raids(postalcode);

CREATE TABLE Games (
gameid integer primary key autoincrement,
gamename text UNIQUE not null CONSTRAINT gname_constraint CHECK (length(gamename) < 101),
category text,
minplayers integer not null,
maxplayers integer not null,
difficulty integer default 0,
numdiff integer default 0,
rating integer default 0,
numrate integer default 0,
CONSTRAINT numplayers_constraint CHECK (minplayers <= maxplayers)
);

CREATE TABLE RaidReviews (
reviewid integer primary key autoincrement,
review text
);

CREATE TABLE Messages (
messageid integer primary key autoincrement,
message text
);

CREATE TABLE PartyMessages (
pmessageid integer primary key autoincrement,
message text
);

/* Matches party message to a sender and a receiving party */
CREATE TABLE PartyMessaged (
userid integer references Users(userid)
ON DELETE CASCADE,
partyid integer references Parties(partyid)
ON DELETE CASCADE,
pmessageid integer references PartyMessages(pmessageid)
ON DELETE CASCADE
);

/* Matches a message to a sender and receiver */
CREATE TABLE Messaged (
senderid integer references Users(userid)
ON DELETE CASCADE,
receiverid integer references Users(userid)
ON DELETE CASCADE,
messageid integer references Messages(messageid)
ON DELETE CASCADE
);

/* Matches a review to a reviewer and a raid */
CREATE TABLE Reviewed (
revieweeid integer references Users(userid)
ON DELETE CASCADE,
raidid integer references Raids(raidid)
ON DELETE CASCADE,
reviewid integer references RaidReviews(reviewid)
ON DELETE CASCADE
);

/* Specific user member of specific party */
CREATE TABLE Member_of (
userid integer references users(userid)
ON DELETE CASCADE,
partyid integer references Parties(partyid)
ON DELETE CASCADE
);

/* Specific user owns specific game */
CREATE TABLE Owns (
userid integer references users(userid)
ON DELETE CASCADE,
gameid integer references games(gameid)
ON DELETE CASCADE
);

/* Game that a specific user is interested in along with their skill level */
CREATE TABLE Interested_in (
userid integer references users(userid)
ON DELETE CASCADE,
gameid integer references games(gameid)
ON DELETE CASCADE,
skill integer CONSTRAINT skill_constraint CHECK (skill > 0 AND skill < 6)
);

/* Specific party hosting specific raid */
CREATE TABLE Hosting (
userid integer references parties(partyid)
ON DELETE CASCADE,
raidid integer references raids(raidid)
ON DELETE CASCADE
);

/* Specific user attending specific raid */
CREATE TABLE Attending (
userid integer references users(userid)
ON DELETE CASCADE,
raidid integer references raids(raidid)
ON DELETE CASCADE
);

/* Self relationship between different users */
CREATE TABLE Friends_with (
userid integer references users(userid)
ON DELETE CASCADE,
friendid integer references users(userid)
ON DELETE CASCADE
);
