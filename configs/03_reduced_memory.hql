SET hive.exec.reducers.max=30;
SET hive.tez.container.size=6144; --6GB
SET tez.runtime.io.sort.mb=3072;   --3GB
SET tez.task.resource.memory.mb=3072; --3GB
SET tez.am.resource.memory.mb=5120;  --5GB
SET tez.grouping.min-size=3221225472; --3GB
SET tez.grouping.max-size=3221225472; --3GB

--Common settings
SET tez.am.container.reuse.enabled=true;
SET hive.auto.convert.join=true;
SET hive.exec.parallel=true;
SET hive.exec.parallel.thread.number=12;
SET hive.vectorized.execution.reduce.enabled=true;
SET hive.support.quoted.identifiers=none;

--Avoids small files
SET mapred.reduce.tasks = 50;
SET hive.merge.tezfiles=true;
SET hive.merge.mapfiles=true;
SET hive.merge.mapredfiles=true;
SET hive.merge.size.per.task=128000000;
SET hive.merge.smallfiles.avgsize=128000000;




--Requested Memory: ~11TB
--Used Memory: ~8TB
--Job Time: ~23 mins
--Much better utilisation
--Tried reducing containers to 4Gb -> caused vertex Failures