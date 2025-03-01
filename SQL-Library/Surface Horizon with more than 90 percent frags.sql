SELECT TOP 10
 #comp.cokey, chorizon.chkey, compname, hzname, hzdept_r, hzdepb_r, texture, 
 (SELECT SUM (fragvol_r)
FROM legend
INNER JOIN 
comp  
INNER JOIN(chorizon INNER JOIN chtexturegrp ON chorizon.chkey = chtexturegrp.chkey) ON #comp.cokey = chorizon.cokey
AND (((chorizon.hzdept_r)=(SELECT Min(chorizon.hzdept_r) AS MinOfhzdept_r
FROM chorizon INNER JOIN chtexturegrp ON chorizon.chkey = chtexturegrp.chkey
AND chtexturegrp.texture Not In ('SPM','HPM', 'MPM') 
AND chtexturegrp.rvindicator='Yes' AND #comp.cokey = chorizon.cokey ))AND ((chtexturegrp.rvindicator)='Yes'))
ORDER BY comppct_r DESC, cokey,  hzdept_r, hzdepb_r