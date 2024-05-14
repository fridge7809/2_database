## Dictionary

candidate key:      attribute or combination of attributes that uniquely defines a row in the table
prime attributes:   an attribute that belongs to at least one candidate key
non-prime:          an attribute that does not belong to any candidate key

data integrity:     no data is lost
redundancy:         data is stored in several schemas
decomposition:      split wider relation into a narrower relation
relation:           database table with rows and columns
functional dependency: contraints between attributes.
trivial dependencies: attribute that depends on itself, or a combination of itself and something else
superkey:           candidate key or a superset of a candidate key (candidate key + some other attribute)
if x implies y, then we can infer the value of y when given x for example: personid (x) implies personname (y). but personname (y) does not imply personid(x) - people with the same name have different ids.
attributes:         columns in a relation
records (tuples):	  rows in a schema instance
database:			      collection of relations
relation instance:	records in a relation
keys:				         defines unique records
superkey:			      set of attributes that uniquely identifies a record
minimal superkey:	  smallest set of attributes that maintains the uniqueness property
foreign key:		    defines relation between relations
ddl:				        data definition language (queries, select, insert, update, delete)
dml:				        data manipulaiton language (schema definitions, indexes, triggers, functions, create table, alter table, drop table)
division query:		  find y that has/sells/contains/etc **all** x
indexes:			      data structures that optimizes read performance of database. **indexes may queries performant!**
clustered index:	  store tuples that match a range condition together, stored together physically on disk
covering index:	  	an index is covering if it covers the entire query (supplies everything that a query needs).
bplus tree:			    a binary search tree that contains only keys (not kv pairs) where the leaf nodes contain data to be indexed as a linked list
flush:              write transaction state to persiistent data
buffer manager:     manages changes written from memory too disk
unavoidable:        a functional dependency is unavoidable if it has a superkey on the left hand side
redundant:          a functional dependency that can be computed from other functional dependencies (with axioms) are redundant

``` sql
SELECT coffeehouse
  FROM Sells
 GROUP BY coffeehouse
HAVING COUNT(coffee) = (
        SELECT COUNT(*)
          FROM Coffees);
```


## Indexes

- It is a seperate data structure, it maintains a copy of (part of) your data
- Clustered indexes store tuples that match a range condition together
- Some queries can be answered looking only at the index (a covering index for
query)
- Indexes slow down updates and insertions

### Index selection

Point and range queries on the attribute(s) of a clustered index are almost always best performed using an index scan.
Unclustered indexes should only be used with high selectivity queries.
Exception: Covering index is good for any selectivity.
If no index exists, a full table scan is required!
If no “good” index exists, a full table scan is preferred!

## Normal forms

- Goal: eliminate redundancy
- Data integrity, data consistency, easy data manipulation, data organization

### 1NF

- attributes have primitive data types (no arrays), ie. are atomic
- attributes have a unique name

### 2NF


- No non-prime attribute depends on a part of a candidate key

See dictionary

### 3NF

- Each non-prime attribute of a table should depend on every candidate key
- It should never depend on part of a candidate key
- It should never depend on other non-prime attributes

It other words, non-key -> non-key violates 3NF

### BCNF

- Every functional dependency in a table must be a dependency on a candidate key
- Except trivial dependencies

### Functional dependencies

We cannot prove a FD with a schema instance, but we can check if it breaks a FD.

## What is good DB design

- Schema design is driven by the structure of the data you want to put in.
- Indexes design is driven by what queries you will perform.

### No redundancy in schemas

Redundancy causes anomalies!

- Update anomalies
- Insert anomalies
- Delete anomalies

### Data integrity

No lost data.

- Good performance

### b+ tree (index data structure most commonly used)

most common index type. tree of keys with L and R.

LEFT pointer is less than current key, RIGHT pointer is greather than.

good for:

- point query
- range query

maintain balanced tree. 
There is a linked list in leaf nodes such that we can traverse the leaves for range queries.
Leaf size = page size

#### traversing b+

