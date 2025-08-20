We have different execution engines available in Yarn Queue. Mainly **Apache TEZ** and **Apache Spark**. Default inour Hadoop Ecosystem, Apache Tez is configured.
**Tez**: Generally provides good performance for most Hive queries and is more resource-efficient for traditional
ETL and batch processing jobs.
**Spark**: May require more memory and resources, but delivers superior performance for in-memory processing,
complex analytics, and interactive queries.


### 1.Start Big then try to trim Down: 
Begin with safe high allocations, then progressively shrink.

### 2.Reducers balance speed vs memory: 
Too many increases overhead, too few slows job.

### 3.Grouping size decides mapper count: 
smaller mapping=more mappers=better utilisation.

### 4.Container size is critical: 
Too big wastes memory,too small causes failures.
