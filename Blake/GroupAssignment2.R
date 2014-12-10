library("twitteR")
library("wordcloud")
library("tm")
library("ggplot2")

my.key <-"z6w7oG17EVH2BQkb3bdOBDnvP"
my.secret <-"XnHS6MYnoSJTamxVpC8Yc9PZGjjRn3hrbtAgD5PARSiR12RWkL"

cred <- OAuthFactory$new(consumerKey=my.key,
                         consumerSecret=my.secret,
                         requestURL='https://api.twitter.com/oauth/request_token',
                         accessURL='https://api.twitter.com/oauth/access_token',
                         authURL= 'https://api.twitter.com/oauth/authorize')

## save the credentials to your local drive
## on future uses of the script you'll only need to load the .Rdata
## file and won't have to re-authorize your account.

save(cred, file="twitter_authentication.Rdata")


## load("twitter_authentication.Rdata")
cred$handshake()


###############################################################################
##
##   STOP
##
###############################################################################

## check that authorization was successful

registerTwitterOAuth(cred)

###############################################################################
##
##   STOP
##
###############################################################################

tweets3 <- searchTwitter("@oracle",n=200, lang="en", since='2014-12-03', until='2014-12-04')
tweets4 <- searchTwitter("@oracle",n=200, lang="en", since='2014-12-04', until='2014-12-05')
tweets5 <- searchTwitter("@oracle",n=200, lang="en", since='2014-12-05', until='2014-12-06')
tweets6 <- searchTwitter("@oracle",n=200, lang="en", since='2014-12-06', until='2014-12-07')
tweets7 <- searchTwitter("@oracle",n=200, lang="en", since='2014-12-07', until='2014-12-08')

###############################################################################
##
##   STOP
##
###############################################################################

length(tweets3)
length(tweets4)
length(tweets5)
length(tweets6)
length(tweets7)

###############################################################################
##
##   STOP
##
###############################################################################

## Now, we will extract the fields that we want

tweets.id3 <- sapply(tweets3, function(x3) x3$getId())
tweets.id4 <- sapply(tweets4, function(x4) x4$getId())
tweets.id5 <- sapply(tweets5, function(x5) x5$getId())
tweets.id6 <- sapply(tweets6, function(x6) x6$getId())
tweets.id7 <- sapply(tweets7, function(x7) x7$getId())

tweets.text3 <- sapply(tweets3, function(x3) x3$getText())
tweets.text4 <- sapply(tweets4, function(x4) x4$getText())
tweets.text5 <- sapply(tweets5, function(x5) x5$getText())
tweets.text6 <- sapply(tweets6, function(x6) x6$getText())
tweets.text7 <- sapply(tweets7, function(x7) x7$getText())

tweets.screenname3 <- sapply(tweets3, function(x3) x3$getScreenName())
tweets.screenname4 <- sapply(tweets4, function(x4) x4$getScreenName())
tweets.screenname5 <- sapply(tweets5, function(x5) x5$getScreenName())
tweets.screenname6 <- sapply(tweets6, function(x6) x6$getScreenName())
tweets.screenname7 <- sapply(tweets7, function(x7) x7$getScreenName())

tweets.isretweet3 <- sapply(tweets3, function(x3) x3$getIsRetweet())
tweets.isretweet4 <- sapply(tweets4, function(x4) x4$getIsRetweet())
tweets.isretweet5 <- sapply(tweets5, function(x5) x5$getIsRetweet())
tweets.isretweet6 <- sapply(tweets6, function(x6) x6$getIsRetweet())
tweets.isretweet7 <- sapply(tweets7, function(x7) x7$getIsRetweet())

tweets.retweeted3 <- sapply(tweets3, function(x3) x3$getRetweeted())
tweets.retweeted4 <- sapply(tweets4, function(x4) x4$getRetweeted())
tweets.retweeted5 <- sapply(tweets5, function(x5) x5$getRetweeted())
tweets.retweeted6 <- sapply(tweets6, function(x6) x6$getRetweeted())
tweets.retweeted7 <- sapply(tweets7, function(x7) x7$getRetweeted())

tweets.created3 <- sapply(tweets3, function(x3) x3$getCreated())
tweets.created4 <- sapply(tweets4, function(x4) x4$getCreated())
tweets.created5 <- sapply(tweets5, function(x5) x5$getCreated())
tweets.created6 <- sapply(tweets6, function(x6) x6$getCreated())
tweets.created7 <- sapply(tweets7, function(x7) x7$getCreated())

