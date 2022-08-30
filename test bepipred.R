system("taskkill /im java.exe /f", intern=FALSE, ignore.stdout=FALSE)
driver <- rsDriver(browser = c("chrome"), chromever = "103.0.5060.134")
remote_driver <- driver[["client"]]
link=("https://services.healthtech.dtu.dk/service.php?BepiPred-2.0")
bcell<-remote_driver$navigate(link)
bcell_html<-remote_driver$getPageSource()[[1]]
bcell_html
bcell_epitopes<-read_html(bcell_html)
bcell_epitopes
accept_cookies_BCell<-remote_driver$findElement(using = "id",value = "cookiescript_accept")$clickElement()
Sys.sleep(2)
iframe <- remote_driver$findElement("xpath", "*//iframe[@id = 'servicetabs-1']")
remote_driver$switchToFrame(iframe)
bcell_fastabox<-remote_driver$findElement(using = "name",value="fasta")
bcell_fastabox$sendKeysToElement(list(">seq1
MEMKIDALAGTLESSDVMVRIGPAAQPGIQLEIDSIVKQQFGAAIEQVVRETLAQLGVKQ
ANVVVDDKGALECVLRARVQAAALRAAQQTQLQWSQL"))
submit<-remote_driver$findElement(using = "xpath",value = "/html/body/div/div/div/form/p/input[1]")$clickElement()
Sys.sleep(5)
curr_url<-remote_driver$getCurrentUrl()
curr_url
read<-remote_driver$getPageSource()[[1]]
read

