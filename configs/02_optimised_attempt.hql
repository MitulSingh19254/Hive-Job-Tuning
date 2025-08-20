SET hive.exec.reducers.max=40;
SET hive.tez.container.size=10240; --10GB
SET tez.runtime.io.sort.mb=3072;   --3GB
SET tez.task.resource.memory.mb=6144; --6GB
SET tez.am.resource.memory.mb=10240;  --10GB
SET tez.grouping.min-size=6442450944; --6GB
SET tez.grouping.max-size=6442450944; --6GB

--Common settings
SET tez.am.container.reuse.enabled=true;
SET hive.auto.convert.join=true;
SET hive.exec.parallel=true;
SET hive.exec.parallel.thread.number=12;
SET hive.vectorized.execution.reduce.enabled=true;
SET hive.support.quoted.identifiers=none;

--Avoids small files
SET mapred.reduce.tasks = 60;
SET hive.merge.tezfiles=true;
SET hive.merge.mapfiles=true;
SET hive.merge.mapredfiles=true;
SET hive.merge.size.per.task=128000000;
SET hive.merge.smallfiles.avgsize=128000000;




--Requested Memory: ~30TB
--Used Memory: ~22TB
--Job Time: ~19 mins
--Wastage Reduced, but still too high