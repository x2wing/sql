SELECT  'Высокий', UNIV_NAME AS [Университет], CITY AS [Город], RATING AS [Рейтинг]
FROM UNIVERSITY
WHERE RATING > 4 UNION SELECT 'Низкий', UNIV_NAME, CITY, RATING
                       FROM UNIVERSITY
                       WHERE RATING <4;
                       

-------------------------------------------------------------------------
SELECT 'Успевает', SURNAME 
FROM STUDENT A
WHERE STUDENT_ID IN (SELECT DISTINCT STUDENT_ID 
                     FROM EXAM_MARKS B
                     WHERE 3 <= ALL (SELECT MARK
                                    FROM EXAM_MARKS C
                                    WHERE B.STUDENT_ID=C.STUDENT_ID)
                     )
UNION 
SELECT 'Не успевает', SURNAME
FROM STUDENT A
WHERE STUDENT_ID IN (SELECT DISTINCT STUDENT_ID
                     FROM EXAM_MARKS B
                     WHERE 2 = ANY (SELECT MARK 
                                    FROM EXAM_MARKS C
                                    WHERE B.STUDENT_ID=C.STUDENT_ID)
                                    )
UNION
SELECT 'Не сдавал', SURNAME
FROM STUDENT A
WHERE NOT EXISTS (SELECT MARK
                  FROM EXAM_MARKS B
                  WHERE A.STUDENT_ID=B.STUDENT_ID)
UNION
SELECT 'Не сдавал', SURNAME
FROM STUDENT A
WHERE STUDENT_ID IN (SELECT STUDENT_ID
                     FROM EXAM_MARKS B
                     WHERE EXISTS (SELECT MARK
                                   FROM EXAM_MARKS C
                                   WHERE MARK IS NULL AND B.STUDENT_ID=C.STUDENT_ID))
ORDER BY SURNAME

-------------------------------------------------------------------------
SELECT 'Student', STUDENT_ID, SURNAME, NAME
FROM STUDENT
WHERE ADDRESS = 'Moscow'
UNION
SELECT 'Lecturer', LECTURER_ID, SURNAME, NAME
FROM LECTURER
WHERE ADDRESS = 'Moscow'
-------------------------------------------------------------------------
SELECT 'Student', STUDENT_ID, SURNAME, NAME
FROM STUDENT A
WHERE UNIV_ID IN (SELECT UNIV_ID 
                  FROM UNIVERSITY B
                  WHERE UNIV_NAME = 'MSU')
UNION
SELECT 'Lecturer', LECTURER_ID, SURNAME, NAME
FROM LECTURER A
WHERE UNIV_ID IN (SELECT UNIV_ID
                  FROM UNIVERSITY B
                  WHERE UNIV_NAME = 'MSU')
                  
--УЧАТСЯ И РАБОТАЮТ В РАЗНЫХ ВУЗАХ
