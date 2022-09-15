# On CI connect to server, using API KEY and deploy using appId
rsconnect::addConnectServer("https://bookdown.org", "bookdown.org")
rsconnect::connectApiUser(
  account = "xiangyun", server = "bookdown.org",
  apiKey = Sys.getenv("CONNECT_API_KEY")
)
quarto::quarto_publish_site(
  name = "msg2nd", render = "none",
  server = "bookdown.org",
  account = "xiangyun",
  title = "Modern Statistical Graphics (2nd)"
)
