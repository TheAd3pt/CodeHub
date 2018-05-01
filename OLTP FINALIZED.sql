


Alter table Building 
alter column BuildingId Varchar(100) not null

Alter table Building 
add primary key (BUildingID)


Alter table Trade 
alter column Trade Varchar(100) not null

alter table Trade 
add primary Key (Trade)

Alter table Schedule 
alter Column ID varchar(100) not null

Alter table Schedule 
add primary key (ID)

alter table Floor 
alter column FloorID varchar(100) not null

alter table Floor 
add Primary Key(FloorID)

select ID, BOQCategory, from RawConstructionData
group by ID, BOQCategory
having count(*)>1




--create table  ConstructionItems
select distinct [Construction Element Type], [Construction Element Family] into ConstructionItems from rawconstructiondata
ALTER TABLE Constructionitems alter column [Construction Element Type] varchar (100) not null  

alter table constructionitems
add primary key ([Construction Element Type])


ALTER TABLE rawconstructiondata
ADD FOREIGN KEY ([Construction Element Type]) REFERENCES [ConstructionItems]([Construction Element Type])

-- new table Constructionparts

select distinct [Construction Element Type], [ConstructionElementPart] into Constructionparts from rawconstructiondata
ALTER TABLE Constructionparts alter column [ConstructionElementPart] varchar (100) not null 

alter table Constructionparts
add primary key ([ConstructionElementPart])

ALTER TABLE rawconstructiondata
ADD FOREIGN KEY ([ConstructionElementPart]) REFERENCES Constructionparts([ConstructionElementPart])

ALTER TABLE rawconstructiondata
DROP COLUMN [Construction Element Family]

--New table [billsofquantities]


select distinct BOQ, BOQCategory, BOQDescription into [billsofquantities]  from rawconstructiondata
ALTER TABLE [billsofquantities] alter column BOQ varchar (100) not null 

alter table [billsofquantities]
add primary key (BOQ)

ALTER TABLE rawconstructiondata
ADD FOREIGN KEY (boq) REFERENCES [billsofquantities](BOQ)


ALTER TABLE rawconstructiondata
DROP COLUMN BOQDescription,BOQCategory


--Cut scope
-- creating new collumns

alter table Schedule 
    add
        BuildingId varchar (100)
        ,FloorId varchar(100)
        ,Trade varchar(100)
    
update Schedule set [BuildingId] = substring([scope] ,1,3)
update Schedule set [floorid] = substring([scope] ,5,2)
update Schedule set [Trade] = substring([scope] ,8,3)

alter table Rawconstructiondata 
    add
        BuildingId varchar (100)
        ,FloorId varchar(100)
        ,Trade varchar(100)
update Rawconstructiondata set [BuildingId] = substring([scope] ,1,3)
update Rawconstructiondata set [FloorId] = substring([scope] ,5,2)
update Rawconstructiondata set [Trade] = substring([scope] ,8,3)


--Connect ID Relationships
aLTER TABLE rawconstructiondata
ADD FOREIGN KEY (Trade) REFERENCES Trade(trade)

ALTER TABLE rawconstructiondata
ADD FOREIGN KEY (floorid) REFERENCES floor(floorid)




aLTER TABLE schedule
ADD FOREIGN KEY (Trade) REFERENCES Trade(trade)

aLTER TABLE schedule
ADD FOREIGN KEY (floorid) REFERENCES floor(floorid)

ALTER TABLE schedule
ADD FOREIGN KEY (buildingid) REFERENCES Building(buildingid)


-- UPDATe PRB to PRS
update dbo.RawConstructionData
set buildingid = 'PRS'
WHERE BUILDINGID = 'PRB'

-- ENACT CONNECTION
ALTER TABLE rawconstructiondata
ADD FOREIGN KEY (buildingid) REFERENCES Building(buildingid)


--DROP SCOPE


ALTER TABLE [rawconstructiondata]
DROP COLUMN scope

ALTER TABLE [schedule]
DROP COLUMN scope



--add primary key
ALTER TABLE [rawconstructiondata]
ADD [RawID] int identity (1,1);

aLTER TABLE rawconstructiondata
ADD primary KEY (rawid) 