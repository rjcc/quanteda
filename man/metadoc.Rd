% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/corpus.R
\name{metadoc}
\alias{metadoc}
\alias{metadoc<-}
\title{get or set document-level meta-data}
\usage{
metadoc(corp, field = NULL)

metadoc(corp, field = NULL) <- value
}
\arguments{
\item{corp}{A quanteda corpus object}

\item{field}{string containing the name of the metadata field(s) to be queried or set}

\item{value}{the new value of the new meta-data field}
}
\value{
For \code{texts}, a character vector of the texts in the corpus.

  For \code{texts <-}, the corpus with the updated texts.
}
\description{
Get or set the document-level meta-data, including reserved fields for
language and corpus.
}
\note{
Document-level meta-data names are preceded by an underscore character,
  such as \code{_encoding}, but when named in in the \code{field} argument,
  do \emph{not} need the underscore character.
}
\examples{
mycorp <- subset(inaugCorpus, Year>1990)
summary(mycorp, showmeta=TRUE)
metadoc(mycorp, "encoding") <- "UTF-8"
metadoc(mycorp)
metadoc(mycorp, "language") <- "english"
summary(mycorp, showmeta=TRUE)
}
