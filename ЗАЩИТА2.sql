--�������� ������, ���������� ������ �� ������ ���� ���������, ������� �� �������� c ��������������� 10 ���� ���� ������ �������� �����.

SELECT NAME, SURNAME, STUDENT_ID
FROM STUDENT
WHERE STUDENT_ID IN (SELECT STUDENT_ID 
                     FROM EXAM_MARKS 
                     WHERE MARK > (SELECT AVG(MARK) 
                                   FROM EXAM_MARKS
                                   GROUP BY SUBJ_ID
                                   HAVING SUBJ_ID=12))

--�������� ������ � EXISTS, ����������� ������� ������ ��� ���� ��������� ����������� � �����, ������� ������� ���� 300.

SELECT *
FROM STUDENT FIRST
WHERE EXISTS (SELECT RATING 
              FROM UNIVERSITY SECOND 
              WHERE RATING>4 AND FIRST.UNIV_ID=SECOND.UNIV_ID)