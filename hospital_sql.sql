select * from patients


1.-- Retrieve all patient records from the dataset.
          select * from patients
		  
2.-- Find all patients who are above 60 years of age.
         select * from patients where age>60

		 
3.-- Count the total number of patients in the database.

	 select count(patient_id) from patients

4.-- List all unique services recorded in the dataset.
       select distinct service from patients
     
5.-- Display patients sorted by their admission date (latest first).

    select * from patients order by arrival_date desc ;

	
6.-- Find the number of patients for each services.

   select service,count(patient_id) from patients group by service;
     

7.-- Retrieve details of patients Julia Torres.

  select * from patients where name = 'Julia Torres'

8.-- Find patients whose discharge date is NULL (still admitted).
   select patient_id from patients where departure_date is null;

   
9.-- Calculate the average age of patients.
select round(avg(age),2) as avg_age from patients

10.-- Find the top 3 patients among durations.

 with cte as
 (select *, dense_rank() over(partition by service order by durations desc) as rnk from patients)
 select patient_id,name,age,service,durations,rnk from cte 
 where rnk <=3;


--note-
-- windows function can not collaspe the row and do not have chance to lass of row data and it allows morw than 1 columns in group
-- and agg. function is use to group the rows in a columns , it only group only one column and it collaspe the row and loss of row data is high
