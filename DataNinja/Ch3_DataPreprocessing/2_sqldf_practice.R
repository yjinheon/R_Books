# R에서 SQL연습하기
install.packages("sqldf")
library(sqldf)

sqldf("select * from iris limit 10")

sqldf("select count(*) from iris")

sqldf("select Species, count(*), avg('Sepal.Length') 
      from iris
      group by Species ")
