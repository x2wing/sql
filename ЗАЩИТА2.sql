--Напишите запрос, выбирающий данные об именах всех студентов, имеющих по предмету c идентификатором 10 балл выше общего среднего балла.

SELECT NAME, SURNAME, STUDENT_ID
FROM STUDENT
WHERE STUDENT_ID IN (SELECT STUDENT_ID 
                     FROM EXAM_MARKS 
                     WHERE MARK > (SELECT AVG(MARK) 
                                   FROM EXAM_MARKS
                                   GROUP BY SUBJ_ID
                                   HAVING SUBJ_ID=12))

--Напишите запрос с EXISTS, позволяющий вывести данные обо всех студентах обучающихся в вузах, имеющих рейтинг выше 300.

SELECT *
FROM STUDENT FIRST
WHERE EXISTS (SELECT RATING 
              FROM UNIVERSITY SECOND 
              WHERE RATING>4 AND FIRST.UNIV_ID=SECOND.UNIV_ID)