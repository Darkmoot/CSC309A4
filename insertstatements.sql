/* Statement to create a new user */
INSERT INTO Users(userid, username, password, name, generalarea, rating, admin)
VALUES (DEFAULT, '!!username!!', '!!password!!', '!!name!!', '!!generalarea!!', DEFAULT, 'n');

/* Statement to create a new party
Also setting the creator of the party,
as well as adding the host to the member of list */
BEGIN TRANSACTION;
INSERT INTO Parties(partyid, partyname, reqskill, reqrating, maxnumpeople)
VALUES (DEFAULT, !!partyname!!, !!reqskill!!, !!reqrating!!, !!maxnumpeople!!);
INSERT INTO Member_of(userid, partyid)
VALUES (!!userid!!, currval('Parties_partyid_seq'));
INSERT INTO AdminsParty(userid, partyid)
VALUES (!!userid!!, currval('Parties_partyid_seq'));
END TRANSACTION;

/* Creating a new Raid
Note that raiddate should be input in this format: '2016-7-31'
And raidtime should be input as '13:00:00'
*/
BEGIN TRANSACTION;
INSERT INTO Raids(raidid, raidname, address, generalarea, raiddate, raidtime)
VALUES (DEFAULT, '!!raidname!!', '!!address!!', '!!generalarea!!', '!!raiddate!!', '!!raidtime!!');
INSERT INTO Hosting(partyid, raidid)
VALUES (!!partyid!!, currval('Raids_raidid_seq'));
/* Sets all members of a party to Attending the raid */
INSERT INTO Attending(userid, raidid)
SELECT userid, currval('Raids_raidid_seq')
FROM Member_of
WHERE partyid = !!partyid!!;
END TRANSACTION;

/* Creating a new Game entry */
INSERT INTO Games(gameid, gamename, minplayers, maxplayers, difficulty, numdiff, rating, numrate)
VALUES (Default, '!!gamename!!', !!minplayers!!, !!maxplayers!!, Default, Default, Default, Default);

/* Creating a new GameCategory */
INSERT INTO GameCategory(gamecategory)
VALUES ('!!gamecategory!!');

/* Setting a game to a game category */
INSERT INTO OfCategory (gameid, gamecategory)
VALUES (!!gameid!!, '!!gamecategory!!');

/* Creating a new Raid review
Then setting connections to the reviewer and raid */
BEGIN TRANSACTION;
INSERT INTO RaidReviews(reviewid, review)
VALUES (Default, '!!review!!');
INSERT INTO Reviewed (reviewerid, raidid, pmessageid)
VALUES (!!reviewerid!!, !!raidid!!, currval('RaidReviews_reviewid_seq'));
END TRANSACTION;

/*Creating a new Message (user to user)
Then setting connections to the sender and receiver */
BEGIN TRANSACTION;
INSERT INTO Messages (messageid, message)
VALUES (Default, '!!message!!');
INSERT INTO Messaged (senderid, receiverid, pmessageid)
VALUES (!!senderid!!, !!receiverid!!, currval('Messages_messageid_seq'));
END TRANSACTION;

/* Creating a new Party message
Then setting connections to the messenger and party */
BEGIN TRANSACTION;
INSERT INTO PartyMessages (pmessageid, pmessage)
VALUES (Default, '!!pmessage!!');
INSERT INTO PartyMessaged (userid, partyid, pmessageid)
VALUES (!!userid!!, !!partyid!!, currval('PartyMessages_pmessageid_seq'));
END TRANSACTION;

/* Joins a user to a party */
INSERT INTO Member_of (userid, partyid)
VALUES (!!userid!!, !!partyid!!);

/* Sets a user as an admin for a Party */
INSERT INTO AdminsParty(userid, partyid)
VALUES (!!userid!!, !!partyid!!);

/* Sets a user as owning a game */
INSERT INTO Owns(userid, gameid)
VALUES (!!userid!!, !!gameid!!);

/* Denotes a user as being interested in a game,
Also allows them to specify their skill level in that game */
INSERT INTO Interested_in(userid, gameid, skill)
VALUES (!!userid!!, !!gameid!!, !!skill!!);

/* Sets a user as attending a Raid */
INSERT INTO Attending (userid, raidid)
VALUES (!!userid!!, !!raidid!!);

/* Sets a friend as being a friend with another user */
INSERT INTO Friends_with (userid, friendid)
VALUES (!!userid!!, !!friendid!!);
