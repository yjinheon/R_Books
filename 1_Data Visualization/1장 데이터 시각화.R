#1.1 들어가기

quote<- "간단한 그래프는 데이터 분석가에게 다른 어떤 것보다도 많은 정보를 제공한다."

#1.1.1 준비하기_타이디버스 로드하기
install.packages("tidyverse")
library(tidyverse)
library(ggplot2)

#1.2 첫단계

#1.2.1 mpg 데이터 프레임
데이터 프레임은 변수들(열)과 관측값(행)의 직사각형 모음이다

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

#국소회귀는 말그대로 국소적으로 회귀를 수행한다는 알고리즘으로 전체적으로 모든 데이터를 적합하지 않는 기법이다. 따라서, 최근 데이터가 중요할 경우에 사용하여 최근데이터에 웨이트를 높여서 중요도를 높여서 적합을 할 수 있다. 뿐만아니라, 가중치가 0인 데이터들(목표점에서 먼 데이터들)은 의미를 잃어버리므로, 계산상의 부담도 줄일 수 있다는 장점이 있다. 어떻게 해서 근처의 데이터들을 수집하는지가 관건이고, 그 범위는 s에 의해서 결정되니 이 부분을 어떻게 하면 잘 선택할 수 있을지 생각해봐야 하고, 이것은 교차검증을 통해서 이루어진다고 하니 참고하길!!!

p_practice # 멋지다!


ggplot(data=mpg,aes(displ,hwy))+
  geom_point(aes(size=class)) # 이런 식으로 하면 경고가 뜨는 데 순서형이 아닌 변수룰 순서형 심미성 변수로 매핑하는 것은 바람직 하지 않기 때문이다.

#투명도 제어하기 
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,alpha=class))

#shape 제어하기
ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ,y=hwy,shape=class))

# geom_aesthetic의 속성을 수동으로 설정하기
ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ,y=hwy),color="blue") # point를 blue로 하라는 것

#1.3.1 연습문제 

1. 코드가 파란색이 아닌 이유는 "blue"가 일종의 컬러 범주로 심미성 매핑에 포함되어서이다.
2. 연속형 변수를 여러방식으로 매핑하기

library(ggplot2)
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,color=class)) # 컬러로 매핑


library(ggplot2)
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,size=class)) # 크기로 매핑
#범주형 변수를 사이즈로 매핑하는 것은 권장되지 않는다.


library(ggplot2)
ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy,shape=class))# 모양으로 매핑

#3. stroke 심미성의 역할이 무엇인가?
# stroke는 모양의 경계선의 두께를 결정한다.
#Stroke changes the size of the border for shapes (21-25). These are filled shapes in which the color and size of the border can differ from that of the filled interior of the shape.

# 예를들면 이런 느낌이다.
ggplot(mtcars, aes(wt, mpg)) +
  geom_point(shape = 21, colour = "black", fill = "white", size = 5, stroke = 5)


# 6.심미성을 변수 이름이 아닌 것에 매핑할 경우

ggplot(data = mpg)+
  geom_point(
    mapping = aes(x=displ,y=hwy,color=displ<5)
  )

#1.4 자주일어나는 문제들 
#  프로그래밍를 하다보명 온갖 개같은 문제들이 매일 하루도 빠지지 않고 일어난다.


#1.5 facet 플롯을 면분할 하기

# * facet_wrap()에 전달하는 변수는 이산형이어야 한다.

ggplot(data = mpg)+
  geom_point(mapping=aes(displ,hwy))+
  facet_wrap(~class,nrow = 2) # class별로 나눠서 계산하기기

ggplot(data = mpg)+
  geom_point(mapping = aes(displ,hwy))+
  facet_grid(drv~cyl) # 플롯을 두 변수 조합으로 면분할하기


ggplot(data = mpg)+
  geom_point(mapping = aes(displ,hwy))+
  facet_grid(.~cyl) # 기본적으로 뒤에 있는게 열분할 

ggplot(data = mpg)+
  geom_point(mapping = aes(displ,hwy))+
  facet_grid(cyl~.) # 앞에 넣으면 행분할 


#1.6 기하객체 (geom)

#geom은 데이터를 나타내기 위해 플롯이 사용하는 기하객체를 의미한다 . 사람들은 플롯이 사용하는 지옴의 유형으로 플롯을 기술한다.

#해보자


ggplot(data = mpg)+
  geom_point(mapping = aes(x=displ,y=hwy)) # 기본 그래프

ggplot(data = mpg)+
  geom_smooth(mapping = aes(x=displ,y=hwy)) # 평활선을 그려주는 그래프

ggplot(data = mpg)+
  geom_smooth(mapping = aes(x=displ,y=hwy,linetype=drv)) # 평활선을 그려주는 그래프


# 위의 두개를 겹쳐서 그린 다음에 색을 넣어보자 


ggplot(data = mpg)+
  geom_point(mapping=aes(x=displ,y=hwy,shape=drv,color=drv))+
  geom_smooth(mapping=aes(x=displ,y=hwy,linetype=drv,color=drv))


##################################################################
ggplot(data=mpg)+
  geom_smooth(
    mapping=aes(x=displ,y=hwy,color=drv),
    show.legend = FALSE
  ) 

# 같은 플롯에 여러 지옴을 표시하기

ggplot(data=mpg)+
  geom_point(mapping = aes(displ,hwy))+
  geom_smooth(mapping = aes(displ,hwy))


# 매핑 집합을 ggplot으로 전달하기 -> 매핑을 전역매핑으로 설정
# 이 경우 ggplot2는 매핑들을 전역매핑으로 처리하여 그래프의 각 지옴에 전달한다.
ggplot(data = mpg,mapping = aes(displ,hwy))+
  geom_point()+
  geom_smooth()

# 매칭을 전역 매핑이 아닌 지옴함수마다 처리하는 것으로 할 경우 









