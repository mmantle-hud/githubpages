| QUERY PLAN                                                                                                                          | 
|-------------------------------------------------------------------------------------------------------------------------------------| 
| Index Scan using idx_demo_family_name on demo_students  (cost=0.42..4.44 rows=1 width=24) (actual time=0.141..0.146 rows=1 loops=1) | 
|   Index Cond: ((family_name)::text = 'Smith'::text)                                                                                 | 
|   Buffers: shared hit=1 read=3                                                                                                      | 
| Planning:                                                                                                                           | 
|   Buffers: shared hit=19 read=1                                                                                                     | 
| Planning Time: 0.693 ms                                                                                                             | 
| Execution Time: 0.207 ms                                                                                                            | 
