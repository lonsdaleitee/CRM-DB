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

CREATE TABLE "public".cwusummary (
summaryid uuid CONSTRAINT pk_cwusummary PRIMARY KEY,
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid),
cwuid uuid REFERENCES cwu (cwuid),
cwucategoryid uuid REFERENCES cwucategory (cwucategoryid),
cwucategoryname varchar(255),
summary varchar(255),
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255)
)

CREATE TABLE "public".securityrole (
securityroleid uuid CONSTRAINT pk_securityrole PRIMARY KEY,
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid),
businessunitid uuid REFERENCES businessunit (businessunitid),
"name" varchar(255),
jsonrole json,
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255),
status integer
)

CREATE TABLE "public".team (
teamid uuid CONSTRAINT pk_team PRIMARY KEY,
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid),
businessunitid uuid REFERENCES businessunit (businessunitid),
"name" varchar(255),
description varchar(255),
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255),
status integer
)

CREATE TABLE "public". workgroup (
workgroupid uuid CONSTRAINT pk_workgroup PRIMARY KEY,
businessunitid uuid REFERENCES businessunit (businessunitid),
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid),
ownerid uuid,
"name" varchar(255),
description varchar(255),
email varchar(255),
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255),
status integer
)

CREATE TABLE "public".ticket (
ticketid uuid CONSTRAINT pk_ticket PRIMARY KEY,
customerid uuid REFERENCES customer (customerid),
addressid uuid REFERENCES address (addressid),
productid uuid REFERENCES product (productid),
categoryid uuid REFERENCES category (categoryid),
ownerid uuid,
workgroupid uuid REFERENCES workgroup (workgroupid),
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid),
productname varchar(255),
productno varchar(255),
contactmethod varchar(255),
incomingphonenumber varchar(255),
sladays integer,
duedate timestamp,
priority varchar(255),
status integer,
summary varchar(255),
transactiontime timestamp,
transactionamount integer,
currency varchar(255),
channel varchar(255),
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255),
closedon timestamp,
closedby varchar(255),
reopenedon timestamp,
reopenedby varchar(255),
canceledon timestamp,
canceledby varchar(255),
ticketnumber varchar(255)
)

CREATE TABLE "public".systemuser (
systemuserid uuid CONSTRAINT pk_systemuser PRIMARY KEY,
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid),
businessunitid uuid REFERENCES businessunit (businessunitid),
securityroleid uuid REFERENCES securityrole (securityroleid),
username varchar(255),
"password" varchar(255),
firstname varchar(255),
lastname varchar(255),
fullname varchar(255),
phone varchar(255),
email varchar(255),
fax varchar(255),
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255),
lastlogin timestamp,
passwordchanged boolean,
status integer
)

CREATE TABLE "public".servicelevel (
servicelevelid uuid CONSTRAINT pk_servicelevel PRIMARY KEY,
productid uuid REFERENCES product (productid),
categoryid uuid REFERENCES category (categoryid),
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid),
workgroupid uuid REFERENCES workgroup (workgroupid),
"name" varchar(255),
sladays integer,
lastusedon timestamp,
lastusedby varchar(255),
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255),
status integer
)

CREATE TABLE "public".task (
taskid uuid CONSTRAINT pk_task PRIMARY KEY,
ticketid uuid REFERENCES ticket(ticketid),
ownerid uuid,
firstownerid uuid,
tasknumber varchar(255),
ticketnumber varchar(255),
priority varchar(255),
summary varchar(255),
"owner" varchar(255),
firstowner varchar(255),
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255),
openedon timestamp,
openedby varchar(255),
completedon timestamp,
completedby varchar(255),
canceledon timestamp,
canceledby varchar(255),
status integer
)

CREATE TABLE "public".notes (
notesid uuid CONSTRAINT pk_notes PRIMARY KEY,
ticketid uuid REFERENCES ticket(ticketid),
isdocument boolean,
notetext text,
files json,
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255)
)

CREATE TABLE "public".ticketauditlog (
ticketauditlogid uuid CONSTRAINT pk_ticketauditlog PRIMARY KEY,
ticketid uuid REFERENCES ticket(ticketid),
modifiedon timestamp,
modifiedby varchar(255),
"detail" json
)

CREATE TABLE "public".organizationclosure (
organizationclosureid uuid CONSTRAINT pk_organizationclosure PRIMARY KEY,
systemuserid uuid REFERENCES systemuser (systemuserid),
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid),
startdate timestamp,
enddate timestamp,
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255),
note varchar(255),
status integer
)

CREATE TABLE "public".teammember (
teammemberid uuid CONSTRAINT pk_teammember PRIMARY KEY,
teamid uuid REFERENCES team (teamid),
systemuserid uuid REFERENCES systemuser(systemuserid),
teammembername varchar(255),
rolename varchar(255),
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255)
)

CREATE TABLE "public".tasknotes (
tasknotesid uuid CONSTRAINT pk_tasknotes PRIMARY KEY,
ticketid uuid REFERENCES ticket(ticketid),
taskid uuid REFERENCES task (taskid),
tasknotetext text,
issubmitted boolean,
createdon timestamp,
createdby varchar(255),
modifiedon timestamp,
modifiedby varchar(255)
)

CREATE TABLE "public".applicationauditlog(
applicationauditlogid uuid CONSTRAINT pk_applicationauditlog PRIMARY KEY,
entityid uuid,
entityname varchar(255),
"detail" json
)

CREATE TABLE "public".rolemenu (
rolemenuid uuid CONSTRAINT pk_rolemenu PRIMARY KEY,
securityroleid uuid REFERENCES securityrole (securityroleid),
menuid uuid
)

CREATE TABLE "public".mastercity (
cityid uuid CONSTRAINT pk_mastercity PRIMARY KEY,
provinceid uuid,
"name" varchar(255)
)

CREATE TABLE "public".masterprovince (
provinceid uuid CONSTRAINT pk_masterprovince PRIMARY KEY,
"name" varchar(255)
)

CREATE TABLE "public".activityreport(
reportid uuid CONSTRAINT pk_activityreport PRIMARY KEY,
sistercompanyid uuid REFERENCES sistercompany (sistercompanyid),
performedby varchar(255),
datetime timestamp,
"action" varchar(255),
username varchar(255),
fullname varchar(255),
oldrole uuid,
newrole uuid,
oldstatus integer,
newstatus integer,
performedbyid uuid
)

CREATE TABLE "public".menu (
menuid uuid CONSTRAINT pk_menu PRIMARY KEY,
parentid uuid,
"label" varchar(255),
"name" varchar(255),
isaction boolean,
"sequence" integer
)

CREATE TABLE "public".masterdataauditlog (
masterdataauditlogid uuid CONSTRAINT pk_masterdataauditlog PRIMARY KEY,
entityid uuid,
entityname varchar(255),
"detail" json
)