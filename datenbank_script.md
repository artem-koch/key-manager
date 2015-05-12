
CREATE TABLE raueme(rid INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT, name VARCHAR(50)) ENGINE=InnoDB;

CREATE TABLE zylinder(
    zid INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT, bezeichnung varchar(50), bestand int(10), typ varchar(10), laengeInnen Int(10), laengeAussen int(10)) ENGINE=InnoDB;
CREATE TABLE schluessel(sid INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT, schluesselNr int(10), bestand int(10), faerbung INT(10)) ENGINE=InnoDB;
CREATE TABLE person(pid INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT, first_name VARCHAR(250), last_name VARCHAR(250)) ENGINE=InnoDB;

CREATE TABLE zylinderwechsel(
zwid INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
rid int(10), zid int(10), einbau_datum DATE, ausbau_datum DATE,
FOREIGN KEY (rid)
REFERENCES raueme(rid)
ON DELETE CASCADE,

FOREIGN KEY (zid)
REFERENCES zylinder(zid)
ON DELETE CASCADE) ENGINE=InnoDB;

CREATE TABLE schluesselpasstzuzylinder(szid INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT, zid INT(10), sid INT(10),
FOREIGN KEY (zid)
REFERENCES zylinder(zid)
ON DELETE CASCADE,
FOREIGN KEY (sid)
REFERENCES schluessel(sid)
ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE vergabevonschluesseln(vid int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT, sid int(10), pid int(10), ausgabe_datum DATE, rueckgabe_datum DATE,

FOREIGN KEY (pid)
REFERENCES person(pid)
ON DELETE CASCADE,
FOREIGN KEY (sid)
REFERENCES schluessel(sid)
ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE user_account(
    uid int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT, pid int(10), username varchar(250),pw varchar(250), privilege int(10),
    FOREIGN KEY (pid)
    REFERENCES person(pid)
    ON DELETE CASCADE
) ENGINE=InnoDB;


