select * from doktor2.korisnik;
select * from doktor2.uloga;
select * from doktor2.doktor;
select * from doktor2.lek;
select * from doktor2.lekdijagnoza;
select * from doktor2.dijagnoza;
select * from doktor2.pacijentdijagnoza;
select * from doktor2.pacijent;
select * from doktor2.pregled;
select * from doktor2.specijalizacija;

select * from doktor2.doktor as d inner join doktor2.specijalizacija as s where d.idSpecijalizacija=s.idSpecijalizacija and d.ime not like 'admin%';
select * from doktor2.doktor as d inner join doktor2.specijalizacija as s where d.idSpecijalizacija=s.idSpecijalizacija;
SELECT * FROM doktor2.pacijent as p INNER JOIN doktor2.korisnik as k WHERE k.username LIKE 'sinan%' and p.idPacijent=k.idPacijent;
SELECT * FROM doktor2.doktor as d INNER JOIN doktor2.specijalizacija as s where d.idSpecijalizacija=s.idSpecijalizacija;