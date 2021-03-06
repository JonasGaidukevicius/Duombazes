;             
CREATE USER IF NOT EXISTS SA SALT '464318c294dd208c' HASH '0142e07dae54266fb1d924a7255060f48fcd7687777b3e8ee151259a17a2f19b' ADMIN;           
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_BAE4D0DF_7D25_445E_B8DE_4AB62B9573F8 START WITH 6 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_89D78E6E_3610_4CFC_BB5B_6851C7C68A85 START WITH 7 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_00CFC560_1258_4164_AC58_03B647B64C36 START WITH 6 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_9020B840_0EA2_4D8F_8925_5A325BA74EC1 START WITH 13 BELONGS_TO_TABLE;   
CREATE CACHED TABLE PUBLIC.PACIENTAI(
    ID INT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_00CFC560_1258_4164_AC58_03B647B64C36) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_00CFC560_1258_4164_AC58_03B647B64C36,
    ASMENS_KODAS CHAR(11),
    VARDAS VARCHAR(20),
    PAVARDE VARCHAR(30),
    TEL_NR BIGINT,
    EL_PASTAS VARCHAR(30)
);       
-- 5 +/- SELECT COUNT(*) FROM PUBLIC.PACIENTAI;               
INSERT INTO PUBLIC.PACIENTAI(ID, ASMENS_KODAS, VARDAS, PAVARDE, TEL_NR, EL_PASTAS) VALUES
(1, '31234567891', 'Vaidotas', STRINGDECODE('Nie\u017eulis'), 123456, 'man@niezti.com'),
(2, '42345678912', 'Ilona', STRINGDECODE('Per\u0161tien\u0117'), 234567, 'man@persti.com'),
(3, '33456789123', 'Julius', STRINGDECODE('Lau\u017euonis'), 345678, 'man@lauzo.com'),
(4, '44567891234', 'Alma', STRINGDECODE('Liudien\u0117'), 456789, 'man@liudna.com'),
(5, '35678912345', 'Ignas', STRINGDECODE('Nie\u017eulis'), 123456, 'manirgi@niezti.com');     
CREATE CACHED TABLE PUBLIC.GYDYTOJAI(
    ID INT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_BAE4D0DF_7D25_445E_B8DE_4AB62B9573F8) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_BAE4D0DF_7D25_445E_B8DE_4AB62B9573F8,
    VARDAS VARCHAR(20),
    PAVARDE VARCHAR(30),
    KVALIFIKACIJA VARCHAR(30)
);   
-- 5 +/- SELECT COUNT(*) FROM PUBLIC.GYDYTOJAI;               
INSERT INTO PUBLIC.GYDYTOJAI(ID, VARDAS, PAVARDE, KVALIFIKACIJA) VALUES
(1, 'Jonas', 'Jonaitis', 'Oftalmologas'),
(2, 'Petras', 'Petraitis', 'Urologas'),
(3, 'Vardenis', 'Pavardenis', 'Visakologas'),
(4, 'Ona', STRINGDECODE('Onait\u0117'), STRINGDECODE('\u0160eimos gydytojas')),
(5, STRINGDECODE('R\u016bta'), STRINGDECODE('R\u016btait\u0117'), 'Pediatras');  
CREATE CACHED TABLE PUBLIC.PASLAUGOS(
    ID INT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_89D78E6E_3610_4CFC_BB5B_6851C7C68A85) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_89D78E6E_3610_4CFC_BB5B_6851C7C68A85,
    PAVADINIMAS VARCHAR(40),
    KAINA DECIMAL(6)
); 
-- 6 +/- SELECT COUNT(*) FROM PUBLIC.PASLAUGOS;               
INSERT INTO PUBLIC.PASLAUGOS(ID, PAVADINIMAS, KAINA) VALUES
(1, 'Regos patikra', 1),
(2, 'Kraujo patikra', 2),
(3, STRINGDECODE('Refleks\u0173 patikra'), 3),
(4, STRINGDECODE('Gerkl\u0117s patikra'), 4),
(5, STRINGDECODE('Gird\u0117jimo patikra'), 5),
(6, STRINGDECODE('Hormon\u0173 patikra'), 6);               
CREATE CACHED TABLE PUBLIC.VIZITAI(
    ID INT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_9020B840_0EA2_4D8F_8925_5A325BA74EC1) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_9020B840_0EA2_4D8F_8925_5A325BA74EC1,
    GYDYTOJO_ID INT,
    PACIENTO_ID INT,
    PASLAUGOS_ID INT,
    DATA DATE,
    KAINA DECIMAL(6)
);              
-- 12 +/- SELECT COUNT(*) FROM PUBLIC.VIZITAI;
INSERT INTO PUBLIC.VIZITAI(ID, GYDYTOJO_ID, PACIENTO_ID, PASLAUGOS_ID, DATA, KAINA) VALUES
(1, 1, 1, 3, DATE '2018-06-15', 3),
(2, 1, 3, 4, DATE '2018-06-17', 4),
(3, 4, 2, 1, DATE '2018-06-25', 1),
(4, 5, 3, 2, DATE '2018-07-03', 1),
(5, 2, 1, 2, DATE '2018-07-20', 2),
(6, 1, 5, 3, DATE '2018-07-29', 3),
(7, 3, 2, 6, DATE '2018-08-05', 6),
(8, 4, 1, 5, DATE '2018-08-15', 5),
(9, 4, 2, 4, DATE '2018-08-25', 3),
(10, 5, 3, 3, DATE '2018-09-18', 2),
(11, 1, 2, 6, DATE '2018-10-02', 6),
(12, 1, 1, 2, DATE '2018-10-20', 2);     
ALTER TABLE PUBLIC.PACIENTAI ADD CONSTRAINT PUBLIC.CONSTRAINT_E UNIQUE(ASMENS_KODAS);         
