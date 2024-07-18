CREATE TABLE "public".sistercompany(
sistercompanyid uuid constraint pk_sistercompany primary key,
parentid uuid,
"name" varchar(255),
sistercompanyinitial varchar(255),
description varchar(255),
createdon date,
createdby varchar(255),
modifiedon date,
modifiedby varchar(255),
status integer
)

CREATE TABLE "public".ticketnumbercomp (
id varchar(255),
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid)
)

CREATE TABLE "public".tasknumbercomp (
id varchar(255),
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid)
)

CREATE TABLE "public".message (
messageid uuid CONSTRAINT pk_message PRIMARY KEY,
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid),
senderid uuid,
recipientid uuid,
subject varchar(255),
"message" varchar(255),
recipientname varchar(255),
createdon date,
createdby varchar(255),
isopened boolean,
isopenedon date,
"level" char(1),
status integer
)

CREATE TABLE "public".cwucategory (
cwucategoryid uuid CONSTRAINT pk_cwucategory PRIMARY KEY,
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid),
description varchar(255),
createdon date,
createdby varchar(255),
modifiedon date,
modifiedby varchar(255),
status integer
)

CREATE TABLE "public".customer (
customerid uuid CONSTRAINT pk_customer PRIMARY KEY,
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid),
salutation varchar(255),
firstname varchar(255),
lastname varchar(255),
fullname varchar(255),
aliasname varchar(255),
birthplace varchar(255),
birthdate date,
gender varchar(255),
mothermaidenname varchar(255),
email varchar(255),
idnumber varchar(255),
phonenumber varchar(255),
createdon date,
createdby varchar(255),
modifiedon date,
modifiedby varchar(255),
status integer
)

CREATE TABLE "public".cwu (
cwuid uuid CONSTRAINT pk_cwu PRIMARY KEY,
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid),
customerid uuid REFERENCES customer(customerid),
callstarttime timestamp,
callendtime timestamp,
customername varchar(255),
agent varchar(255),
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255)
)

CREATE TABLE "public".cwucategory (
cwucategoryid uuid CONSTRAINT pk_cwucategory PRIMARY KEY,
sistercompanyid uuid REFERENCES sistercompany(sistercompanyid),
description varchar(255),
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255),
status integer
)

CREATE TABLE "public".tasknumbercomp (
id varchar(255) CONSTRAINT pk_tasknumbercomp PRIMARY KEY,
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid)
)

CREATE TABLE "public".branch (
branchid uuid CONSTRAINT pk_branch PRIMARY KEY,
sistercompanyid uuid REFERENCES sistercompany(sistercompanyid),
branchname varchar(255),
initial varchar(255),
city varchar(255),
address varchar(255),
province varchar(255),
region varchar(255),
sljj varchar(255),
telephoneno1 varchar(255),
telephoneno2 varchar(255),
fax varchar(255),
vsat varchar(255),
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255),
notes varchar(255),
status integer
)

CREATE TABLE "public".mapping (
mappingid uuid CONSTRAINT pk_mapping PRIMARY KEY,
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid),
entity varchar(255),
code integer,
"label" varchar(255),
description varchar(255),
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255),
status integer,
lastusedon timestamp,
lastusedby varchar(255)
)

CREATE TABLE "public".businessunit (
businessunitid uuid CONSTRAINT pk_businessunit PRIMARY KEY,
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid),
parentid uuid,
"name" varchar(255),
description varchar(255),
phone varchar(255),
email varchar(255),
fax varchar(255),
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255),
status integer
)

CREATE TABLE "public".product (
productid uuid CONSTRAINT pk_product PRIMARY KEY,
parentid uuid,
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid),
"name" varchar(255),
description varchar(255),
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255),
status integer
)

CREATE TABLE "public".category (
categoryid uuid CONSTRAINT pk_category PRIMARY KEY,
parentid uuid,
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid),
"name" varchar(255),
description varchar(255),
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255),
status integer
)

CREATE TABLE "public".address (
addressid uuid CONSTRAINT pk_address PRIMARY KEY,
customerid uuid REFERENCES customer (customerid),
addresstype varchar(255),
addressline1 varchar(255),
addressline2 varchar(255),
addressline3 varchar(255),
city varchar(255),
province varchar(255),
postalcode varchar(255),
country varchar(255),
telephoneno varchar(255),
businessno varchar(255),
handphoneno varchar(255),
faxno varchar(255),
email varchar(255),
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255),
status integer
)