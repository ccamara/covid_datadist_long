library(dplyr)

#' Converts datadista wide data into long data.
#' @description Converts datadista wide data into long data and stores it into a CSV file under data folder.
#' @param name A string to name resulting output file.
#' @param url A string with the url where data will be retreived from.
coviddataset_long <- function(name, url) {
  df <- read.csv(url) %>% 
    select(-cod_ine) %>% 
    pivot_longer(-CCAA, names_to = "date", values_to = "total") %>% 
    mutate(date = gsub("X*", "", date)) %>% 
    mutate(date = gsub("\\.", "-", date)) %>% 
    mutate(date = as.Date(date))
  
  write.csv(df, paste0("data/output/", name, ".csv"))
}


coviddataset_long("ccaa_covid19_altas_long", "https://raw.githubusercontent.com/datadista/datasets/master/COVID%2019/ccaa_covid19_casos.csv")

coviddataset_long("ccaa_covid19_casos_long", "https://raw.githubusercontent.com/datadista/datasets/master/COVID%2019/ccaa_covid19_casos.csv")

coviddataset_long("ccaa_covid19_uci_long", "https://raw.githubusercontent.com/datadista/datasets/master/COVID%2019/ccaa_covid19_uci.csv")

coviddataset_long("ccaa_covid19_fallecidos_long", "https://raw.githubusercontent.com/datadista/datasets/master/COVID%2019/ccaa_covid19_fallecidos.csv")

