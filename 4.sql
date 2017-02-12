SELECT  '�������', UNIV_NAME AS [�����������], CITY AS [�����], RATING AS [�������]
FROM UNIVERSITY
WHERE RATING > 4 UNION SELECT '������', UNIV_NAME, CITY, RATING
                       FROM UNIVERSITY
                       WHERE RATING <4;
                       

-------------------------------------------------------------------------
SELECT '��������', SURNAME 
FROM STUDENT A
WHERE STUDENT_ID IN (SELECT DISTINCT STUDENT_ID 
                     FROM EXAM_MARKS B
                     WHERE 3 <= ALL (SELECT MARK
                                    FROM EXAM_MARKS C
                                    WHERE B.STUDENT_ID=C.STUDENT_ID)
                     )
UNION 
SELECT '�� ��������', SURNAME
FROM STUDENT A
WHERE STUDENT_ID IN (SELECT DISTINCT STUDENT_ID
                     FROM EXAM_MARKS B
                     WHERE 2 = ANY (SELECT MARK 
                                    FROM EXAM_MARKS C
                                    WHERE B.STUDENT_ID=C.STUDENT_ID)
                                    )
UNION
SELECT '�� ������', SURNAME
FROM STUDENT A
WHERE NOT EXISTS (SELECT MARK
                  FROM EXAM_MARKS B
                  WHERE A.STUDENT_ID=B.STUDENT_ID)
UNION
SELECT '�� ������', SURNAME
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
                  
--������ � �������� � ������ �����
