# Hive

# Hive Parameter Tuning for Tez Engine

This repository documents experiments and best practices for tuning **Apache Hive queries running on the Tez execution engine**. The focus is on reducing memory wastage, improving execution time, and balancing container size, reducers, and mappers.

## Background

- Workloads tested involve **ETL-style Hive jobs** with data sizes ranging from **160GB to 400GB**.
- Each job had a **time SLA** (e.g., completion under 25–30 minutes).
- Default settings led to excessive memory requests (up to **43TB**) with only ~50% utilization.

Through parameter tuning, we brought memory usage down to **~3.7TB** with much higher efficiency and without exceeding SLA.

---

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

---

## Example Configurations

### Initial (Inefficient)
```sql
SET hive.exec.reducers.max=50;
SET hive.tez.container.size=12288;
SET tez.task.resource.memory.mb=6144;
SET tez.am.resource.memory.mb=12288;
