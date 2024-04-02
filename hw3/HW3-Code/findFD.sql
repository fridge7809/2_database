
SELECT 'Rentals: pid --> hid' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.pid
        FROM Rentals R
        GROUP BY R.pid
        HAVING COUNT(DISTINCT R.hid) > 1
) X;


SELECT 'Rentals: pid --> pn' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.pid
        FROM Rentals R
        GROUP BY R.pid
        HAVING COUNT(DISTINCT R.pn) > 1
) X;


SELECT 'Rentals: pid --> s' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.pid
        FROM Rentals R
        GROUP BY R.pid
        HAVING COUNT(DISTINCT R.s) > 1
) X;


SELECT 'Rentals: pid --> hs' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.pid
        FROM Rentals R
        GROUP BY R.pid
        HAVING COUNT(DISTINCT R.hs) > 1
) X;


SELECT 'Rentals: pid --> hz' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.pid
        FROM Rentals R
        GROUP BY R.pid
        HAVING COUNT(DISTINCT R.hz) > 1
) X;


SELECT 'Rentals: pid --> hc' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.pid
        FROM Rentals R
        GROUP BY R.pid
        HAVING COUNT(DISTINCT R.hc) > 1
) X;


SELECT 'Rentals: hid --> pid' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hid
        FROM Rentals R
        GROUP BY R.hid
        HAVING COUNT(DISTINCT R.pid) > 1
) X;


SELECT 'Rentals: hid --> pn' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hid
        FROM Rentals R
        GROUP BY R.hid
        HAVING COUNT(DISTINCT R.pn) > 1
) X;


SELECT 'Rentals: hid --> s' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hid
        FROM Rentals R
        GROUP BY R.hid
        HAVING COUNT(DISTINCT R.s) > 1
) X;


SELECT 'Rentals: hid --> hs' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hid
        FROM Rentals R
        GROUP BY R.hid
        HAVING COUNT(DISTINCT R.hs) > 1
) X;


SELECT 'Rentals: hid --> hz' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hid
        FROM Rentals R
        GROUP BY R.hid
        HAVING COUNT(DISTINCT R.hz) > 1
) X;


SELECT 'Rentals: hid --> hc' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hid
        FROM Rentals R
        GROUP BY R.hid
        HAVING COUNT(DISTINCT R.hc) > 1
) X;


SELECT 'Rentals: pn --> pid' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.pn
        FROM Rentals R
        GROUP BY R.pn
        HAVING COUNT(DISTINCT R.pid) > 1
) X;


SELECT 'Rentals: pn --> hid' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.pn
        FROM Rentals R
        GROUP BY R.pn
        HAVING COUNT(DISTINCT R.hid) > 1
) X;


SELECT 'Rentals: pn --> s' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.pn
        FROM Rentals R
        GROUP BY R.pn
        HAVING COUNT(DISTINCT R.s) > 1
) X;


SELECT 'Rentals: pn --> hs' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.pn
        FROM Rentals R
        GROUP BY R.pn
        HAVING COUNT(DISTINCT R.hs) > 1
) X;


SELECT 'Rentals: pn --> hz' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.pn
        FROM Rentals R
        GROUP BY R.pn
        HAVING COUNT(DISTINCT R.hz) > 1
) X;


SELECT 'Rentals: pn --> hc' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.pn
        FROM Rentals R
        GROUP BY R.pn
        HAVING COUNT(DISTINCT R.hc) > 1
) X;


SELECT 'Rentals: s --> pid' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.s
        FROM Rentals R
        GROUP BY R.s
        HAVING COUNT(DISTINCT R.pid) > 1
) X;


SELECT 'Rentals: s --> hid' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.s
        FROM Rentals R
        GROUP BY R.s
        HAVING COUNT(DISTINCT R.hid) > 1
) X;


SELECT 'Rentals: s --> pn' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.s
        FROM Rentals R
        GROUP BY R.s
        HAVING COUNT(DISTINCT R.pn) > 1
) X;


