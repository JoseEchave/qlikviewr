#' Read qvd into R
#' Based on default path for 64bits qlivkiew. Designed for windows CMD.
#' @param qvd_path full qvd path (recommended the use together with here::here())
#' @param qlikview_exe full path to the executable qlikview file
#' @return data frame
#' @importFrom readr read_csv
#' @export
read_qvd <- function(qvd_path,qlikview_exe = "C:/Program Files/QlikView/Qv.EXE"){
  qvw_file <- paste(system.file(package = "qlikviewr"),"/tools/load_qvd_export_csv.qvw",sep = "")
  qvw_file <- shQuote(qvw_file,type = "cmd")
  program <- shQuote(qlikview_exe,type = "cmd")
  var_command <- "/V"
  choose_qvd <- paste(var_command,"path=",shQuote(qvd_path,type = "cmd"),sep = "")
  temp_file <- paste0(tempfile(),".csv")
  export_path <- paste(var_command,"export_path=",shQuote(temp_file,type = "cmd"),sep = "")
  reload_command <- "/R"


  cmd_command <- paste(program,choose_qvd,export_path,reload_command,qvw_file,sep = " ")

  system(cmd_command)

 data <-  readr::read_csv2(temp_file)
 #Doesn't work file.remove(temp_file,showWarnings = FALSE)

 data
}





