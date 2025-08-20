## Key Parameters Tuned

### Reducers
- `hive.exec.reducers.max`
- `mapred.reduce.tasks`
- `hive.exec.reducers.bytes.per.reducer`

👉 Balancing reducer count is crucial. Too few reducers → slower jobs; too many → resource overhead.

### Containers & Memory
- `hive.tez.container.size`
- `tez.task.resource.memory.mb`
- `tez.am.resource.memory.mb`

👉 Reducing container size drastically cuts requested memory, but going too low risks **vertex failure**.

### Grouping / Mappers
- `tez.grouping.min-size`
- `tez.grouping.max-size`

👉 Decreasing grouping size increases mapper count → better parallelism → faster execution, but increases memory demand.

### Joins & Optimizations
- `hive.auto.convert.join`
- `hive.optimize.skewjoin`
- `hive.vectorized.execution.reduce.enabled`
- `hive.cbo.enable`



### Reduced Containers and Reducers.
### Increased Mappers (More Splits,Smaller Containers).