SELECT 'Rentals: s --> hs' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.s
        FROM Rentals R
        GROUP BY R.s
        HAVING COUNT(DISTINCT R.hs) > 1
) X;


SELECT 'Rentals: s --> hz' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.s
        FROM Rentals R
        GROUP BY R.s
        HAVING COUNT(DISTINCT R.hz) > 1
) X;


SELECT 'Rentals: s --> hc' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.s
        FROM Rentals R
        GROUP BY R.s
        HAVING COUNT(DISTINCT R.hc) > 1
) X;


SELECT 'Rentals: hs --> pid' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hs
        FROM Rentals R
        GROUP BY R.hs
        HAVING COUNT(DISTINCT R.pid) > 1
) X;


SELECT 'Rentals: hs --> hid' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hs
        FROM Rentals R
        GROUP BY R.hs
        HAVING COUNT(DISTINCT R.hid) > 1
) X;


SELECT 'Rentals: hs --> pn' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hs
        FROM Rentals R
        GROUP BY R.hs
        HAVING COUNT(DISTINCT R.pn) > 1
) X;


SELECT 'Rentals: hs --> s' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hs
        FROM Rentals R
        GROUP BY R.hs
        HAVING COUNT(DISTINCT R.s) > 1
) X;


SELECT 'Rentals: hs --> hz' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hs
        FROM Rentals R
        GROUP BY R.hs
        HAVING COUNT(DISTINCT R.hz) > 1
) X;


SELECT 'Rentals: hs --> hc' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hs
        FROM Rentals R
        GROUP BY R.hs
        HAVING COUNT(DISTINCT R.hc) > 1
) X;


SELECT 'Rentals: hz --> pid' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hz
        FROM Rentals R
        GROUP BY R.hz
        HAVING COUNT(DISTINCT R.pid) > 1
) X;


SELECT 'Rentals: hz --> hid' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hz
        FROM Rentals R
        GROUP BY R.hz
        HAVING COUNT(DISTINCT R.hid) > 1
) X;


SELECT 'Rentals: hz --> pn' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hz
        FROM Rentals R
        GROUP BY R.hz
        HAVING COUNT(DISTINCT R.pn) > 1
) X;


SELECT 'Rentals: hz --> s' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hz
        FROM Rentals R
        GROUP BY R.hz
        HAVING COUNT(DISTINCT R.s) > 1
) X;


SELECT 'Rentals: hz --> hs' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hz
        FROM Rentals R
        GROUP BY R.hz
        HAVING COUNT(DISTINCT R.hs) > 1
) X;


SELECT 'Rentals: hz --> hc' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hz
        FROM Rentals R
        GROUP BY R.hz
        HAVING COUNT(DISTINCT R.hc) > 1
) X;


SELECT 'Rentals: hc --> pid' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hc
        FROM Rentals R
        GROUP BY R.hc
        HAVING COUNT(DISTINCT R.pid) > 1
) X;


SELECT 'Rentals: hc --> hid' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hc
        FROM Rentals R
        GROUP BY R.hc
        HAVING COUNT(DISTINCT R.hid) > 1
) X;


SELECT 'Rentals: hc --> pn' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hc
        FROM Rentals R
        GROUP BY R.hc
        HAVING COUNT(DISTINCT R.pn) > 1
) X;


SELECT 'Rentals: hc --> s' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hc
        FROM Rentals R
        GROUP BY R.hc
        HAVING COUNT(DISTINCT R.s) > 1
) X;


SELECT 'Rentals: hc --> hs' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hc
        FROM Rentals R
        GROUP BY R.hc
        HAVING COUNT(DISTINCT R.hs) > 1
) X;


SELECT 'Rentals: hc --> hz' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
        SELECT R.hc
        FROM Rentals R
        GROUP BY R.hc
        HAVING COUNT(DISTINCT R.hz) > 1
) X;

