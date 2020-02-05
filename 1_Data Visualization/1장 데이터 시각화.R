#1.1 들어가기

quote<- "간단한 그래프는 데이터 분석가에게 다른 어떤 것보다도 많은 정보를 제공한다."

#1.1.1 준비하기_타이디버스 로드하기
library(tidyverse)

#1.2 첫단계

#1.2.1 mpg 데이터 프레임
#데이터 프레임은 변수들(열)과 관측값(행)의 직사각형 모음이다

mpg

#ggplot 생성하기
ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))

?mpg
# displ : engine displacement, 엔진크기
# hwy : highway miles per gallon, 고속도로에서의 자동차 연비

