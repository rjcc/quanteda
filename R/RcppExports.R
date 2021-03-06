# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

qatd_cpp_ca <- function(dfm, residual_floor) {
    .Call(`_quanteda_qatd_cpp_ca`, dfm, residual_floor)
}

qatd_cpp_collocations <- function(texts_, types_, words_ignore_, count_min, sizes_, method, smoothing) {
    .Call(`_quanteda_qatd_cpp_collocations`, texts_, types_, words_ignore_, count_min, sizes_, method, smoothing)
}

qatd_cpp_manhattan <- function(A, margin = 1L) {
    .Call(`_quanteda_qatd_cpp_manhattan`, A, margin)
}

qatd_cpp_manhattan2 <- function(A, B, margin = 1L) {
    .Call(`_quanteda_qatd_cpp_manhattan2`, A, B, margin)
}

qatd_cpp_maximum <- function(A, margin = 1L) {
    .Call(`_quanteda_qatd_cpp_maximum`, A, margin)
}

qatd_cpp_maximum2 <- function(A, B, margin = 1L) {
    .Call(`_quanteda_qatd_cpp_maximum2`, A, B, margin)
}

qatd_cpp_canberra <- function(A, margin = 1L) {
    .Call(`_quanteda_qatd_cpp_canberra`, A, margin)
}

qatd_cpp_canberra2 <- function(A, B, margin = 1L) {
    .Call(`_quanteda_qatd_cpp_canberra2`, A, B, margin)
}

qatd_cpp_minkowski <- function(A, margin = 1L, p = 2) {
    .Call(`_quanteda_qatd_cpp_minkowski`, A, margin, p)
}

qatd_cpp_minkowski2 <- function(A, B, margin = 1L, p = 2) {
    .Call(`_quanteda_qatd_cpp_minkowski2`, A, B, margin, p)
}

qatd_cpp_fcm <- function(texts_, n_types, weights_, boolean, ordered) {
    .Call(`_quanteda_qatd_cpp_fcm`, texts_, n_types, weights_, boolean, ordered)
}

qatd_cpp_kwic <- function(texts_, types_, words_, window, delim_) {
    .Call(`_quanteda_qatd_cpp_kwic`, texts_, types_, words_, window, delim_)
}

qatd_cpp_tokens_chunk <- function(texts_, types_, size, overlap) {
    .Call(`_quanteda_qatd_cpp_tokens_chunk`, texts_, types_, size, overlap)
}

qatd_cpp_tokens_compound <- function(texts_, compounds_, types_, delim_, join, window_left, window_right) {
    .Call(`_quanteda_qatd_cpp_tokens_compound`, texts_, compounds_, types_, delim_, join, window_left, window_right)
}

qatd_cpp_tokens_lookup <- function(texts_, types_, words_, keys_, overlap, nomatch) {
    .Call(`_quanteda_qatd_cpp_tokens_lookup`, texts_, types_, words_, keys_, overlap, nomatch)
}

qatd_cpp_tokens_ngrams <- function(texts_, types_, delim_, ns_, skips_) {
    .Call(`_quanteda_qatd_cpp_tokens_ngrams`, texts_, types_, delim_, ns_, skips_)
}

qatd_cpp_tokens_recompile <- function(texts_, types_, gap = TRUE, dup = TRUE) {
    .Call(`_quanteda_qatd_cpp_tokens_recompile`, texts_, types_, gap, dup)
}

qatd_cpp_tokens_replace <- function(texts_, types_, patterns_, replacements_) {
    .Call(`_quanteda_qatd_cpp_tokens_replace`, texts_, types_, patterns_, replacements_)
}

qatd_cpp_tokens_segment <- function(texts_, types_, patterns_, remove, position) {
    .Call(`_quanteda_qatd_cpp_tokens_segment`, texts_, types_, patterns_, remove, position)
}

qatd_cpp_tokens_select <- function(texts_, types_, words_, mode, padding, window_left, window_right, pos_from, pos_to) {
    .Call(`_quanteda_qatd_cpp_tokens_select`, texts_, types_, words_, mode, padding, window_left, window_right, pos_from, pos_to)
}

qatd_cpp_is_grouped_numeric <- function(values_, groups_) {
    .Call(`_quanteda_qatd_cpp_is_grouped_numeric`, values_, groups_)
}

qatd_cpp_is_grouped_character <- function(values_, groups_) {
    .Call(`_quanteda_qatd_cpp_is_grouped_character`, values_, groups_)
}

qatd_cpp_tbb_enabled <- function() {
    .Call(`_quanteda_qatd_cpp_tbb_enabled`)
}

qatd_cpp_is_overlap <- function(x1_, y1_, w1_, h1_, boxe_) {
    .Call(`_quanteda_qatd_cpp_is_overlap`, x1_, y1_, w1_, h1_, boxe_)
}

qatd_cpp_wordfish_dense <- function(wfm, dir, priors, tol, disp, dispfloor, abs_err) {
    .Call(`_quanteda_qatd_cpp_wordfish_dense`, wfm, dir, priors, tol, disp, dispfloor, abs_err)
}

qatd_cpp_wordfish <- function(wfm, dirvec, priorvec, tolvec, disptype, dispmin, ABS, svd_sparse, residual_floor) {
    .Call(`_quanteda_qatd_cpp_wordfish`, wfm, dirvec, priorvec, tolvec, disptype, dispmin, ABS, svd_sparse, residual_floor)
}

