SET hive.exec.reducers.max=60;
SET hive.tez.container.size=16384; --16GB
SET tez.runtime.io.sort.mb=5120;   --5GB
SET tez.task.resource.memory.mb=8192; --8GB
SET tez.am.resource.memory.mb=12288;  --12GB
SET tez.grouping.min-size=8589934592; --8GB
SET tez.grouping.max-size=8589934592; --8GB

--Common settings
SET tez.am.container.reuse.enabled=true;
SET hive.auto.convert.join=true;
SET hive.exec.parallel=true;
SET hive.exec.parallel.thread.number=12;
SET hive.vectorized.execution.reduce.enabled=true;
SET hive.support.quoted.identifiers=none;

--Avoids small files
SET mapred.reduce.tasks = 80;
SET hive.merge.tezfiles=true;
SET hive.merge.mapfiles=true;
SET hive.merge.mapredfiles=true;
SET hive.merge.size.per.task=128000000;
SET hive.merge.smallfiles.avgsize=128000000;


--Requested Memory: ~50TB
--Used Memory: ~25TB
--Job Time: ~15 mins
--Almost 50% waste (huge over-allocation)