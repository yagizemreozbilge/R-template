#' Create new project scaffolding
#'
#' Create all the scaffolding for a new project in a new directory. The scaffolding includes
#' a README file, different folders to hold raw data, analyses, etc, and optionally also
#' \code{testthat} infrastructure. Also, optionally, set a private or public GitHub repo with
#' continuous integration (Travis-CI, GitHub Actions...).
#'
#' @param name Character. Name of the new project. A new folder will be created with that name.
#' @param path Character. Path where the new project should be created (default is the current working directory).
#' @param package Logical. Create package structure or a simple project?
#' @param github Logical. Create GitHub repository? Requires Git + GITHUB_PAT.
#' @param private.repo Logical. Default is TRUE.
#' @param ci Character. Continuous integration type. One of "none", "travis", "circle", "appveyor", "gh-actions".
#' @param makefile Logical. If TRUE, adds a template \code{makefile.R} to the project.
#' @param pipe Logical. Use magrittr's pipe in your package?
#' @param testthat Logical. Add testthat infrastructure?
#' @param verbose Logical. Verbose output during creation.
#' @param open.project Logical. If TRUE (default), opens new RStudio project in a new session.
#'
#' @return A new directory with R package structure, slightly modified.
#' @details If \code{github = TRUE}, you'll be asked if you want to commit files.
#' @examples
#' \dontrun{
#' new_project("myproject")
#' new_project("myproject", github = TRUE, private.repo = TRUE)
#' }
#' @export
new_project <- function(
    name,
    path = ".",
    package = TRUE,
    github = FALSE,
    private.repo = TRUE,
    ci = "none",
    makefile = TRUE,
    pipe = TRUE,
    testthat = FALSE,
    verbose = FALSE,
    open.project = TRUE
) {
  if (missing(name) || !nzchar(name)) {
    stop("Project name must be provided.")
  }
  
  full_path <- file.path(path, name)
  
  if (dir.exists(full_path)) {
    stop("Directory already exists: ", full_path)
  }
  
  dir.create(full_path, recursive = TRUE, showWarnings = FALSE)
  if (verbose) message("Created project directory: ", full_path)
  
  if (package) {
    usethis::create_package(full_path, open = FALSE)
  } else {
    file.create(file.path(full_path, "README.md"))
    dir.create(file.path(full_path, "data_raw"))
    dir.create(file.path(full_path, "scripts"))
    dir.create(file.path(full_path, "outputs"))
  }
  
  if (makefile) {
    file.create(file.path(full_path, "Makefile.R"))
  }
  
  if (pipe && package) {
    usethis::use_pipe(path = full_path)
  }
  
  if (testthat && package) {
    usethis::use_testthat(path = full_path)
  }
  
  if (github) {
    usethis::use_git(path = full_path)
    usethis::use_github(private = private.repo, protocol = "https", path = full_path)
  }
  
  if (ci != "none" && github) {
    if (ci == "gh-actions") usethis::use_github_action(path = full_path)
    if (ci == "travis") usethis::use_travis(path = full_path)
    if (ci == "circle") usethis::use_circleci(path = full_path)
    if (ci == "appveyor") usethis::use_appveyor(path = full_path)
  }
  
  if (open.project && rstudioapi::isAvailable()) {
    rstudioapi::openProject(full_path)
  }
  
  invisible(full_path)
}


