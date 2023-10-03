-- drop database qLyPKDongY;
create database qLyPKDongY;
use qLyPKDongY;
create table tblAdmin(
	id int primary key AUTO_INCREMENT,
	username nvarchar(30),
    password nvarchar(30)
);
create table tblClinic(
	idClinic int primary key AUTO_INCREMENT,
	name nvarchar (200) not null,
	descript nvarchar(10000),
	address nvarchar(200),
    representatives nvarchar(200),
	phone varchar(10),
	status boolean,
	createDate datetime,
	updateDate datetime
);
create table tblDoctor(
	idDoctor int primary key AUTO_INCREMENT,
    nameDoctor nvarchar(200),
    gender nvarchar(10),
    address nvarchar(200),
    descriptDoctor nvarchar(10000),
    titleDoctor nvarchar(200),
    academicRank nvarchar(200),
    degree nvarchar(200),
    phone varchar(10),
    avatar_path nvarchar(200),
    username nvarchar(30),
    password nvarchar(30),
    status boolean,
    createDate datetime,
	updateDate datetime    
);
create table tblProvider(
	idProvider int primary key AUTO_INCREMENT,
    nameProvider nvarchar(200),
    address nvarchar(200),
    phone varchar(10),
    representatives nvarchar(200),
    descript nvarchar(10000),
    status boolean,
    createDate datetime,
	updateDate datetime    	
);
create table tblItem(
	idItem int primary key AUTO_INCREMENT,
    nameItem nvarchar(200),
    descript nvarchar(10000),
    type varchar(10),
    price float,
    status boolean,
    createDate datetime,
	updateDate datetime  
);
create table tblItemImport(
	id int primary key AUTO_INCREMENT,
    idProvider int,
    nameItem nvarchar(200),
    idItem nvarchar(10),
    descript nvarchar(10000),
    type varchar(10),
    price float,
    number int,
    totalPrice float,
    status boolean,
    importDate datetime,
	updateDate datetime  ,
    foreign key (idProvider) references tblProvider(idProvider)
);
create table tblPatient(
	idPatient int primary key AUTO_INCREMENT,
    name nvarchar(200),
    gender nvarchar(10),
    DOB datetime,
    job nvarchar(200),
    address nvarchar(200),
    country nvarchar(200),
    phone varchar(10),
    identification_code varchar(20),
    status boolean,
    createDate datetime,
	updateDate datetime     
);
create table tblMedicalExaminationAndTreatment(
	id int primary key AUTO_INCREMENT,
    idPatient int,
    idDoctor int,
    reasonToVisit nvarchar(10000),
	receptionTime datetime,
    foreign key (idPatient) references tblPatient(idPatient),
    foreign key (idDoctor) references tblDoctor(idDoctor)
);
create table tblMedicalExamination(
	id int primary key AUTO_INCREMENT,
    idMEAT int,
    height int,
    weight int,
    heartRate int,
    bloodPressure int,
    otherMedicalInfor nvarchar(10000),
    examinationTime datetime,
    foreign key (idMEAT) references tblMedicalExaminationAndTreatment(id)
);
create table tblDiagnosis(
	id int primary key AUTO_INCREMENT,
    idMEAT int,
    medicalInformation nvarchar(10000),
	diagnosisTime datetime,
    foreign key (idMEAT) references tblMedicalExaminationAndTreatment(id)
);
create table tblPrecription(
	id int primary key AUTO_INCREMENT,
    idMEAT int,
    idItem int,
    number int,
    totalPrice float,
    createTime datetime,
    foreign key (idItem) references tblItem(idItem),
    foreign key (idMEAT) references tblMedicalExaminationAndTreatment(id)
);
create table tblAdvice(
	id int primary key AUTO_INCREMENT,
    idPrecription int,
    name nvarchar(200),
    descript nvarchar(10000),
    foreign key (idPrecription) references tblPrecription(id)
);