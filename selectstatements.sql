/* -------- USER STUFF -------- */
/* Returns a specific user, specified by username */
SELECT * FROM Users WHERE username = "!!username!!";

/* Returns all users that have a rating higher than number */
SELECT * FROM Users WHERE rating >= !!number!!;

/* Returns all game ids a user owns */
SELECT gameid FROM Owns WHERE userid = !!userid here!!;

/* Returns all game ids a user is interested in */
SELECT gameid FROM Interested_in WHERE userid = !!userid here!!;

/* Returns all raid ids a user has/is attended/attending */
SELECT raidid FROM Attending WHERE userid = !!userid here!!;

/* Returns all user ids of a user's friends */
SELECT friendid FROM Friends_with WHERE userid = !!userid here!!;

/* Returns all user ids of admins */
SELECT userid FROM Users WHERE admin = 'y' OR admin = 'Y';

/* Returns the admin status of a specific user ID. Admins should be marked
'y' or 'Y' */
SELECT admin FROM Users WHERE userid = !!user id here!!;

/* -------- RAID STUFF -------- */
/* Returns all raids */
SELECT * FROM Raids;

/* Returns the party id of the party hosting the raid */
SELECT partyid FROM Hosting WHERE raidid = !!raidid here!!;

/* Returns all userids of people attending a raid */
SELECT userid FROM Attending WHERE raidid = !!raid id here!!;


/* -------- GAMES STUFF -------- */
/* Returns all games with specified min and max num of players, difficulty level and rating */
SELECT * FROM Games
WHERE minplayers >= !!minimum number of players!!
AND maxplayers <= !!max num of players!!
AND difficulty/numdiff <= !!max difficulty!!
AND rating/numrate >= !!min rating!!;

/* Returns all game ids of a specified game category.
To specify multiple categories, use UNION on multiple calls to this SELECT
ie:
SELECT gameid FROM OfCategory WHERE gamecategory = "Cards"
UNION
SELECT gameid FROM OfCategory WHERE gamecategory = "Strategy"; */
SELECT gameid FROM OfCategory WHERE gamecategory = "!!game category!!";

/* Returns all game categories of a specific game */
SELECT gamecategory FROM OfCategory WHERE gameid = !!game id here!!;

/* Returns all game categories */
SELECT * FROM GameCategory;

/* Returns all user ids that own a game */
SELECT userid FROM Owns WHERE gameid = !!gameid here!!;

/* Returns all user ids that are interested in a game
with specified skill*/
SELECT userid FROM Interested_in WHERE gameid = !!gameid here!! AND skill >= !!min skill here!! AND skill <= !!max skill here!!;

/* -------- PRIVATE & PARTY MESSAGE STUFF -------- */
/* Returns the text of a specified message id */
SELECT message FROM Messages WHERE messageid = !!message id here!!;

/* Returns all private message ids that someone sent */
SELECT messageid FROM Messaged WHERE senderid = !!sender id here!!;

/* Returns all private message ids that someone received */
SELECT messageid FROM Messaged WHERE receiverid = !!receiver id here!!;

/* Returns the text of a specified party message id */
SELECT pmessage FROM PartyMessages WHERE pmessageid = !!pmessage id here!!;

/* Returns all party message ids of a specified party */
SELECT pmessageid FROM PartyMessaged WHERE partyid = !!partyid here!!;

/*Returns all party message ids of a specified user */
SELECT pmessageid FROM PartyMessaged WHERE userid = !!userid here!!;


/* -------- RAID REVIEW STUFF -------- */
/* Returns all raid review ids of a specific user */
SELECT reviewid FROM RaidReviews WHERE reviewerid = !!reviewer id here!!;

/* Returns all raid review ids of a specific raid */
SELECT reviewid FROM RaidReviews WHERE raidid = !!raid id here!!;

/* Returns a review by a specified raid id */
SELECT review from RaidReviews WHERE reviewid = !!raid id here!!;

/* -------- PARTY STUFF -------- */
/* Returns all user ids of a party */
SELECT userid FROM Member_of WHERE partyid = !!party id here!!;

/* Returns all party ids a user is a member of */
SELECT partyid FROM Member_of WHERE userid = !!userid here!!;

/* Returns all parties with a required skill and required rating level */
SELECT * FROM Parties WHERE reqskill >= !!required skill level!! AND reqrating >= !!required rating!!;

/* Returns all raid ids a party is/has hosting/hosted */
SELECT raidid FROM Hosting WHERE partyid = !!party id here!!;
