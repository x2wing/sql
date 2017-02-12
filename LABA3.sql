SELECT UNIV_NAME
FROM UNIVERSITY
WHERE RATING>ANY(SELECT RATING FROM UNIVERSITY WHERE UNIV_NAME='SPBU')
-------------------------------------------------------------------------
SELECT *
FROM STUDENT A
WHERE 0 =ANY (SELECT COUNT (CITY) FROM UNIVERSITY B WHERE A.ADDRESS=B.CITY)
-------------------------------------------------------------------------

--�������� ������, ���������� �� ������� EXAM_MARKS ������ � ��������� ��������� ��������, ��� ������� 
--�������� ���������� �� �������� ������ (���� MARK) ��������� ����� �������� ������ ��� ��������, �������� ������������� ������ 5.

SELECT SUBJ_NAME
FROM SUBJECT A
WHERE EXISTS (SELECT DISTINCT SUBJ_ID 
              FROM EXAM_MARKS B
              WHERE MARK > ANY (SELECT MARK 
                                FROM EXAM_MARKS
                                WHERE SUBJ_ID=54354 AND A.SUBJ_ID=B.SUBJ_ID))

-------------------------------------------------------------------------
SELECT SUBJ_NAME
FROM SUBJECT A
WHERE EXISTS (SELECT DISTINCT SUBJ_ID
              FROM EXAM_MARKS B
              GROUP BY SUBJ_ID 
              HAVING MAX(MARK)>ANY(SELECT MARK
                                   FROM EXAM_MARKS
                                   WHERE SUBJ_ID=54354 AND A.SUBJ_ID=B.SUBJ_ID))
