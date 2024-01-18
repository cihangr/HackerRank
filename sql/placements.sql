

SELECT S.name FROM Students S
JOIN Friends F ON S.id=F.id
JOIN Packages P1 ON S.id=P1.id
JOIN Packages P2 ON F.friend_id=P2.id
WHERE P2.salary > P1.salary
ORDER BY P2.salary ASC;