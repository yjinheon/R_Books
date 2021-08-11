library(tidyverse)

ggplot(data=mpg)+
	geom_point(mapping=aes(x=displ, y=hwy))

filter(mpg,cyl==8)
filter(diamond, carat >3)

