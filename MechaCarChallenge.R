library(dplyr)
mechaCar_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechaCar_table)
summary(model)

suspencion_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
total_summary <- suspencion_table %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
lot_summary <- suspencion_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

t.test(suspencion_table$PSI, mu=1500)
t.test(subset(suspencion_table, Manufacturing_Lot=='Lot1')$PSI, mu=1500)
t.test(subset(suspencion_table, Manufacturing_Lot=='Lot2')$PSI, mu=1500)
t.test(subset(suspencion_table, Manufacturing_Lot=='Lot3')$PSI, mu=1500)