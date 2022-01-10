
CREATE TABLE p220008.africa_boundaries_trans
  AS (SELECT *,St_transform(wkb_geometry,32639) as geom FROM p220008.africa_boundaries);
CREATE INDEX "africa_boundaries_trans_geom_idx" ON "africa_boundaries_trans" USING GIST ("geom");

CREATE TABLE p220008.africa_mineral_deposits_trans
  AS (SELECT *,St_transform(wkb_geometry,32639) as geom FROM p220008.africa_mineral_deposits);
CREATE INDEX "africa_mineral_deposits_trans_geom_idx" ON "africa_mineral_deposits_trans" USING GIST ("geom");

CREATE TABLE p220008.africa_ports_trans
  AS (SELECT *,St_transform(wkb_geometry,32639) as geom FROM p220008.africa_ports );
CREATE INDEX "africa_ports_trans_geom_idx" ON "africa_ports_trans" USING GIST ("geom");

CREATE TABLE p220008.africa_railway_trans
  AS (SELECT *,St_transform(wkb_geometry,32639) as geom FROM p220008.africa_railway);
CREATE INDEX "africa_railway_trans_geom_idx" ON "africa_railway_trans" USING GIST ("geom");


CREATE TABLE p220008.p220008.africa_roads_trans
  AS (SELECT *,St_transform(wkb_geometry,32639) as geom FROM p220008.africa_roads);
CREATE INDEX "africa_roads_trans_geom_idx" ON "africa_roads_trans" USING GIST ("geom");
