#' Baixar páginas de notícias da Ponte Jornalismo
#'
#' @param diretorio diretorio onde serão baixadas as notícias
#' @param paginas Número de páginas
#'
#' @return html
#' @export
#'
baixar_paginas_ponte <- function(diretorio = ".",paginas = 10){

  url <- "https://ponte.org"



  invisible(httr::GET(url))

  purrr::walk(1:paginas,purrr::possibly(purrrogress::with_progress(~{

  arquivo <-  paste0(diretorio,"/",stringr::str_replace_all(Sys.time(),"\\D","_"),"_ponte_pagina_",.x,".html")

  body<- list(page= .x,
              action= "load-more")

  invisible(httr::RETRY("POST",url,body= body,encode="form",httr::write_disk(arquivo)))


  }),NULL))

}
