setwd("D:/PSMC/Combined_Plot")
library("ggpubr")

plot(1,1,
     ylim=c(0,60),xlim=c(2,600),
     log="x",type="n",
     main="",ylab="Effective Population Size (10^4)",xlab="Years ago 10^3")


for(i in 0:100) {
  path<-paste0("JO/JO1_aut-8c-combined.",i,".txt")
  boot.iter<-read.table(path)
  ya<-boot.iter[-1,1]
  ya.pl=ya[which(ya>4999)]
  ne<-boot.iter[-1,2]
  ne.pl=ne[which(ya>4999)]
  lines((ya/1000),ne,xlog=T,type="l",col="pink",lwd=0.8,ylim=c(0,50))
}


for(i in 0:100) {
  path<-paste0("SO/SOT_aut-8c-combined.",i,".txt")
  boot.iter<-read.table(path)
  ya<-boot.iter2[-1,1]
  ya.pl=ya[which(ya>4999)]
  ne<-boot.iter[-1,2]
  ne.pl2=ne[which(ya>4999)]
  lines((ya/1000),ne,xlog=T,type="l",col="maroon",lwd=0.8,ylim=c(0,50))
}



for(i in 0:100) {
  path<-paste0("FO/FO_100x_combined.",i,".txt")
  boot.iter<-read.table(path)
  ya<-boot.iter[-1,1]
  ya.pl=ya[which(ya>4999)]
  ne<-boot.iter[-1,2]
  ne.pl=ne[which(ya>4999)]
  lines((ya/1000),ne,xlog=T,type="l",col="lightgreen",lwd=0.8,ylim=c(0,50))
}


abline(v=c(6,22,120), col="grey")
text(119.85,58.18514,"LIG",cex=0.7) 
text(21.63997,58.18514,"LGM",cex=0.7)
text(5.928641,58.18514,"MDH",cex=0.7)


legend(117, 57, legend=c("Forest Owlet", "Jungle Owlet", "Spotted Owlet"),
       col=c("lightgreen", "pink", "maroon"), lty=1, cex=0.7, box.lty=0)

jo = read.table("JO/JO1_aut-8c-combined.0.txt")
jo.ya=jo[-1,1]
jo.ne=jo[-1,2]

fo = read.table("FO/FO_100x_combined.0.txt")
fo.ya=fo[-1,1]
fo.ne=fo[-1,2]

so = read.table("SO/SOT_aut-8c-combined.0.txt")
so.ya=so[-1,1]
so.ne=so[-1,2]

lines(x=(jo.ya/1000),y=jo.ne,type="l",col="black",lwd=2)
lines(x=(fo.ya/1000),y=fo.ne,type="l",col="black",lwd=2)
lines(x=(so.ya/1000),y=so.ne,type="l",col="black",lwd=2)
      

