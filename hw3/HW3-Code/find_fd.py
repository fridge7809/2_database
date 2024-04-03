SQLquery = """
SELECT 'Relation: %s --> %s' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.%s
        FROM Relation R
        GROUP BY R.%s
        HAVING COUNT(DISTINCT R.%s) > 1
) X;
"""

def PrintSQL(Att1, Att2):
    print (SQLquery % (Att1, Att2, Att1, Att1, Att2));

R = ['pid', 'hid', 'pn', 's', 'hs', 'hz', 'hc']
for i in range(len(R)):
    for j in range(len(R)):
        if (i != j):
            PrintSQL(R[i], R[j])

