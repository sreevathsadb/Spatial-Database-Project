------Objective Query ------
DROP VIEW IF EXISTS final;
CREATE  OR REPLACE VIEW  final AS 
--Finding the mineral id that intersects the railway paths.
with base1 as(
SELECT l1.ogc_fid  as mineral_id ,l2.ogc_fid as railway_id,(l1.buffer <-> l2.geom)/1000 as TheDistance
FROM  p220008.sa_minerals_v as l1, p220008.sa_railways_v as l2
where (ST_Intersects(l1.buffer,l2.geom)) ORDER BY TheDistance desc),
---filtering the mineral deposits that doesnt interects with any railways
no_railways as (
SELECT ogc_fid,mineral,categeory,geom,buffer
FROM   p220008.sa_minerals_v a 
WHERE  NOT EXISTS ( SELECT distinct(mineral_id)
FROM   base1 WHERE  mineral_id = a.ogc_fid)),
--select * from no_railways,
---Finding the mineral deposits that intersects with roads but not with railways
base2 as (
SELECT l1.ogc_fid  as mineral_id ,l2.ogc_fid as road_id,(l1.buffer <-> l2.geom)/1000 as TheDistance
FROM no_railways as l1, p220008.sa_roads_v as l2
where (ST_Intersects(l1.buffer,l2.geom))ORDER BY TheDistance desc)
---filtering the mineral deposits that doesnt interects with any roadways and railways
SELECT ogc_fid,mineral,categeory,geom,buffer
FROM   no_railways a 
WHERE  NOT EXISTS ( SELECT distinct(mineral_id)
FROM   base2 WHERE  mineral_id = a.ogc_fid);
select count(*) as result from final