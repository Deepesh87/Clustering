movie=read.table("data.txt",header=F,sep = "|",quote = "\"")
str(movie)
colnames(movie)=c("ID","Title","Release date","Video release date","IMDB","Unknown","Action","adventure","animation","children","comedy","crime","documentary","drama","fantasy","Filmnoir","horror","Musical","Mystery","Romance","Sci-fi","Thriller","war","western")
movie$ID=NULL
movie$`Release date`=NULL
movie$`Video release date`=NULL
movie$IMDB=NULL
movie=unique(movie)
write.csv(movie,"movie_cleaned.csv")

# Heirarcical Clustering

distances=dist(movie[2:20],method = "euclidean")

clusterMovies=hclust(distances,method = "ward.D2")

plot(clusterMovies) # to plot the dendrogram

summary(clusterMovies)
str(clusterMovies)

ClusterGroups=cutree(clusterMovies,k=10)


tapply(movie$Action,ClusterGroups,mean)

tapply(movie$Romance,ClusterGroups,mean)





