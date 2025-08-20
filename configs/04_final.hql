SET hive.exec.reducers.max=25;
SET hive.tez.container.size=5120; --5GB
SET tez.runtime.io.sort.mb=3072;   --3GB
SET tez.task.resource.memory.mb=2560; --2.5GB
SET tez.am.resource.memory.mb=2048;  --2GB
SET tez.grouping.min-size=268435456; --256 MB
SET tez.grouping.max-size=1073741824; --1GB

--Common settings
SET tez.am.container.reuse.enabled=true;
SET hive.auto.convert.join=true;
SET hive.exec.parallel=true;
SET hive.exec.parallel.thread.number=12;
SET hive.vectorized.execution.reduce.enabled=true;
SET hive.support.quoted.identifiers=none;

--Avoids small files
SET mapred.reduce.tasks = 40;
SET hive.merge.tezfiles=true;
SET hive.merge.mapfiles=true;
SET hive.merge.mapredfiles=true;
SET hive.merge.size.per.task=128000000;
SET hive.merge.smallfiles.avgsize=128000000;


SET hive.execution.engine=tez;


--Requested Memory: ~7TB
--Used Memory: ~6.2TB
--Job Time: ~26 mins
--Memory Wastage reduced to ~10-12%
--SLA met successfully
