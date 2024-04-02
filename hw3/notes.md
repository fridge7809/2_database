prime attributes: part of a candidate key
non-prime - not part of candidate key
candidate key: all other values of the relation can be derived (implied) from this key

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

## Query processing

- sql is translated to relational algebra
- there will be joins

consider ```select * from r join s on s.id = r.id```

- nested loop join (quadratic n^2)

for each r in r
for each s in s

may be optimized with index

- 
