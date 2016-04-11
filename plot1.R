# Dear fellow student,
# 
# I am delighted to study in collaboration with you. Many thanks for reading and
# marking my work. 
#
# Best regards and best of luck with your studies.

# The following recommended coding standards are used in this code:
# 1) encoding = ASCII
# 2) indent = 4 spaces
# 3) width = 80 columns
# 4) length of function <= one page

# Reading the data
data2 <- read.table(file = "household_power_consumption.txt", header=TRUE, 
                    sep = ";", nrows = 1, as.is = TRUE)
data <- read.table(file = "household_power_consumption.txt", sep = ";", 
                   skip = 66637, nrows = 2880, as.is = TRUE)
names(data) <- names(data2)

# Converting the Date and Time variables to the class "POSIXlt"
data$Date <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
names(data)[1] <- "datetime"
data$Time <- NULL

# Creating the PNG file
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# Plotting the required data
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "red")

dev.off()