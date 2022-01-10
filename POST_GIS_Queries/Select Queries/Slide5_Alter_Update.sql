ALTER TABLE africa_boundaries_trans ADD COLUMN minerals_count numeric DEFAULT 0;
With PolygonQuery as (
    SELECT b.ogc_fid,count(*) as minerals_count
    FROM p220008.africa_mineral_deposits_trans as a, p220008.africa_boundaries_trans as b
    where ST_CONTAINS(b.geom,a.geom)
    GROUP BY b.ogc_fid)

UPDATE africa_boundaries_trans
SET minerals_count = Round(CAST(PolygonQuery.minerals_count AS numeric),8)
FROM PolygonQuery 
WHERE africa_boundaries_trans.ogc_fid = PolygonQuery.ogc_fid;



select ogc_fid,country,capital,dsgattr01,shape_leng,shape_area,minerals_count from p220008.africa_boundaries_trans
order by ogc_fid

