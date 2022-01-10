----- Boundaries of South Africa -----
DROP VIEW IF EXISTS sa_boundaries_v;
CREATE  OR REPLACE VIEW  sa_boundaries_v AS 
select ogc_fid,country,geom,minerals_count,shape_area 
from p220008.africa_boundaries_trans where country ~*'^south africa$'
----- Mineral Deposits avilable in South Africa -----
DROP VIEW IF EXISTS sa_minerals_v;
CREATE  OR REPLACE VIEW  sa_minerals_v AS 
select ogc_fid,geom,country,dsgattr01 as mineral,dsgattr09 as categeory,
dsgattr10/1000 as length,ST_Buffer(geom,10*564.00*(dsgattr10/1000)) as buffer 
from p220008.africa_mineral_deposits_trans where country ~*'^south africa$'
------ Railway path for Minerals Transporation ------
DROP VIEW IF EXISTS sa_railways_v;
CREATE  OR REPLACE VIEW  sa_railways_v AS 
select ogc_fid,country,featuretyp,shape_leng,geom
from p220008.africa_railway_trans where country ~*'^south africa$'
------ Roadways for Minerals Transportation ------
DROP VIEW IF EXISTS sa_roads_v;
CREATE  OR REPLACE VIEW  sa_roads_v AS 
select ogc_fid,geom,country,shape_leng as length
from p220008.africa_roads_trans where country ~*'^south africa$'
------- Ports for Minerals Transportation ------
DROP VIEW IF EXISTS sa_ports_v;
CREATE  OR REPLACE VIEW  sa_ports_v AS 
select ogc_fid,geom,country,featuretyp as cargo_type,dsgattr03 as mineral_type,
ROUND(CAST (REPLACE(dsgattr10, 'N/A', '0' ) AS NUMERIC)/10000,4) as radius
from p220008.africa_ports_trans where country ~*'^south africa$'



