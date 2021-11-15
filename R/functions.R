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
intro_tutorial <- function() {
  num <- utils::menu(
    sessions,
    title = "Which tutorial shall I run?"
  )

  if (num %in% c(1, 5)) {
    cat("Just kidding! There is no tutorial for this session. Try a different one.")
  } else {
    learnr::run_tutorial(tutorials[num], package = "intRo")
  }

}

tutorials <- c(
  "01_introduction",
  "02_r_basics",
  "03_plotting",
  "04_import_data",
  "05_research_manage",
  "06_tidy",
  "07_advanced"
)

sessions <- c(
  "01 - Introduction",
  "02 - R basics",
  "03 - Plot with ggplot2",
  "04 - Import and transform data",
  "05 - Research data analysis",
  "06 - Tidy data",
  "07 - Advanced skills"
)
