# On CI connect to server, using API KEY and deploy using appId
rsconnect::addServer(url = "https://bookdown.org/", name = "bookdown.org")
rsconnect::connectApiUser(
  account = "xiangyun", server = "bookdown.org",
  apiKey = Sys.getenv("CONNECT_API_KEY")
)
rsconnect::deploySite(
  siteName = "msg2nd",
  siteTitle = "Modern Statistical Graphics (2nd)",
  server = "bookdown.org", account = "xiangyun",
  render = "none", forceUpdate = TRUE
)
