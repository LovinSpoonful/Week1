

# 1. Write a loop that calculates 12-factorial.

x <- 1
for (i in 1:12)
{
  x <- x*i
}
print(x)



# 2. Show how to create a numeric vector that contains the sequence from 20 to 50 by 5.

a <- seq(from = 20, to = 50, by = 5)
print(a)



# 3. Show how to take a trio of input numbers a, b, and c and implement the quadratic equation.

# From: https://rstudio-pubs-static.s3.amazonaws.com/46122_3840087773cd4f5a8629ef0228ab152a.html
# We are solving for x = 0, or "the quadratic must be zero":

# -b +- sqrt(b^2 - 4ac)
# ----------------------  = 0
#         2a

# this formula has two possible solutions due to the +- sign preceding the square root calculation


a <- 1
b <- -7
c <- 4

x1 <- (-1 * b + (( b ^ 2 - (4 * a * c))^.5)) / (2 * a)
x2 <- (-1 * b - (( b ^ 2 - (4 * a * c))^.5)) / (2 * a)
print(c(x1, x2))




