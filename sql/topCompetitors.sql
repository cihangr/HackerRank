--All tables are connected by order. Where statement filtered scores and like this we can accumulate max score ones
--according to difficulty level. 

SELECT H.hacker_id, H.name FROM Hackers H
JOIN Submissions S ON H.hacker_id = S.hacker_id
JOIN Challenges C ON S.challenge_id = C.challenge_id
JOIN Difficulty D ON C.difficulty_level = D.difficulty_level
WHERE D.score = S.score AND C.difficulty_level = D.difficulty_level
GROUP BY H.hacker_id, H.name
HAVING COUNT(S.hacker_id)>1
ORDER BY COUNT(S.hacker_id) DESC, S.hacker_id ASC;