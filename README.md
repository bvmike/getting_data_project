# getting_data_project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis.

The script run_analisys.R and following steps it will be execute only if it reside into working directory together with test and train sets as provided and required into project requirements.

1. Load all the data sets needed:	
	
	a. activity_labels (activities descriptive types)
	b. features (measurements/ variable descriptive names)
	c. X_test (test measurements)
	d. y_test (test activities numeric identificator)
	e. subject_test (test subjects numeric identificator)
	c. X_train (training measurements)
	d. y_train (training numeric identificator)
	e. subject_train (training subjects identificator)

2. Assign column names into activity_labels and features data sets:

	a. "id". numeric features identificator
	b. "name". descriptive character features identificator 

3. Name "id" the column name into y_test, subject_test, y_train, subject_train.

4. Assign variables names into data sets test.set and train.set usign names from features data set.

5. Extract from data sets test.set and train.set only the relevant variables (colums) related to mean and standard deviation estimations 
usign grep function and "std|mean" regular expresion.

6. Remove from data sets test.set and train.set colums related to mean Frequency measurement using -grep function and "meanF" regular expresion.

7. Assign activities names in test.labels and train.labels data sets by joining them with activities.labels data set by "id" column."

8. Insert activities names in test and train sets using values from test and train lables data frames from above.

9. Insert subjects id into test and train sets using values from test and train subject data frames.

10. Merge test and train data sets into one big data frame called merged.set using row binding witch will append one set rows to the other.

11. Lower all variable names in the merged set.

12. Rename and fix variable names for easy reading and for respecting tidy data requirements usign sub and gsub functions:

	a. remove "-" 
	b. remove "(" and ")"
	c. replace "acc" with "acceletation"
	d. replace "gyro" with "angularvelocity"
	e. replace "mag" with "magnitude"
	f. fix "bodybody" with "body"

13. Create the tidy data set by calculating mean on each variable grouped by subject id and activity name. 
First group by and then use the summarise_each function from the dplyr package with the mean argument.

14. Write the tidy data set into txt file.
