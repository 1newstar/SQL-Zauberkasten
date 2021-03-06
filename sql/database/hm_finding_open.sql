--
-- Thorsten Bruhns (Thorsten.Bruhns@opitz-consulting.de)
--
-- Info for open findings from Health-Monitor
--
-- Date : 08.02.2016: 08.02.2016
-- Version: 1

set lines 120 pages 100 
column ins format 999
column name format a20
column CLASS_NAME format a20
column zeit format a14
column PRIORITY format a7
column TYPE format a12
column DESCRIPTION format a100


select INST_ID ins
      ,NAME
      ,CLASS_NAME
      ,to_char(TIME_DETECTED, 'dd.mm.yy hh24:mi') zeit
      ,PRIORITY
      ,TYPE
      ,DESCRIPTION
from (select *
      from gv$hm_finding
      where status = 'OPEN'
      order by TIME_DETECTED desc)
 where rownum < 26
order by TIME_DETECTED, inst_id;

