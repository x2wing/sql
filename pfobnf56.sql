SELECT SURNAME, MARK, SUBJ_NAME
FROM STUDENT, EXAM_MARKS, SUBJECT
WHERE STUDENT.STUDENT_ID=EXAM_MARKS.STUDENT_ID AND SUBJECT.SUBJ_ID=EXAM_MARKS.SUBJ_ID AND EXAM_MARKS.MARK >=3

SELECT STUDENT.STUDENT_ID, SURNAME, SUBJ_NAME, MARK
FROM STUDENT, EXAM_MARKS, SUBJECT
WHERE STUDENT.STUDENT_ID=EXAM_MARKS.STUDENT_ID AND SUBJECT.SUBJ_ID=EXAM_MARKS.SUBJ_ID AND (EXAM_MARKS.MARK = 4 OR EXAM_MARKS.MARK=5)

SELECT RATING, UNIV_NAME, STIPEND
FROM UNIVERSITY JOIN STUDENT
ON UNIVERSITY.UNIV_ID=STUDENT.UNIV_ID AND RATING>4 AND STUDENT.STIPEND IN (SELECT MAX(STIPEND)
                                                                           FROM STUDENT
                                                                           WHERE UNIV_ID=12)
UNION
SELECT RATING, UNIV_NAME, STIPEND
FROM UNIVERSITY JOIN STUDENT
ON UNIVERSITY.UNIV_ID=STUDENT.UNIV_ID AND RATING>4 AND STUDENT.STIPEND IN (SELECT MAX(STIPEND)
                                                                           FROM STUDENT
                                                                           WHERE UNIV_ID=11);

SELECT SURNAME, RATING, STUDENT_ID
FROM UNIVERSITY, STUDENT
WHERE UNIVERSITY.UNIV_ID=STUDENT.UNIV_ID AND (STUDENT.UNIV_ID = 0 OR STUDENT.UNIV_ID != 0)

SELECT FIRST.SURNAME, SECOND.SURNAME
FROM STUDENT FIRST, STUDENT SECOND
WHERE FIRST.ADDRESS=SECOND.ADDRESS AND FIRST.SURNAME<SECOND.SURNAME
ORDER BY FIRST.SURNAME

SELECT FIRST.UNIV_NAME, SECOND.UNIV_NAME
FROM UNIVERSITY FIRST, UNIVERSITY SECOND
WHERE FIRST.CITY=SECOND.CITY AND FIRST.UNIV_NAME<SECOND.UNIV_NAME

SELECT UNIV_NAME, CITY
FROM UNIVERSITY
WHERE RATING > (SELECT RATING
                 FROM UNIVERSITY
                 WHERE UNIV_NAME='BSU')