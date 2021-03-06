context("test meta functions")

test_that("meta/meta<- works user data", {
    txt <- c(d1 = "a b c", d2 = "x y z")
    corp <- corpus(txt, docvars = data.frame(dv = 1:2))
    toks <- tokens(corp)
    dfmat <- dfm(toks)
    targetmeta3 <- list(usermeta1 = "test1", usermeta2 = "test2", usermeta3 = "test3")
    targetmeta2 <- list(usermeta1 = "test1", usermeta3 = "test3")
    
    meta(corp, "usermeta1") <- "test1"
    meta(corp)["usermeta2"] <- "test2"
    meta(corp)$usermeta3    <- "test3"
    expect_identical(meta(corp), targetmeta3)
    meta(corp)[2] <- NULL
    expect_identical(meta(corp), targetmeta2)

    meta(toks, "usermeta1") <- "test1"
    meta(toks)["usermeta2"] <- "test2"
    meta(toks)$usermeta3    <- "test3"
    expect_identical(meta(toks), targetmeta3)
    meta(toks)[2] <- NULL
    expect_identical(meta(toks), targetmeta2)
    
    meta(dfmat, "usermeta1") <- "test1"
    meta(dfmat)["usermeta2"] <- "test2"
    meta(dfmat)$usermeta3    <- "test3"
    expect_identical(meta(dfmat), targetmeta3)
    meta(dfmat)[2] <- NULL
    expect_identical(meta(dfmat), targetmeta2)
})

test_that("meta.default produces expected error", {
    expect_error(
        meta(NULL),
        "meta() only works on corpus, dfm, tokens objects",
        fixed = TRUE
    )
})

test_that("meta works correctly on pre-v2 objects", {
    load("../data/pre_v2_objects/data_corpus_pre2.rda")
    load("../data/pre_v2_objects/data_tokens_pre2.rda")
    load("../data/pre_v2_objects/data_dfm_pre2.rda")
    expect_identical(
        names(meta(data_corpus_pre2)),
        c("source", "notes", "created")
    )
    expect_null(meta(data_tokens_pre2))
    expect_null(meta(data_dfm_pre2))
})

test_that("meta<- works", {
    corp <- corpus(c("one", "two"))
    expect_error(
        meta(corp) <- "needs to be a list",
        "value must be a named list"
    )
    expect_error(
        meta(corp) <- list("needs to be named"),
        "every element of the meta list must be named"
    )
    
    meta(corp, "newmeta") <- "some meta info"
    expect_identical(
        meta(corp),
        list(newmeta = "some meta info")
    )
})

test_that("meta_system", {
    corp <- corpus(c("one", "two"))

    expect_error(
        quanteda:::meta_system(corp) <- "needs to be a list",
        "value must be a named list"
    )
    expect_error(
        quanteda:::meta_system(corp) <- list("needs to be named"),
        "every element of the meta list must be named"
    )
    
    namlist <- c("source", "package-version", "r-version", "system", 
                 "directory", "created") %in% names(quanteda:::meta_system(corp))
    expect_true(all(namlist))
    
    expect_identical(
        meta(corp, type = "system"),
        quanteda:::meta_system(corp)
    )
})

test_that("meta_system<-", {
    corp <- corpus(c("one", "two"))
    corp2 <- quanteda:::"meta_system<-.corpus"(corp, "source", "test-meta.R")
    expect_identical(quanteda:::meta_system(corp2, "source"), "test-meta.R")
    
    toks <- tokens(corp)
    toks2 <- quanteda:::"meta_system<-.tokens"(toks, "source", "test-meta.R")
    expect_identical(quanteda:::meta_system(toks2, "source"), "test-meta.R")
    
    dfmat <- dfm(toks)
    dfmat2 <- quanteda:::"meta_system<-.dfm"(dfmat, "source", "dfm test")
    expect_identical(quanteda:::meta_system(dfmat2, "source"), "dfm test")
})
