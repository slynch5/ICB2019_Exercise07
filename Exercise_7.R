## Exercise_7: Custom Functions in R

## Write a function that returns the odd (1,3,5,etc.) rows of any 
## dataframe passed as an argument

iris = read.csv("iris.csv", header = TRUE, sep = ",", quote = "") # Read in .csv file (Test file)

oddFunc <- function(dataFrame){
  oddOut <- dataFrame[(seq(from=1,to=nrow(iris),by=2)),]
  return(oddOut)
}

oddFunc(iris) # Odd rows of the dataframe passed to the oddFunc function; example uses 'iris' dataframe 


## Repeat a subset of last week's exercise, but write functions
## to accomplish these tasks.

# Return the number of observations for a given species included
# in the data set

speciesFunc <- function(species){
  output <- paste(species,nrow(iris[grep(species,iris$X.Species.),]))
  return(output)
}

speciesFunc("setosa") # Input of species name needs quotes around it for function to work 
speciesFunc("versicolor")
speciesFunc("virginica")

# Return a dataframe for flowers with Sepal.Width greater than
# a value specified by the function user

greaterWidth <- function(value){
  iris[which(iris$X.Sepal.Width. >= value, arr.ind = TRUE),]
}

greaterWidth(3.5) # Example of calling function and returning desired data for value = 3.5 


# Write the data for a given species to a comma-delimited file
# with the given species name as the file name; Hint: look at 
# paste() to add the .csv extension to your file.

createCSV <- function(species){
  species2 <- iris[grep(species,iris$X.Species.),1:5]
  file_name <- paste(species, '.csv', sep="")
  write.table(species2, file = file_name, sep = " ", quote = FALSE)
}

createCSV("setosa") # Calls function to create a .csv file for "setosa" data
createCSV("versicolor") # Calls function to create a .csv file for "versicolor" data
createCSV("virginica") # Calls function to create a .csv file for "virginica" data

