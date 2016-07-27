/* Delete a user account */
DELETE FROM Users
WHERE userid = !!their userid!!;

/* Delete a party */
DELETE FROM Parties
WHERE partyid = !!their partyid!!;

/* Delete a raid */
DELETE FROM Raids
WHERE raidid = !!the raidid!!;

/* Delete a game */
DELETE FROM Games
WHERE gameid = !!the gameid!!;

/* Delete a game category */
DELETE FROM GameCategory
WHERE gamecategory = '!!the gamecategory!!';

/* Remove a game from a game category */
DELETE FROM OfCategory
WHERE gameid = !!the gameid!! AND gamecategory = '!!the gamecategory!!';

/* Delete a raid review
Note: Would need to make sure that the review belongs to whoever's trying to delete it
Note2: No need to remove from Reviewed relation, as it will automatically be deleted due to CASCADE setting */
DELETE FROM RaidReviews
WHERE reviewid = !!the reviewid!!;

/* Delete a private message
Note: as above, need to make sure the deleter owns the message
Note2: No need to remove from Messaged relation */
DELETE FROM Messages
WHERE messageid = !!the messageid!!;

/* Delete a party message
Note: as above, need to make sure the deleter owns the message
Note2: no need to remove from PartyMessaged relation */
DELETE FROM PartyMessages
WHERE pmessageid = !!the pmessageid!!;

/* Remove someone from a party */
DELETE FROM Member_of
WHERE userid = !!their userid!! AND partyid = !!the partyid!!;

/* Remove admin ability of a user from a party
Note: this does not remove the user from the party, just their denotation as an admin of said party */
DELETE FROM AdminsParty
WHERE userid = !!their userid!! AND partyid = !!the partyid!!;

/* Delete a game from a user's ownership (if they lost the game or gave it away, etc)*/
DELETE FROM Owns
WHERE userid = !!their userid!! AND gameid = !!the gameid!!;

/* Delete a game from a user's interested in list */
DELETE FROM Interested_in
WHERE userid = !!their userid!! AND gameid = !!the gameid!!;

/* Remove someone from attending a raid */
DELETE FROM Attending
WHERE userid = !!their userid!! AND raidid = !!the raidid!!;

/* Remove a friend relationship between two users
Note: As in the insertstatements, if we're doing dual-entries per
friendship, would have to remove both relations */
DELETE FROM Friends_with
WHERE userid = !!their userid!! AND friendid = !!the friendid!!;
