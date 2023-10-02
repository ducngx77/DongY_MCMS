-- drop database qLyPKDongY;
create database qLyPKDongY;
use qLyPKDongY;
create table tblClinic(
	idClinic int primary key AUTO_INCREMENT,
	name nvarchar (100) not null,
	descript nvarchar(10000),
	address nvarchar(200),
    representatives nvarchar(50),
	phone varchar(10),
	status boolean,
	createDate datetime,
	updateDate datetime
);
create table tblDoctor(
	idDoctor int primary key AUTO_INCREMENT,
    nameDoctor nvarchar(30),
    sex nvarchar(10),
    codeDoctorGen nvarchar(10),
    address nvarchar(200),
    descriptDoctor nvarchar(200),
    titleDoctor nvarchar(30),
    academicRank nvarchar(30),
    degree nvarchar(30),
    phone varchar(10),
    avatar_path nvarchar(30),
    username nvarchar(30),
    password nvarchar(30),
    status boolean,
    createDate datetime,
	updateDate datetime    
);
create table tblProvider(
	idProvider int primary key AUTO_INCREMENT,
    nameProvider nvarchar(30),
    codeProvider nvarchar(10),
    address nvarchar(200),
    phone varchar(10),
    representatives nvarchar(50),
    descript nvarchar(10000),
    status boolean,
    createDate datetime,
	updateDate datetime    	
);
create table tblItem(
	idItem int primary key AUTO_INCREMENT,
    nameItem nvarchar(30),
    codeItemGen nvarchar(10),
    descript nvarchar(10000),
    type varchar(10),
    code varchar(10),
    price float,
    status boolean,
    createDate datetime,
	updateDate datetime  
);
create table tblItemImport(
	id int primary key AUTO_INCREMENT,
    idProvider int,
    nameItem nvarchar(30),
    code nvarchar(10),
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
	id int primary key AUTO_INCREMENT,
    name nvarchar(30),
    sex nvarchar(10),
    DOB datetime,
    job nvarchar(30),
    address nvarchar(30),
    country nvarchar(30),
    phone varchar(10),
    identification_code varchar(20),
    status boolean,
    codePatientGen varchar(10),
    createDate datetime,
	updateDate datetime     
);
create table tblMedicalExaminationAndTreatment(
	id int primary key AUTO_INCREMENT,
    idPatient int,
    idDoctor int,
    reasonToVisit nvarchar(200),
	receptionTime datetime,
    foreign key (idPatient) references tblPatient(id),
    foreign key (idDoctor) references tblDoctor(idDoctor)
);
create table tblMedicalExamination(
	id int primary key AUTO_INCREMENT,
    idMEAT int,
    height int,
    weight int,
    heartRate int,
    bloodPressure int,
    otherMedicalInfor nvarchar(2000),
    examinationTime datetime,
    foreign key (idMEAT) references tblMedicalExaminationAndTreatment(id)
);
create table tblDiagnosis(
	id int primary key AUTO_INCREMENT,
    idMEAT int,
    medicalInformation nvarchar(1000),
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
    descript nvarchar(2000),
    foreign key (idPrecription) references tblPrecription(id)
);