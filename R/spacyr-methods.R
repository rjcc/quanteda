###
### Methods to extend the "spacyr" package, by defining methods for 
### spacy_parsed objects
###

#' Extensions for and from spacy_parse objects
#' 
#' These functions provide \pkg{quanteda} methods for \pkg{spacyr} objects, and
#' also extend [spacy_parse][spacyr::spacy_parse] to work with [corpus] objects.
#' @name spacyr-methods
#' @importFrom spacyr spacy_parse
#' @section Usage:
#' `docnames(x)` returns the document names
#' 
#' `ndoc(x)` returns the number of documents
#' 
#' `ntoken(x, ...)` returns the number of tokens by document
#' 
#' `ntype(x, ...)` returns the number of types (unique tokens) by document
#' 
#' `spacy_parse(x, ...)` is also defined for a \pkg{quanteda} [corpus]
#' 
#' @param x an object returned by `spacy_parse`, or (for
#'   `spacy_parse`) a [corpus] object
#' @param ... unused except for `spacy_parse`, in which case it passes
#'   through extra arguments to that function
#' @examples 
#' \dontrun{
#' library("spacyr")
#' spacy_initialize()
#' 
#' txt <- c(doc1 = "And now, now, now for something completely different.",
#'          doc2 = "Jack and Jill are children.")
#' parsed <- spacy_parse(txt)
#' ntype(parsed)
#' ntoken(parsed)
#' ndoc(parsed)
#' docnames(parsed)
#' 
#' corpus_subset(data_corpus_inaugural, Year <= 1793) %>% spacy_parse()
#' }
NULL

#' @rdname spacyr-methods
#' @details
#' `docnames` returns the document names
#' 
#' @noRd
#' @export
docnames.spacyr_parsed <- function(x) {
    unique(x$doc_id)
}


#' @rdname spacyr-methods
#' @details
#' `ndoc` returns the number of documents
#' 
#' @noRd
#' @export
ndoc.spacyr_parsed <- function(x) {
    length(docnames(x))
}

#' @rdname spacyr-methods
#' @details
#' `ntoken` returns the number of tokens by document
#' 
#' @noRd
#' @export
ntoken.spacyr_parsed <- function(x, ...) {
    lengths(split(x$token, x$doc_id))
}

#' @rdname spacyr-methods
#' @details
#' `ntype` returns the number of types (unique tokens) by document
#' 
#' @noRd
#' @export
ntype.spacyr_parsed <- function(x, ...) {
    vapply(split(x$token, x$doc_id), function(y) length(unique(y)), integer(1))
}

#' @rdname spacyr-methods
#' @details
#' `nsentence` returns the number of sentences by document
#' 
#' @noRd
#' @export
nsentence.spacyr_parsed <- function(x, ...) {
    sapply(split(x, x$doc_id), function(y) length(unique(y$sentence_id)))
}

#' @export
spacyr::spacy_parse

#' @rdname spacyr-methods
#' @importFrom spacyr spacy_parse
#' @export
spacy_parse.corpus <- function(x, ...) spacy_parse(texts(x), ...)


