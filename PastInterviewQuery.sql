create table ##move(
Name varchar(50) NULL,
Moving_Date datetime NULL
)

Insert into ##move
Values
('john', '01/01/2020'),
('Andrea', '12/01/2019'),
('Carlos', '11/01/2019'),
('Fernando', '01/02/2020'),
('Thomas', '01/03/2020')


select *, convert (varchar(6), Moving_Date, 112) as datepart 
from ##move
where convert (varchar(6), Moving_Date, 112) = (select MAX(convert (varchar(6), Moving_Date, 112)) from ##move)
