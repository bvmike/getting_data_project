I. Transformation Steps

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

II. Tidy data set variables

The resulting tidy data set contains:

- subjectid. numeric 1:30
- activityname. descriptive activity name

	1.LAYING
	2.SITTING
	3.STANDING
	4.WALKING
	5.WALKING_DOWNSTAIRS
	6.WALKING_UPSTAIRS  

- 66 measuremens related to average mean and standard deviation by subject and activity

	a. the measurements related to acceleration unit is standard gravity g unit
	b. the measurements related to angular velocity unit is radians/second

[1]  "subjectid"                             "activityname"                         
 [3] "tbodyaccelerationmeanx"                "tbodyaccelerationmeany"               
 [5] "tbodyaccelerationmeanz"                "tbodyaccelerationstdx"                
 [7] "tbodyaccelerationstdy"                 "tbodyaccelerationstdz"                
 [9] "tgravityaccelerationmeanx"             "tgravityaccelerationmeany"            
[11] "tgravityaccelerationmeanz"             "tgravityaccelerationstdx"             
[13] "tgravityaccelerationstdy"              "tgravityaccelerationstdz"             
[15] "tbodyaccelerationjerkmeanx"            "tbodyaccelerationjerkmeany"           
[17] "tbodyaccelerationjerkmeanz"            "tbodyaccelerationjerkstdx"            
[19] "tbodyaccelerationjerkstdy"             "tbodyaccelerationjerkstdz"            
[21] "tbodyangularvelocitymeanx"             "tbodyangularvelocitymeany"            
[23] "tbodyangularvelocitymeanz"             "tbodyangularvelocitystdx"             
[25] "tbodyangularvelocitystdy"              "tbodyangularvelocitystdz"             
[27] "tbodyangularvelocityjerkmeanx"         "tbodyangularvelocityjerkmeany"        
[29] "tbodyangularvelocityjerkmeanz"         "tbodyangularvelocityjerkstdx"         
[31] "tbodyangularvelocityjerkstdy"          "tbodyangularvelocityjerkstdz"         
[33] "tbodyaccelerationmagnitudemean"        "tbodyaccelerationmagnitudestd"        
[35] "tgravityaccelerationmagnitudemean"     "tgravityaccelerationmagnitudestd"     
[37] "tbodyaccelerationjerkmagnitudemean"    "tbodyaccelerationjerkmagnitudestd"    
[39] "tbodyangularvelocitymagnitudemean"     "tbodyangularvelocitymagnitudestd"     
[41] "tbodyangularvelocityjerkmagnitudemean" "tbodyangularvelocityjerkmagnitudestd" 
[43] "fbodyaccelerationmeanx"                "fbodyaccelerationmeany"               
[45] "fbodyaccelerationmeanz"                "fbodyaccelerationstdx"                
[47] "fbodyaccelerationstdy"                 "fbodyaccelerationstdz"                
[49] "fbodyaccelerationjerkmeanx"            "fbodyaccelerationjerkmeany"           
[51] "fbodyaccelerationjerkmeanz"            "fbodyaccelerationjerkstdx"            
[53] "fbodyaccelerationjerkstdy"             "fbodyaccelerationjerkstdz"            
[55] "fbodyangularvelocitymeanx"             "fbodyangularvelocitymeany"            
[57] "fbodyangularvelocitymeanz"             "fbodyangularvelocitystdx"             
[59] "fbodyangularvelocitystdy"              "fbodyangularvelocitystdz"             
[61] "fbodyaccelerationmagnitudemean"        "fbodyaccelerationmagnitudestd"        
[63] "fbodyaccelerationjerkmagnitudemean"    "fbodyaccelerationjerkmagnitudestd"    
[65] "fbodyangularvelocitymagnitudemean"     "fbodyangularvelocitymagnitudestd"     
[67] "fbodyangularvelocityjerkmagnitudemean" "fbodyangularvelocityjerkmagnitudestd" 


