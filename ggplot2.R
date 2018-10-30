options(scipen=999)
library(ggplot2)
credit = read.csv('https://raw.githubusercontent.com/mcanela-iese/DataSci_UM/master/Data/credit.csv')
credit <- credit[c(1:1000),]
data("midwest", package = "ggplot2") 


#scatter plot
ggplot(midwest, aes(x=area, y=poptotal)) + geom_point()
ggplot(credit, aes(x=limit_bal,y=pay_amt1))+geom_point()

#con linea de ajuste
ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method="lm")
ggplot(credit, aes(x=limit_bal,y=pay_amt1))+geom_point()+geom_smooth(method = "lm")

#saco intervalos de confianza
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method="lm", se=FALSE)

#quito observaciones del grafico
ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method="lm") + xlim(0, 0.1) + ylim(0, 1000000)
ggplot(credit, aes(x=limit_bal,y=pay_amt1))+geom_point()+geom_smooth(method = "lm")+xlim(0,600000)+ylim(0,50000)

#agrego titulo y etiquetas
g+labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")
g+ggtitle("Area Vs Population", subtitle="From midwest dataset") + xlab("Area") + ylab("Population")

#completa
ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point() + 
  geom_smooth(method="lm") + 
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")
#cambio colores
ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(col="#004B85", size=2, shape=1) +   # Set static color and size for points
  geom_smooth(method="lm", col="#00ADDC") +  # change the color of line
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")+
  theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                              panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))
