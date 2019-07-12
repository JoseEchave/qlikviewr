#' Reload qlikview documents.
#' Based on default path for 32bits qlivkiew. Designed for windows CMD.
#' Useful to reload a qlikview document that exports csv, so that they can be refreshed to rerun an analysis based on latest data.
#' @param path Path of qlikview document as an string (Function converts it to readable CMD format)
#' @param qlikview_exe full path to the executable qlikview file
#' @return No output, just reloads the choosen qvw file
#' @export
reload_qvw <- function(path,qlikview_exe = "C:/Program Files/QlikView/Qv.EXE"){
  program <- shQuote(qlikview_exe,type = "cmd")
  command <- "/R"
  file <- shQuote(path,type = "cmd")

  cmd_command <- paste(program,command,file,sep = " ")
  system(cmd_command)
}

