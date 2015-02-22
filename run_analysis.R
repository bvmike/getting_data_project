##load each data set into data frames.

activities.labels <- read.table("activity_labels.txt", header=FALSE)
names(activities.labels) <- c("id","type")

features <- read.table("features.txt", header=FALSE)
names(features) <- c("id", "name")

test.set <- read.table("test\\X_test.txt", header=FALSE)

test.labels <- read.table("test\\y_test.txt", header=FALSE, col.names=c("id")) 

test.subject <- read.table("test\\subject_test.txt", header=FALSE, col.names=c("id")) 

train.set <- read.table("train\\X_train.txt", header=FALSE)

train.labels <- read.table("train\\y_train.txt", header=FALSE, col.names=c("id")) 

train.subject <- read.table("train\\subject_train.txt", header=FALSE, col.names=c("id")) 

## assign variables names into data sets test.set and train.set usign names from
## features data frame.

names(test.set) <- features$name

names(train.set) <- features$name

## extract from data frames test.set and train.set only the relevant variables (colums)
## related to mean and standard deviation estimations.
## it also eliminate variables related to meanFrequency witch is not needed in
## the project requirements beeing not a mean estimation for the measurements.

test.set <- test.set[,grep("std|mean", names(test.set))]
test.set <- test.set[,-grep("meanF", names(test.set))]

train.set <- train.set[,grep("std|mean", names(train.set))]
train.set <- train.set[,-grep("meanF", names(train.set))]

## assign activities names in test.labels and train.labels data sets by joining
## them with activities.labels by id column.

test.labels <- merge(test.labels, activities.labels)

train.labels <- merge(train.labels, activities.labels)

## insert activities names in test and train sets using values from test and train
## lables data frames from above.

test.set$activityname <- test.labels$type

train.set$activityname <- train.labels$type

## insert subjects ids into test and train sets using values from test and train
## subject data frames.

test.set$subjectid <- test.subject$id

train.set$subjectid <- train.subject$id

## merge test and train data sets into one big data frame called merged.set
## using row binding witch will append one set rows to the other 

merged.set <- rbind(test.set, train.set)

## lower all variable names in the merged set

names(merged.set) <- tolower(names(merged.set))

## rename and fix variable names for easy reading. 

names(merged.set) <- gsub("-","", names(merged.set))

names(merged.set) <- sub("\\(","", names(merged.set))

names(merged.set) <- sub("\\)","", names(merged.set))

names(merged.set) <- sub("acc","acceleration", names(merged.set))

names(merged.set) <- sub("gyro","angularvelocity", names(merged.set))

names(merged.set) <- sub("mag","magnitude", names(merged.set))

names(merged.set) <- sub("bodybody","body", names(merged.set))

## create the tidy data set by calculating mean on each variable
## grouped by subject id and activity name. First group by and then use the 
## summarise_each function from the dplyr package with the mean argument.

library(dplyr)

tidy.set <- group_by(merged.set, subjectid, activityname)

tidy.set <- summarise_each(tidy.set, funs(mean))

## write the tidy data set into txt file

write.table(tidy.set, "tidy_set.txt")

### project done!
