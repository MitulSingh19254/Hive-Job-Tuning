# Hive Parameter Tuning for Tez Engine

This repository documents experiments and best practices for tuning **Apache Hive queries running on the Tez execution engine**. The focus is on reducing memory wastage, improving execution time, and balancing container size, reducers, and mappers.

## Background

- Workloads tested involve **ETL-style Hive jobs** with data size of more than **4TB**.
- Each job had a **time SLA** (e.g., completion under 25–30 minutes).
- Default settings led to excessive memory requests (up to **50TB**) with only ~50% utilization.

Through parameter tuning, we brought memory usage down to **~7TB** with much higher efficiency and without exceeding SLA.

---

## Example Configurations

### Initial (Inefficient)
```sql
SET hive.exec.reducers.max=50;
SET hive.tez.container.size=15360;
SET tez.task.resource.memory.mb=7168;
SET tez.am.resource.memory.mb=15360;
