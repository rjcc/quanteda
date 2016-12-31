# @rdname catm
# make temporary files and directories in a more reasonable way than tempfile()
# or tempdir(): here, the filename is different each time you call mktemp()
mktemp <- function(prefix='tmp.', base_path=NULL, directory=F) {
    #  Create a randomly-named temporary file or directory, sort of like
    #  https://www.mktemp.org/manual.html
    if (is.null(base_path))
        base_path <- tempdir()

    alphanumeric <- c(0:9, LETTERS, letters)

    filename <- paste0(sample(alphanumeric, 10, replace=T), collapse='')
    filename <- paste0(prefix, filename)
    filename <- file.path(base_path, filename)
    while (file.exists(filename) || dir.exists(filename)) {
        filename <- paste0(sample(alphanumeric, 10, replace=T), collapse='')
        filename <- paste0(prefix, filename)
        filename <- file.path(base_path, filename)
    }

    if (directory) {
        dir.create(filename)
    }
    else {
        file.create(filename)
    }

    return(filename)
}


# @rdname catm
# messages() with some of the same syntax as cat(): takes a sep argument and
# does not append a newline by default
catm <- function(..., sep = " ", appendLF = F) {
    message(paste(..., sep = sep), appendLF = appendLF)
}

##
## reassign the slots to an S4 dfm-like object
## necessary when some operation from the Matrix class obliterates them
## Ken B
reassign_slots <- function(x_new, x_orig, exceptions = NULL) {
    snames <- slotNames(x_orig)
    snames <- snames[!snames %in% 
                         c("Dim", "Dimnames", "i", "p", "x", "factors", exceptions)]
    for (s in snames) {
        slot(x_new, s) <- slot(x_orig, s)
    }
    x_new
}

#' copy the attributes from one S3 object to another
#' 
#' Copy the attributes from one S3 object to another.  Necessary when some
#' operation defined for the base class obliterates them.
#' @param x_new the object to which the attributes will be copied
#' @param x_orig the object from which the attributes will be copied, or a list
#'   of attrbiutes if \code{attr_only = TRUE}
#' @param exception a character vector of attribute names NOT to be copied
#' @param attr_only logical; if \code{TRUE}, then \code{x_orig} is a list of
#'   attributes rather than an object with attributes.
#' @keywords internal
#' @author Ken Benoit
reassign_attributes <- function(x_new, x_orig, exceptions = NULL, attr_only = FALSE) {
    if (!attr_only) { 
        attrs_orig <- attributes(x_orig)
    } else {
        attrs_orig <- x_orig
    }
    for (a in names(attrs_orig)) {
        if (!a %in% exceptions) {
            attr(x_new, a) <- attrs_orig[[a]]
        }
    }
    x_new
}

# This function generates random texts from English alphabets or any other characters.

# @param n_doc the number of documents generated
# @param n_word the number of words in documents
# @param len_word the size of longest words
# @param n_type the number of tyeps of tokens appear in the documents
# @param fast if true, words are generated from uniform random distribution over characters to speed up
# @param code if true, the function return R code instead of vector
# @param seed a integer passed to set.seed() to generate replicable random texts 
# @param characters a vector of letters for random word generation
#
# texts_random(5, 20, seed=1234)
# texts_random(5, 20, seed=1234, code=TRUE)
# texts_random(5, 20, seed=1234, fast=TRUE)
# 
# texts_random(5, 10, seed=1234, characters = LETTERS)

texts_random <- function(n_doc=10, 
                         n_word=100, 
                         len_word=5, 
                         n_type=1000, 
                         fast=FALSE, 
                         code=FALSE,
                         seed, characters){
    
    if(!missing(seed)) set.seed(seed)
    if(missing(characters)){
        # Empirical distribution in English (https://en.wikipedia.org/wiki/Letter_frequency)
        chars <- letters
        prob_chars <-c(0.08167, 0.01492, 0.02782, 0.04253, 0.12702, 0.02228, 0.02015, 
                       0.06094, 0.06966, 0.00153, 0.00772, 0.04025, 0.02406, 0.06749,
                       0.07507, 0.01929, 0.00095, 0.05987, 0.06327, 0.09056, 0.02758, 
                       0.00978, 0.02360, 0.00150, 0.01974, 0.00074)
    }else{
        # Log-normal distribution
        chars <- characters
        dist_chars <- stats::rlnorm(length(chars))
        prob_chars <- sort(dist_chars / sum(dist_chars), decreasing = TRUE)
    }
    if(n_type > length(chars) ^ len_word) 
        stop('n_type is too large')
    
    # Generate unique types
    type <- c()
    if(fast){
        pat <- stri_flatten(c('[', chars, ']'))
        while(n_type > length(type)){
            type <- unique(c(type, stri_rand_strings(n_type, 1:len_word, pat)))
        }
    }else{
        while(n_type > length(type)){
            type <- unique(c(type, word_random(chars, sample(len_word, 1), prob_chars)))
        }
    }
    type <- head(type, n_type)
    
    # Generate random text from the types
    texts <- c()
    prob_words <- zipf(n_type)
    texts <- replicate(n_doc, {
        words <- sample(type, size=n_word, replace = TRUE, prob=prob_words)
        stri_c(words, collapse = ' ')
    })
    if(code){
        return(code(texts))
    }else{
        return(texts)
    }
}

word_random <- function(chars, len_word, prob){
    stri_flatten(sample(chars, len_word, replace = TRUE, prob = prob)) 
}

zipf <- function(n_type){
    (1 / 1:n_type) / n_type
}

code <- function(texts){
    len <- length(texts)
    cat(paste0('txt <- c("', texts[1], '",\n'))
    for(text in texts[2:(len-1)]){
        cat(paste0('         "', text, '",\n'))
    }
    cat(paste0('         "', texts[len], '")\n'))
}