- begin at root
- greater or less than?
- walk leaves up to value we are searching for

*is a candidate to use for binary search*

we must always go to leaf node because root parent may not contain a value

### inserting b+

- split leaf
- copy latter half to the new leaf node

### selections

- highly selective index: matches few tuples

- conjunction (and): use indeces for attributes in where clause if the clause is highly selective

- disjunction (or): 

## Transactions

- Transaction is a part of storage manager that fetches data from disk to main memory
- We need transactions to **maintain the sequential order of queries** - the order queries are executed in matters
- We need to maintain a consistent state of the DB to ensure data integrety (think of quantity of an online store)
- DBMS must ensure reliable operations  oover shared data despite many concurrent accesses

### ACID properties

- Atomicity

All or nothing operation - We fully commit to the transaction. If it fails, we do not commit changes to persistent data
Recovery

- Consistency

We move the DB from one consistent state to another consistent state - After a transaction, constraints are satisfied
Constraints, triggers

- Isolation

Concurrent transactions should appear as if they're isolated - transactions are not aware of the effects of other transactions whilst they're running.
Concurrency control


- Durability
Recovery
The effect of a committed transaction remmains in the database event if the system crashes

### Buffer manager

- Commits once transaction is complete
- Commits may be written to disk - depends on buffer manager policy
- Most common policy for DMBS is No force / steal

#### Force / immediate update policy

- Ensured durability, but increases response time because of more IO operations


#### No steal / deferred update policy

- Ensured atomicity

### Logging

- Write-ahead logging WAL protocol

Before any change is written, force log record to disk - ensure atomocity
Before a transaction is comitted, force all log records for the transaction to disk - ensure durability

What is written to the log? **log concept**

- REDO UNDO info
- Infinite file, append only
- Diff is written to log

## Persist data in a MMDBMS (redis)

- Transaction log on disk
- Snapshots (copy of state flushed to disc) usually during downtime


### How to implrement transactions?

- Consistency
- Atomicity and durability
Logging before values, logging after values

- Isolation, preventing corrupting changes

## Scheduler

**Simple scheduler would be a queue**
Causes delay but may be fine for in-memory DB's

**Interleaving scheduler**
Allow transaction to interleave as if they ran in serial with locking

## Locks

- One transaction may lock an element at any time
- Locks are requested by *transactions* and granted by *lock scheduler*

**Types of locks**

