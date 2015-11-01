# quiz1 solution -- there are often many different for each problem
# I've left some "scaffolding" in place to show how I set up and/or verify my solutions

# 1.  Create a vector that contains 20 numbers. 
# (You may choose whatever numbers you like, 
# but make sure there are some duplicates.)

cintRob <- c(1:5,2:6,3:12) # declares and sets variable iVector (called a vector in r) to the values 1,2,3,4
cintRob



# 2. Use R to convert the vector from question 1 into a character vector.

csRob <- as.character(cintRob)
csRob



# 3.  Use R to convert the vector from question 1 into a vector of factors.   ONLY A FACTOR can have levels

cfacRob <- as.factor(cintRob)
cfacRob



# 4.  Use R to show how many levels the vector in the previous question has.

cfacRobLevels <- nlevels(cfacRob)
cfacRobLevels

# or
cfacRobDistinct <- length(unique(cfacRob))
cfacRobDistinct



#5 Use R to create a vector that takes the vector from 
# question 1 and performs on it the formula 3x^2 - 4x + 1

cintRobAccel <- 3 * cintRob^2 - 4 * cintRob + 1
cintRobAccel



#6. Create a named list. That is, create a list with several elements 
# that are each able to be referenced by name.

lstRobMovies <- list(Rank = c(5,9,13), Title = c("BladeRunner","Crouching Tiger","Bourne Identity"))  
lstRobMovies$Title[2]
lstRobMovies$Rank[2]



# 7. Create a data frame with four columns - one each as character, factor (with three levels), numeric, and date. 
#    Your data frame should have at least 10 observations (rows).

csWorkCenter <- c("Prep","Core","Mold","Pour","Shakeout","Grind","Machine","Assemble","Test","Ship")
csFactory <- as.character(c("Foundry","Foundry","Foundry","Foundry","Foundry", "Foundry", "Midrange","Midrange","Midrange","Midrange"))    
cdblWorkCenterCapacity <- as.numeric(c(6,20,24,8,2,24,60,40,20,8))
cdtStartDate <- as.Date(c("2015-11-2", "2015-11-3", "2015-11-6", "2015-11-9", "2015-11-10", "2015-11-11", "2015-11-12", "2015-11-16", "2015-11-19", "2015-11-20"))
dfProject <- data.frame(csFactory, csWorkCenter, cdblWorkCenterCapacity, cdtStartDate)
dfProject



# 8.  Illustrate how to add a row with a value for the factor column that isn't already in the list of levels.
# (Note: You do not need to accomplish this with a single line of code.)

dfNew <- data.frame(csFactory = "Midrange", csWorkCenter = "Export", cdblWorkCenterCapacity = 2, cdtStartDate = "2015-11-27")
dfNew$cdtStartDate <- as.Date(dfNew$cdtStartDate)
dfNew$csFactory <- as.character((dfNew$csFactory))

dfProject <- rbind(dfProject,dfNew)
dfProject



# 9.  Show the code that would read in a CSV file called temperatures.csv 
#      from the current working directory.

getwd()

df = read.table("temperatures.csv",header = TRUE,sep = ",")
df



#10.  Use a loop to calculate the final balance, rounded to the nearest cent, 
#      in an account that earns 3.24% interest compounded monthly after six years 
#      if the original balance is $1,500.

dblPeriodRate <- as.numeric(.0324/12)
dblBalance <- as.numeric(1500)
intPeriods <- as.numeric(72)

for (i in 1:intPeriods)
{
  dblBalance <- dblBalance * (1 + dblPeriodRate)
}
sprintf("%.2f", dblBalance) 

# with no loop

dblBalance <- as.numeric(1500)
intCompoundingPeriodsPerAnnum <- as.numeric(12)
dblAnnualInterestRate <- as.numeric(.0324)
intLoanTermYears <- as.numeric(6)
dblBalance <- dblBalance * (1 + (dblAnnualInterestRate/intCompoundingPeriodsPerAnnum)) ^ (intCompoundingPeriodsPerAnnum * intLoanTermYears)
dblBalance
sprintf("%.2f",dblBalance)



# 11.  Create a numeric vector of length 20 and 
# then write code to calculate the sum of every third element of the vector you have created.

a <- c(1:20)
b <- sum(a[seq(0,length(a),3)])   # http://stackoverflow.com/questions/12863637/for-loop-step-width
print(b)



# 12 Use a for loop to calculate sum of i = 1 to 10 of x^i  for the value x=2

x <- 2
sum <- 0
for (i in 1:10)
{
  sum <- sum + x^i
}
print(sum)



# 13.  Use a while loop to accomplish the same task as in the previous exercise.

x <- 2
sum <- 0
i <- 1

while (i <= 10)
{
  sum <- sum + x^i
  i <- i + 1
}
print(sum)


# 14.  Solve the problem from the previous two exercises without using a loop.

x <- 2
print(sum(x^(1:10)))













