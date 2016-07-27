/* Change a user's basic information */
UPDATE Users
SET password = '!!new password!!', name = '!!new name!!', generalarea = '!!new area!!'
WHERE userid = !!their userid!!;

/* Change a user's rating */
UPDATE Users
SET rating = rating + !!change in rating!!
WHERE userid = !!their userid!!;

/* Change a user's admin status */
UPDATE Users
SET admin = !!'y' or 'n'!!
WHERE userid = !!their userid!!;

/* Change a party's information */
UPDATE Parties
SET partyname = '!!new partyname!!', reqskill = !!new reqskill!!, reqrating = !!new reqrating!!, maxnumpeople = !!new max!!
WHERE partyid = !!their partyid!!;

/* Change a raid's information */
UPDATE Raids
Set raidname = '!!new raidname!!', address = '!!new address!!', generalarea = '!!new general area!!', raiddate = '!!new raiddate!!', raidtime = '!!new raidtime!!'
WHERE raidid = !!their raidid!!;

/* Change a game's information (game name and player numbers probably won't change so I haven't included those attributes)
Basically used for users assigning a difficulty to a game and rating it */
UPDATE Games
SET difficulty = difficulty + !!the difficulty they assigned!!, numdiff = numdiff + 1, rating = rating + !!the rating they assigned!!, numrate = numrate + 1
WHERE gameid = !!the gameid!!;

/* Change a raid review (if someone wanted to edit their review for example) */
UPDATE RaidReviews
SET review = '!!new review!!'
WHERE reviewid = !!the reviewid!!;

/* Change a private message */
UPDATE Messages
SET message = '!!new message!!'
WHERE messageid = !!the messageid!!;

/* Change a party message */
UPDATE PartyMessages
SET pmessage = '!!new pmessage!!'
WHERE pmessageid = !!the pmessageid!!;

/* Change a players self-evaluated skill level of a game they're interested in.
The table-level constraint will prevent a value less than 1 or greater than 5 from going through */
UPDATE Interested_in
SET skill = !!new skill!!
WHERE userid = !!their userid!! AND gameid = !!the gameid!!;