- Read locks (read), these locks are shared and other transactions may read
- Write lock (exclusive

**Deadlock** - cyclic dependency in the transaction lock request queue.
Deadlock occurs if 2 transactions are granted locks on 2 seperate entities but request another lock on the other entity

### Rigorous two-phase locking 2PL protocol

1. Before reading record/page, get a shared locks (S). Before writing a record/page, get an exclusive lock (X)
2. A record/page cannot have an  X lock at the same time as any other lock
3. Release all locks om commit/abort

Simple to understand and works well in practice
Makes transaction rollback eassier


## Process models

What kind of workloads should our DMBS support?

### On-Line transaction processing (OLTP)

More write-heavy, simple query workloads

- Ingesting new data from the outside world, serving many clients at once
- Example: webshop, users (clients) are reading/writing small amounts of data for every transaction, adding to cart, viewing items, etc.

Usually the workload of a simple CRUD application

### On-Line analytical processing (OLAP)

Less read-heavy, complex query workloads

- Complex queries that read lots of data to compute aggregates
- Example: BA wants to find all products satisfying some complex query that utilizes a bigger subset of the database
- Usually read only queries

OLAP workloads are executed against collected data from our OLTP application

### Hybrid transaction + analytical processing (HTAP)

- OLTP + OLAP in one database instance

## Storage models

How do we organize tuples physically on disk and in memory?

- 1. N-ary storage model (NSM)

Storing tuple attributes sequentially as they appear in a single page, also known as row store.
- Ideal for OLTP workload where we access a single entity (CRUD app).
- Fast insert, update, delete

Example of NSM and OLTP workload:

``` sql
select * from user where username = ? and userpass = ?
``` 

-> lookup position of page on disk using index ideally, get all attributes of the tuple.

**THIS IS ROW OPTIMIZED - ALL THE DATA WE NEED IS IN THE SAME ROW**

NSM with an OLAP workload loads more data to memory than is required when we get useless attributes.
If we rent a DB server in the cloud and we pay for usage, then it has monetary implications to perform more I/O operations than we need to.
This is why we want memory effenciency.

- 2. Decomposition storage model (DSM)

Storing column by column, also known as a "column store".

- Ideal for OLAP workloads
- Store all attributes on its own page
- Sow for point queries and CRUD operations

**THIS IS COLUMN OPTIMIZED**

- 3. Hybrid storage model (PAX)

Hybrid between NSM and DSM.

### Why does it matter?

Assume we have an application with a OLTP workload (CRUD app), then we know we will have a more write-heavy workload, often inserting values where we need all attributes accessed at once.

## Query processingx$

- sql is translated to relational algebra
- there will be joins

consider 

``` sql
select * from r join s on s.id = r.id
```

- nested loop join (quadratic n^2)

for each r in r
for each s in s

may be optimized with index

## Relational model history

- proposed in 1970
- SQL 1973-94
- Transaction 1975
- b+ trees and and query optimization in late 1970ies

## Big data management

Web app data grows more than structured data, and it is not relational

Logs, blobs, media

Big data can be characterized by 5 properties, "the 5 V's":

- Volume
- Velocity
- Variety
- Veracity
- Value

Analytics applications typically require (repeated)
processing of whole datasets of unstructured data.

This access pattern is not well served by SQL or NoSQL
data systems


### RDMBS

- Pros

Transactions, query processing (filtering), OLTP workloads

- Cons

No support for unstructured data or distributed processing, and not that relevant to big data except for ability to filter data

### NoSQL - KV stores

- Pros

Distributed storage (horizontal scaling), can handle semi-structured and unstructured data equally well.
Low latency for single items (key lookup)

- Cons

Cannot scan entire collection, no support for filtering or distributed parralel processing pipelines

### NoSQL - Document stores

- Pros

Distributed storage (horizontal scaling), semi structured data.
Low latency for single items (key lookup). Can filter documents

- Cons

Cannot scan entire collection, no support for filtering or distributed parralel processing pipelines

### NoSQL - Graph stores

- Pros

Graph related application. May inherent strengths from other solutions

- Cons

May inherit weakness from other solutions

## MapReduce / Spark / Hadoop and similar frameworks

- Designed to handle requirements of big data, distributed processing
- Takes advantage of functional programming to map reduce for parralel processing in a distributed system
- Workload can be load balanced on cluster of nodes
- Can handle very large datasets

There is an IO operation for each map / reduce because the result is written to disk. This becomes slow for large map/reduce pipelines.

- Pros

Good for distributed storage and processing

- Cons

High latency on small requests, only suitable for distributed processing pipelines

### Spark

- Pros

Spark proccesses in-momery unlike hadoop, becomes faster for complex pipelines.
Also optimized for lazy evaluation
Supports memory sharing between worker nodes. Becomes fast bcause the process is kept in memory.
Works with Resilient Distributed Datasets, applications takes RDD's as input and output RDD's

Supported operations:

- map
- flatmap
- filter
- union

etc. 



## Access patterns to data on disk

- Too large for a single server, must be stored in a distributed system
- We usually want to read all of the collection


- SQL, regex

### Volume

Data is big when it exceeds capicity of architecture.
The amount of datawarehouse 40 petabytes. 

ebay: data

### Velocity

- The speed at which its generated. We need to process the data at the speeds its generated - particle accelerators.

### Veracity

- Quality or trustwortyness of the data, accuracy
- Data cleaning takes time (chichi)

### Variety

- Fingerprint, logs, relational OTLP data, blobs, photos
- Structured (oltp), Semi-strucutre (logs, books, comment threads), Unstructured 

### Value

- Monetary, societal
