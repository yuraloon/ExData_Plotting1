## Plot 2
plot2 <- function() {
  plot(df$timestamp,df$Global_active_power, type = "l", xlab ="time", ylab = "Kilowatts of Active Power")
  
  dev.copy(png, file = "plot2.png", width = 480, height = 480)
  dev.off()
  

}

plot2()  

## Print location of file with plot2
    cat("plot2.png has been saved in" getwd())
