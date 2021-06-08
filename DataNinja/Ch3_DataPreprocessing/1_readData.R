boston <- read.table("data/housing.csv")
boston

names(boston) <- c('crim','zn','indus','chas','nox','rm','age','dis',
                   'rad','tax','ptratio','black','lstat','medv')
dplyr::glimpse(boston)
