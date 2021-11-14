#' Run tutorials
#'
#' The function asks you which tutorial to open and then runs it.
#'
#' @return Nothing. Used for its side effects.
#' @export
#'
#' @importFrom utils menu
#'
#' @examples
#' # run_tutorial()
run_tutorial <- function() {
  num <- utils::menu(
    tutorials,
    title = "Which tutorial shall I run?"
  )

  learnr::run_tutorial(tutorials[num], package = "intRo")
}

tutorials <- c(
  "02_r_basics",
  "03_plotting",
  "04_import_data",
  "06_tidy",
  "07_advanced"
)
