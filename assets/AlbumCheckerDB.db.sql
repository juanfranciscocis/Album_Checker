BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Teams" (
	"id"	INTEGER,
	"team_name"	TEXT,
	"team_logo"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "Players" (
	"id"	INTEGER,
	"player_position"	INTEGER,
	"player_name"	TEXT,
	"player_checked"	BOOLEAN,
	"team_id"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("team_id") REFERENCES "Teams"("id")
);
INSERT INTO "Teams" VALUES (1,'QATAR','https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Flag_of_Qatar_%283-2%29.svg/1024px-Flag_of_Qatar_%283-2%29.svg.png');
INSERT INTO "Teams" VALUES (2,'ECUADOR','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Flag_of_Ecuador.svg/2560px-Flag_of_Ecuador.svg.png');
INSERT INTO "Players" VALUES (1,1,'SHIELD QATAR','true',1);
INSERT INTO "Players" VALUES (2,2,' ','true',1);
INSERT INTO "Players" VALUES (3,1,'SHIELD ECUADOR','false',2);
INSERT INTO "Players" VALUES (4,2,' ','false',2);
COMMIT;
