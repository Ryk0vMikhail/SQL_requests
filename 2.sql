#В таблице fine увеличить в два раза сумму неоплаченных штрафов только для тех водителей, которые на одной машине нарушили одно и то же правило   два и более раз.

CREATE TABLE in_fine AS
SELECT 
    name,
    number_plate,
    violation
FROM fine
GROUP BY name, number_plate, violation
having count(violation) > 1;

UPDATE fine, in_fine
SET fine.sum_fine = fine.sum_fine * 2
WHERE fine.name = in_fine.name and fine.number_plate = in_fine.number_plate and fine.violation = in_fine.violation and fine.date_payment IS NULL;

SELECT * FROM fine;
