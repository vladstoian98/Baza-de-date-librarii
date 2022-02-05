
drop table scrie_p;
drop table vinde_p;
drop table carte_p;
drop table gen_p;
drop table editura_p;
drop table autor_p;
drop table angajat_p;
drop table librarie_p;
drop table locatie_p;


create table locatie_p (
    locatie_id int, 
    oras varchar(20) constraint oras_not_null_p check(oras is not null),
    judet varchar(20) constraint judet_not_null_p check(judet is not null),
    nume_strada varchar(20) constraint nume_strada_not_null_p check(nume_strada is not null),
    nr_strada int constraint nr_strada_not_null_p check(nr_strada is not null),
    constraint locatie_id_pk_p primary key(locatie_id)
);

insert into locatie_p
values(1001, 'Constanta', 'Constanta', 'Strada Eliberarii', 12);
insert into locatie_p
values(1002, 'Sector 3 ', 'Bucuresti', 'Nicolae Grigorescu', 21);
insert into locatie_p
values(1003, 'Sector 4 ', 'Bucuresti', 'Panselelor', 23);
insert into locatie_p
values(1004, 'Constanta', 'Constanta', 'Caragiale', 12);
insert into locatie_p
values(1005, 'Timisora', 'Timis', '1 Decembrie 1918', 11);

create table librarie_p (
    librarie_id int,
    locatie_id int,
    nume varchar(20) constraint nume_librarie_not_null_p check(nume is not null),
    nr_telefon int,
    email varchar(20),
    constraint locatie_id_fk_in_librarie_p foreign key(locatie_id) 
        references locatie_p(locatie_id) on delete cascade,
    constraint locatie_id_unica_p unique(locatie_id),
    constraint locatie_id_not_null_p check(locatie_id is not null),
    constraint nr_tel_lib_not_null_p check(nr_telefon is not null),
    constraint email_lib_not_null_p check(email is not null),
    constraint librarie_id_pk_p primary key(librarie_id),
    constraint nr_telefon_librarie_p unique(nr_telefon),
    constraint email_librarie_p unique(email)
);

insert into librarie_p
values(1001, 1001, 'Carturesti', 0700000001, 'librarie1@gmail.com');
insert into librarie_p
values(1002, 1002, 'Alexandria', 0700000002, 'librarie2@gmail.com');
insert into librarie_p
values(1003, 1003, 'Libraria Nationala', 0700000003, 'librarie3@gmail.com');
insert into librarie_p
values(1004, 1004, 'Libraria Constantei', 0700000004, 'librarie4@gmail.com');

create table angajat_p (
	angajat_id int,
	librarie_id int,
	nume varchar(20) constraint nume_ang_not_null_p check(nume is not null),
	prenume varchar(20) constraint prenume_ang_not_null_p check(prenume is not null),
	data_nasterii date constraint data_nasterii_ang_not_null_p check(data_nasterii is not null),
	nr_telefon int constraint nr_tel_ang_not_null_p check(nr_telefon is not null),
	email varchar(20) constraint email_ang_not_null_p check(email is not null),
	salariu int constraint salariu_ang_not_null_p check(salariu is not null),
	constraint nr_telefon_ang_unique_p unique(nr_telefon),
    constraint email_ang_unique_p unique(email),
	constraint librarie_id_angajat_fk_p foreign key(librarie_id)
		references librarie_p(librarie_id) on delete set null,
    constraint angajat_id_pk_p primary key(angajat_id)   
);

insert into angajat_p
values(1001, NULL, 'Popescu', 'Alex', str_to_date('01-02-1997', '%d-%m-%Y'), 0700000005, 'angajat5@gmail.com', 3000);
insert into angajat_p
values(1002, 1001, 'Popescu', 'Andrei', str_to_date('03-04-1998', '%d-%m-%Y'), 0700000006, 'angajat6@gmail.com', 3500);
insert into angajat_p
values(1003, 1001, 'Stoian', 'Mihail', str_to_date('06-01-1995', '%d-%m-%Y'), 0700000007, 'angajat7@gmail.com', 5000);
insert into angajat_p
values(1004, 1002, 'Ion', 'Alexandra', str_to_date('01-01-1992', '%d-%m-%Y'), 0700000008, 'angajat8@gmail.com', 4500);
insert into angajat_p
values(1005, 1003, 'Iancu', 'Gabriel', str_to_date('06-09-1991', '%d-%m-%Y'), 0700000009, 'angajat9@gmail.com', 5000);
insert into angajat_p
values(1006, 1004, 'Geogrica', 'Maria', str_to_date('10-12-1989', '%d-%m-%Y'), 0700000010, 'angajat10@gmail.com', 3500);
 

create table gen_p (
	gen_id int,
	nume_gen varchar(20) constraint nume_gen_not_null_p check(nume_gen is not null),
	constraint nume_gen_unique_p unique(nume_gen),
	constraint gen_id_gen_pk_p primary key(gen_id)
);

insert into gen_p 
values(1001, 'Horror');
insert into gen_p
values(1002, 'Sci-Fi');
insert into gen_p
values(1003, 'Non-fiction');
insert into gen_p
values(1004, 'Fantasy');
insert into gen_p
values(1005, 'Fiction');

