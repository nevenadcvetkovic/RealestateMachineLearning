/*izlistati koliki je broj nekretnina za prodaju, a koliki je broj koji se iznajmljuju*/
(select count(*) as 'broj nekretnina', OFFER_TYPE
from nekretnine.real_estate_t
where OFFER_TYPE='P')
union
(select count(*) as 'broj nekretnina', OFFER_TYPE
from nekretnine.real_estate_t
where OFFER_TYPE='I');

/*izlistati koliko nekretnina se prodaje u svakom od gradova (izlistati sve gradove,
obuhvatiti i kuće i stanove);
*/
select city, count(*) as 'broj nekretnina'
from nekretnine.real_estate_t
where OFFER_TYPE='P'
group by city;

/*izlistati koliko je uknjiženih, a koliko neuknjiženih kuća, a koliko stanova;*/
(select count(*) as 'broj nekretnina', IS_REGISTERED, REAL_ESTATE_TYPE
from nekretnine.real_estate_t
where IS_REGISTERED = 1 and  REAL_ESTATE_TYPE='K')
union
(select count(*) as 'broj nekretnina', 0, REAL_ESTATE_TYPE
from nekretnine.real_estate_t
where IS_REGISTERED is null and  REAL_ESTATE_TYPE='K')
union
(select count(*) as 'broj nekretnina', IS_REGISTERED, REAL_ESTATE_TYPE
from nekretnine.real_estate_t
where IS_REGISTERED = 1 and  REAL_ESTATE_TYPE='S')
union
(select count(*) as 'broj nekretnina', 0, REAL_ESTATE_TYPE
from nekretnine.real_estate_t
where IS_REGISTERED is null and  REAL_ESTATE_TYPE='S');

/*prikazati rang listu prvih 30 najskupljih kuća koje se prodaju, i 30 najskupljih stanova
koji se prodaju u Srbiji;
*/
select *
from nekretnine.real_estate_t
where OFFER_TYPE='P' and REAL_ESTATE_TYPE='S'
order by PRICE desc
limit 30;
select *
from nekretnine.real_estate_t
where OFFER_TYPE='P' and REAL_ESTATE_TYPE='K'
order by PRICE desc
limit 30;

/*prikazati rang listu prvih 100 najvećih kuća i 100 najvećih stanova po površini
(kvadraturi);*/
select *
from nekretnine.real_estate_t
where REAL_ESTATE_TYPE='K'
order by SQUARE_FOOTAGE desc
limit 100;
select *
from nekretnine.real_estate_t
where REAL_ESTATE_TYPE='S'
order by SQUARE_FOOTAGE desc
limit 100;

/*prikazati rang listu svih nekretnina izgrađenih u 2020. godini (promenjeno u Novogradnja), i izlistati ih opadajuće
prema ceni prodaje, odnosno ceni iznajmljivanja;
*/
select *
from nekretnine.real_estate_t
where object_type='Novogradnja'
order by price desc
limit 100;

/*prikazati nekretnine (Top30) koje imaju:
▪ najveći broj soba unutar nekretnine,
▪ najveću kvadraturu (samo za stanove),
▪ najveću površinu zemljišta (samo za kuće).*/
select *
from nekretnine.real_estate_t
where TOTAL_ROOMS='5+'
order by TOTAL_ROOMS desc
limit 30;
select *
from nekretnine.real_estate_t
where REAL_ESTATE_TYPE='S'
order by SQUARE_FOOTAGE desc
limit 30;
select *
from nekretnine.real_estate_t
where REAL_ESTATE_TYPE='K'
order by LOT_SQUARE_FOOTAGE desc
limit 30;