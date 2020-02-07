#1.1 들어가기

quote<- "간단한 그래프는 데이터 분석가에게 다른 어떤 것보다도 많은 정보를 제공한다."

#1.1.1 준비하기_타이디버스 로드하기
library(tidyverse)
library(ggplot2)

#1.2 첫단계

#1.2.1 mpg 데이터 프레임
#데이터 프레임은 변수들(열)과 관측값(행)의 직사각형 모음이다

#1.2.2 ggplot 생성하기
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))
#엔진크기가 클 수록 연비가 낮게 나타난다.

?mpg
# displ : engine displacement, 엔진크기
# hwy : highway miles per gallon, 고속도로에서의 자동차 연비


#1.2.3 그래프 작성 템플릿


#1.2.4 연습문제 
#1~5

ggplot(data = mpg)+
  geom_point(mapping = aes(x=hwy,y=cyl))

ggplot(data = mpg)+
  geom_point(mapping = aes(x=class,y=cyl))

#1.3 심미성 매핑

quote2 <- "그래프의 가장 큰 가치는 전혀 예상하지 못한 것을 보여줄 때이다."

p_practice <- ggplot(data = mpg,mapping = aes(x=displ,y=hwy))+
  geom_point(aes(color=class))+ # 컬러 만 class별로 확인하기
  geom_smooth(method = "loess") # 평활선 그리기 
#loess 옵션은 국소회귀 평활선을 그리는 옵션으로 중요하니까 기억해둘 것

p_practice # 멋지다!


ggplot(data=mpg,aes(displ,hwy))+
  geom_point(aes(size=class)) # 이런 식으로 하면 경고가 뜨는 데 순서형이 아닌 변수룰 순서형 심미성 변수로 매핑하는 것은 바람직 하지 않기 때문이다.