create table editura_p (
	editura_id int,
	nume_editura varchar(20) constraint nume_editura_not_null_p check(nume_editura is not null),
	tara_origine varchar(20),
	nr_telefon int constraint nr_telefon_editura_not_null_p check(nr_telefon is not null),
	link_site varchar(20) constraint link_site_editura_not_null_p check(link_site is not null),
	constraint nr_telefon_editura_unique_p unique(nr_telefon),
	constraint link_site_editura_unique_p unique(link_site),
	constraint editura_id_editura_pk_p primary key(editura_id)
);

insert into editura_p
values(1001, 'Litera', 'Romania', 0700000011,  'litera.com');
insert into editura_p
values(1002, 'Orizont', NULL, 0700000012,  'orizont.com');
insert into editura_p
values(1003, 'Fun Studios', 'America', 0700000013,  'funcstudios.com');
insert into editura_p
values(1004, 'Smart Edit', 'Germania', 0700000014,  'smartedit.com');
insert into editura_p
values(1005, 'Good Reads', NULL, 0700000015,  'goodreads.com');

create table autor_p (
	autor_id int,
	nume_familie varchar(20),
	prenume varchar(20),
	data_nastere date,
    constraint autor_id_autor_pk_p primary key(autor_id)
);

insert into autor_p
values(1001, 'Stoian', 'Andrei', str_to_date('14-11-2001', '%d-%m-%Y')); 
insert into autor_p
values(1002, 'Alexander', NULL, NULL); 
insert into autor_p
values(1003, 'Popa', 'Eduard', str_to_date('11-08-1987', '%d-%m-%Y'));
insert into autor_p
values(1004, 'Vasile', 'Anca', NULL);
insert into autor_p
values(1005, 'Stone', 'Emma', str_to_date('09-11-1998', '%d-%m-%Y')); 

create table carte_p (
	carte_id int,
	gen_id int constraint gen_id_carte_not_null_p check(gen_id is not null),
	editura_id int constraint editura_id_carte_not_null_p check(editura_id is not null),
	titlu varchar(50) constraint titlu_carte_not_null_p check(titlu is not null),
	numar_pagini int constraint numar_pagini_carte_not_null_p check(numar_pagini is not null),
	tip_coperta varchar(20) constraint tip_coperta_carte_not_null_p check(tip_coperta is not null),
	limba_text varchar(20) constraint limbe_text_carte_not_null_p check(limba_text is not null),
	an_publicare int,
	constraint gen_id_carte_fk_p foreign key(gen_id)
		references gen_p(gen_id) on delete cascade,
	constraint editura_id_carte_fk_p foreign key(editura_id)
		references editura_p(editura_id) on delete cascade,
    constraint carte_id_carte_pk_p primary key(carte_id)    
);

insert into carte_p
values(1001, 1001, 1001, 'It', 1200, 'Hard cover', 'Engleza', 2019);
insert into carte_P
values(1002, 1001, 1001, 'Pet Sematary', 800, 'Paperback', 'Romana', 2020);
insert into carte_p
values(1003, 1002, 1002, 'Hyperion', 600, 'Paperback', 'Engleza', 2019);
insert into carte_p
values(1004, 1004, 1004, 'Circe', 400, 'Hard cover', 'Germana', 2017); 
insert into carte_p
values(1005, 1005, 1005, 'A Little Life', 800, 'Paper back', 'Engleza', 2017);
insert into carte_p
values(1006, 1001, 1001, 'Misery', 700, 'Paper back', 'Romana', 2018);

create table vinde_p (
    librarie_id int,
    carte_id int,
    data_disponibilitate date,
    constraint pk_vinde_p primary key(librarie_id, carte_id),
    constraint librarie_id_vinde_fk_p foreign key(librarie_id)
        references librarie_p(librarie_id) on delete cascade,
    constraint carte_id_vinde_fk_p foreign key(carte_id)
        references carte_p(carte_id) on delete cascade
);

insert into vinde_p
values(1001, 1001, str_to_date('14.01.2022', '%d.%m.%Y'));
insert into vinde_p
values(1001, 1002, str_to_date('13.01.2022', '%d.%m.%Y'));
insert into vinde_p
values(1002, 1003, null);
insert into vinde_p
values(1002, 1001, null);
insert into vinde_p
values(1002, 1002, str_to_date('12.01.2021', '%d.%m.%Y'));
insert into vinde_p
values(1003, 1003, str_to_date('01.09.2021', '%d.%m.%Y'));
insert into vinde_p
values(1004, 1004, str_to_date('01.06.2020', '%d.%m.%Y'));

create table scrie_p (
    autor_id int,
    carte_id int,
    constraint pk_scrie_p primary key(autor_id, carte_id),
    constraint autor_id_scrie_fk_p foreign key(autor_id)
        references autor_p(autor_id) on delete cascade,
    constraint carte_id_scrie_fk_p foreign key(carte_id)
        references carte_p(carte_id) on delete cascade
);

insert into scrie_p
values(1001, 1001);

insert into scrie_p
values(1001, 1002);

insert into scrie_p
values(1002, 1001);

insert into scrie_p
values(1002, 1002);

insert into scrie_p
values(1003, 1003);

insert into scrie_p
values(1003, 1001);

insert into scrie_p
values(1004, 1004);

insert into scrie_p
values(1005, 1005);



