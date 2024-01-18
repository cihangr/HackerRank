SELECT H.hacker_id, H.name, t1.totalscore FROM
(
    SELECT hacker_id, SUM(maxscore) AS totalscore FROM 
    (
    SELECT hacker_id, MAX(score) AS maxscore FROM Submissions
        GROUP BY hacker_id, challenge_id
        ORDER BY maxscore DESC
    ) t GROUP BY hacker_id
) t1
JOIN Hackers H ON H.hacker_id = t1.hacker_id
GROUP BY H.hacker_id, H.name
HAVING t1.totalscore <> 0
ORDER BY t1.totalScore DESC, H.hacker_id;