###############################################################################
##
##   STOP
##
###############################################################################

head(tweets3.text)
head(tweets4.text)
head(tweets5.text)
head(tweets6.text)
head(tweets7.text)

## Write data to file

df3 <- data.frame(tweets3.id, tweets.text3, tweets.screenname3, tweets.isretweet3, tweets.retweeted3, tweets.created3)
df4 <- data.frame(tweets4.id, tweets.text4, tweets.screenname4, tweets.isretweet4, tweets.retweeted4, tweets.created4)
df5 <- data.frame(tweets5.id, tweets.text5, tweets.screenname5, tweets.isretweet5, tweets.retweeted5, tweets.created5)
df6 <- data.frame(tweets6.id, tweets.text6, tweets.screenname6, tweets.isretweet6, tweets.retweeted6, tweets.created6)
df7 <- data.frame(tweets7.id, tweets.text7, tweets.screenname7, tweets.isretweet7, tweets.retweeted7, tweets.created7)

names(df3) <-c("id", "text", "screenname", "isretweet", "retweeted", "created")
names(df4) <-c("id", "text", "screenname", "isretweet", "retweeted", "created")
names(df5) <-c("id", "text", "screenname", "isretweet", "retweeted", "created")
names(df6) <-c("id", "text", "screenname", "isretweet", "retweeted", "created")
names(df7) <-c("id", "text", "screenname", "isretweet", "retweeted", "created")

write.table(df3, file = "Oracle3.txt", append = TRUE)
write.table(df4, file = "Oracle4.txt", append = TRUE)
write.table(df5, file = "Oracle5.txt", append = TRUE)
write.table(df6, file = "Oracle6.txt", append = TRUE)
write.table(df7, file = "Oracle7.txt", append = TRUE)

write.table(length(tweets3), file = "Oracle3Len.txt", append = TRUE)
write.table(length(tweets4), file = "Oracle4Len.txt", append = TRUE)
write.table(length(tweets5), file = "Oracle5Len.txt", append = TRUE)
write.table(length(tweets6), file = "Oracle6Len.txt", append = TRUE)
write.table(length(tweets7), file = "Oracle7Len.txt", append = TRUE)


###############################################################################
##
##   STOP
##
###############################################################################
## these are the files from ReggieNet
##load opinion lexicon
##from http://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html#lexicon
## the load path is relative to the working directory that is set above
pos <- scan("positive-words.txt",what="character",comment.char=";")
neg <- scan("negative-words.txt",what="character",comment.char=";")

## create corpus
## these functions from the tm package
tweets.corpus3 <- Corpus(VectorSource(tweets.text3))
tweets.corpus4 <- Corpus(VectorSource(tweets.text4))
tweets.corpus5 <- Corpus(VectorSource(tweets.text5))
tweets.corpus6 <- Corpus(VectorSource(tweets.text6))
tweets.corpus7 <- Corpus(VectorSource(tweets.text7))

###############################################################################
##
##   STOP
##
###############################################################################



## clean up
tweets.corpus3 <- tm_map(tweets.corpus3, tolower) 
tweets.corpus4 <- tm_map(tweets.corpus4, tolower)
tweets.corpus5 <- tm_map(tweets.corpus5, tolower)
tweets.corpus6 <- tm_map(tweets.corpus6, tolower)
tweets.corpus7 <- tm_map(tweets.corpus7, tolower)

tweets.corpus3 <- tm_map(tweets.corpus3, removePunctuation)
tweets.corpus4 <- tm_map(tweets.corpus4, removePunctuation)
tweets.corpus5 <- tm_map(tweets.corpus5, removePunctuation)
tweets.corpus6 <- tm_map(tweets.corpus6, removePunctuation)
tweets.corpus7 <- tm_map(tweets.corpus7, removePunctuation)

tweets.corpus3 <- tm_map(tweets.corpus3, function(x3) removeWords(x3,stopwords()))
tweets.corpus4 <- tm_map(tweets.corpus4, function(x4) removeWords(x4,stopwords()))
tweets.corpus5 <- tm_map(tweets.corpus5, function(x5) removeWords(x5,stopwords()))
tweets.corpus6 <- tm_map(tweets.corpus6, function(x6) removeWords(x6,stopwords()))
tweets.corpus7 <- tm_map(tweets.corpus7, function(x7) removeWords(x7,stopwords()))

