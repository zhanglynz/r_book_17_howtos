(x <- "  a   big space      problem   ")

# firstly remove leading and trailing spaces
(y <- trimws(x))

# secondly remove 'extra' spaces in between
# thanks to https://stackoverflow.com/questions/19128327/how-to-remove-extra-white-space-between-words-inside-a-character-vector-using
(z <- gsub("\\s+"," ", y))

