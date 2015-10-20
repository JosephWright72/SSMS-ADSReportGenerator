select count(*), projectid 
from aaoshwsets
group by projectid
order by 1 desc

select AD.ProjectID,FrameDepth 
from aaosdoors AD
LEFT OUTER JOIN AAOSHWSets AH ON AD.hwset = AH.setname
where framedepth <> 146
and AH.ID Is not null

