
CREATE TABLE raueme(rid INT PRIMARY KEY, name VARCHAR(50));
CREATE TABLE zylinder(zid INT(10) PRIMARY KEY, bezeichnung varchar(50), bestand int, typ varchar(10), laengeInnen Int, laengeAussen int);
CREATE TABLE schluessel(sid INT(10) PRIMARY KEY, schluesselNr int, bestand int(10), faerbung INT);
CREATE TABLE person(pid INT PRIMARY KEY, first_name VARCHAR(250), last_name VARCHAR(250));

CREATE TABLE zylinderwechsel(rid int(10), zid int(10), einbau_datum DATE, ausbau_datum DATE,
FOREIGN KEY (rid)
REFERENCES raueme(rid)
ON DELETE CASCADE,

FOREIGN KEY (zid)
REFERENCES zylinder(zid)
ON DELETE CASCADE);

CREATE TABLE schluesselpasstzuzylinder(zid INT(10), sid INT(10),
FOREIGN KEY (zid)
REFERENCES zylinder(zid)
ON DELETE CASCADE,
FOREIGN KEY (sid)
REFERENCES schluessel(sid)
ON DELETE CASCADE
);

CREATE TABLE vergabevonschluesseln(sid int(10), pid int(10), ausgabe_datum DATE, rueckgabe_datum DATE,

FOREIGN KEY (pid)
REFERENCES person(pid)
ON DELETE CASCADE,
FOREIGN KEY (sid)
REFERENCES schluessel(sid)
ON DELETE CASCADE);


