install.packages("Hmisc")
install.packages("Rmisc")

library(Hmisc)
library(Rmisc) # 

?summarySE

str(mtcars)

#summarySE로 그래프를 그리기 위한 요약통계량 데이터 프레임 만들기
#요약통계량을  만들어 두고 그래프를 그리는 것이 편하다.

summarySE(mtcars,measurevar = mtcars$displ)

tgs <- summarySE(ToothGrowth,measurevar = "len")


#Foundations of Statistics with R

install.packages("ISwR")

juul <- jull

juul$igf1 # 인슐린 성장인자 성장호르몬의 활동을 자극하며 인슐린과 비슷한 작용도 합니다.

ggplot(juul, aes(x = age,y = igf1, color = tanner)) + geom_point()

#이런 식으로 필터를 하는 것도 가능하다