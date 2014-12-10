library("twitteR")
library("wordcloud")
library("tm")
library("ggplot2")
library(NLP)

#necessary step for Windows
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")

#keys

my.key <-"3QHNsstNWumHFauT2wunAtuah"
my.secret <-"6POYcwvo9eciT4G7TcEjzop04ryipdfpUwb4N1QyjjBxHvdEme"

cred <- OAuthFactory$new(consumerKey=my.key,
                         consumerSecret=my.secret,
                         requestURL='https://api.twitter.com/oauth/request_token',
                         accessURL='https://api.twitter.com/oauth/access_token',
                         authURL= 'https://api.twitter.com/oauth/authorize')

## save the credentials to your local drive
## on future uses of the script we will only need to load the .Rdata
## file and won't have to re-authorize your account.


cred$handshake(cainfo="cacert.pem")

save(cred, file="twitter_authentication.Rdata")

## check that authorization was successful

registerTwitterOAuth(cred)

