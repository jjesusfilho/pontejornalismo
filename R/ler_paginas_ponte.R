#' Ler notícias baixadas com baixar_paginas_ponte
#'
#' @param arquivos Vetor com local dos arquivos
#' @param diretorio Se não informar os arquivos,
#'     informar o diretório
#'
#' @return tibble
#' @export
#'
ler_paginas_ponte<-function(arquivos = NULL, diretorio = "."){

   if (is.null(arquivos)){

    arquivos <- list.files(diretorio,pattern='html',full.names=TRUE)
  }

  purrr::map_dfr(arquivos,purrr::possibly(purrrogress::with_progress(~{

    x <- xml2::read_html(.x,encoding="UTF-8")

    headline <- xml2::xml_find_all(x,"//h2[@class='title-2']/a") %>%
      xml2::xml_text()

    url_headline <- xml2::xml_find_all(x,"//h2[@class='title-2']/a") %>%
      xml2::xml_attr("href")

    data_autor <- xml2::xml_find_all(x,"//h2[@class='title-2']/following-sibling::p") %>%
      xml2::xml_text(trim=TRUE)

    data <- stringr::str_extract(data_autor,"\\S+") %>%
           lubridate::dmy()

    autor <- stringr::str_extract(data_autor,"(?<=\\s).+") %>%
           stringr::str_remove("(?i)\\s?por\\s?")

    descricao <- xml2::xml_find_all(x,"//p[@class='text-1']") %>%
                 xml2::xml_text()

    tibble::tibble(data, autor, headline,descricao,url=url_headline)

  }),NULL))


}