## split the tweets in the corpus up into individual words
## lapply iterates over each element in the corpus
## and applies the strsplit function
## the splitting argument is the 3rd in the lapply function
## and is splitting on white space.
corpus.split3 <- lapply(tweets.corpus3,strsplit,"\\s+")
corpus.split4 <- lapply(tweets.corpus4,strsplit,"\\s+")
corpus.split5 <- lapply(tweets.corpus5,strsplit,"\\s+")
corpus.split6 <- lapply(tweets.corpus6,strsplit,"\\s+")
corpus.split7 <- lapply(tweets.corpus7,strsplit,"\\s+")

## find matches for the individual words in the two lexicons
## lapply again, x takes on an element in the corpus
## at each iteration
matches3 <- lapply(corpus.split3,function(x3) {
  match.pos3 <- match(x3[[1]],pos)
  match.neg3 <- match(x3[[1]],neg) 
  
  ## return the length of each match vector, non-na 
  list(length(which(!is.na(match.pos3))),length(which(!is.na(match.neg3))))
})

matches4 <- lapply(corpus.split4,function(x4) {
  match.pos4 <- match(x4[[1]],pos)
  match.neg4 <- match(x4[[1]],neg) 
  
  ## return the length of each match vector, non-na 
  list(length(which(!is.na(match.pos4))),length(which(!is.na(match.neg4))))
})

matches5 <- lapply(corpus.split5,function(x5) {
  match.pos5 <- match(x5[[1]],pos)
  match.neg5 <- match(x5[[1]],neg) 
  
  ## return the length of each match vector, non-na 
  list(length(which(!is.na(match.pos5))),length(which(!is.na(match.neg5))))
})

matches6 <- lapply(corpus.split6,function(x6) {
  match.pos6 <- match(x6[[1]],pos)
  match.neg6 <- match(x6[[1]],neg) 
  
  ## return the length of each match vector, non-na 
  list(length(which(!is.na(match.pos6))),length(which(!is.na(match.neg6))))
})

matches7 <- lapply(corpus.split7,function(x7) {
  match.pos7 <- match(x7[[1]],pos)
  match.neg7 <- match(x7[[1]],neg) 
  
  ## return the length of each match vector, non-na 
  list(length(which(!is.na(match.pos7))),length(which(!is.na(match.neg7))))
})
###############################################################################

## turn the matches into a matrix
## one column for positive, one for negative
match.matrix3 <- matrix(unlist(matches3),nrow=length(matches3),ncol=2,byrow=T)
match.matrix4 <- matrix(unlist(matches4),nrow=length(matches4),ncol=2,byrow=T)
match.matrix5 <- matrix(unlist(matches5),nrow=length(matches5),ncol=2,byrow=T)
match.matrix6 <- matrix(unlist(matches6),nrow=length(matches6),ncol=2,byrow=T)
match.matrix7 <- matrix(unlist(matches7),nrow=length(matches7),ncol=2,byrow=T)

## calculate a simple sentiment score by substracting
## positive count from negative count
simple.sentiment3 <- match.matrix3[,1] - match.matrix3[,2]
simple.sentiment4 <- match.matrix4[,1] - match.matrix4[,2]
simple.sentiment5 <- match.matrix5[,1] - match.matrix5[,2]
simple.sentiment6 <- match.matrix6[,1] - match.matrix6[,2]
simple.sentiment7 <- match.matrix7[,1] - match.matrix7[,2]

## histogram of sentiment
pdf("Oracle3rd.pdf")
hist(simple.sentiment3)
dev.off()

pdf("Oracle4th.pdf")
hist(simple.sentiment4)
dev.off()

pdf("Oracle5th.pdf")
hist(simple.sentiment5)
dev.off()

pdf("Oracle6th.pdf")
hist(simple.sentiment6)
dev.off()

pdf("Oracle7th.pdf")
hist(simple.sentiment7)
dev.off()

###############################################################################
##
##   STOP
##
###############################################################################

#Postive
sum(match.matrix3[,1])
sum(match.matrix4[,1])
sum(match.matrix5[,1])
sum(match.matrix6[,1])
sum(match.matrix7[,1])
#Negative
sum(match.matrix3[,2])
sum(match.matrix4[,2])
sum(match.matrix5[,2])
sum(match.matrix6[,2])
sum(match.matrix7[,2])
#Total
sum(simple.sentiment3)
sum(simple.sentiment4)
sum(simple.sentiment5)
sum(simple.sentiment6)
sum(simple.sentiment7)
