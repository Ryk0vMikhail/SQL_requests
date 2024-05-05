UPDATE fine, payment
SET fine.date_payment = payment.date_payment,
    fine.sum_fine = if(DATEDIFF(payment.date_payment, payment.date_violation) > 20, fine.sum_fine, fine.sum_fine / 2)
WHERE fine.name = payment.name and fine.number_plate = payment.number_plate
      and fine.violation = payment.violation and fine.date_violation = payment.date_violation;

SELECT * FROM fine;
