CREATE TABLE Floor(
	[FloorID]varchar(100),
	[FloorDescription] varchar(100)
	PRIMARY KEY (FloorID)
);

CREATE TABLE Building(
	[BuildingID] varchar(100),
	[BuildingDescreption] varchar(100)
	PRIMARY KEY (BuildingID)
);

CREATE TABLE Trade(
	[Trade] varchar(100),
	[TradeDescription] varchar(100)
	PRIMARY KEY (Trade)
);

CREATE TABLE Activity(
	[Act_Code] varchar(100),
	[Activity_Description] varchar(100),
	[Scope_ConstructionElementType_BOQ] varchar (100),
	[START] DATE ,
	[FINISH] DATE,
	[delay] varchar(100),
	[cost overrrun] varchar (100),
	PRIMARY KEY ([Scope_ConstructionElementType_BOQ])
);


CREATE TABLE BOQ(
	[BOQCategory] varchar(100),
	[BOQ] varchar(100),
	[BOQDesciption] varchar (100),
	PRIMARY KEY (BOQ)
);

CREATE TABLE ConstructionElement(
	[ConstructionElementType] varchar(100),
	[ConstructionELementFamily] varchar(100),
	[ConstructionElementPart] varchar(100),
	[ID] varchar(100),
	PRIMARY KEY (ID)
);

CREATE TABLE FACT(
	[FACTID] INT identity (1,1) not null,
	[BOQ] varchar(100),
	[FLOORID] varchar (100),
	[BUILDINGID] VARCHAR(100) ,
	[Trade]  VARCHAR (100),
	[Quantity] float,
	[unit] varchar (100),
	[unitprice] float,
	[totalcost] float,
	[length] float,
	[thickness] float,
	[height] float,
	[scope_constructionelementtype_boq] varchar (100),
	[id] varchar(100)
	PRIMARY KEY ([FACTID])
);

--relationships 
alter table [FACT]
ADD FOREIGN KEY (BOQ) REFERENCES BOQ(BOQ)

alter table [FACT]
ADD FOREIGN KEY (Floorid) REFERENCES floor(floorid)

alter table [FACT]
ADD FOREIGN KEY (buildingid) REFERENCES Building(buildingid)

alter table [FACT]
ADD FOREIGN KEY (trade) REFERENCES trade(trade)

alter table [FACT]
ADD FOREIGN KEY (Scope_ConstructionElementType_BOQ) REFERENCES activity(Scope_ConstructionElementType_BOQ)

alter table [FACT]
ADD FOREIGN KEY (id) REFERENCES ConstructionElement(id)


