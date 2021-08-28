# 修改输出的显示行数
knitr::knit_hooks$set(output = local({
  # the default output hook
  hook_output = knitr::knit_hooks$get('output')
  function(x, options) {
    if (!is.null(n <- options$out.lines)) { # out.lines
      x = xfun::split_lines(x)
      if (length(x) > n) {
        # truncate the output
        x = c(head(x, n), '....\n')
      }
      x = paste(x, collapse = '\n') # paste first n lines together
    }
    hook_output(x, options)
  }
}))

# 修改代码块字体大小
knitr::knit_hooks$set(chunk = local({
  hook_chunk <- knitr::knit_hooks$get("chunk")
  function(x, options) {
    x <- hook_chunk(x, options)
    ifelse(options$size != "normalsize", paste0("\n \\", options$size, "\n\n", x, "\n\n \\normalsize"), x)
  }
}))

to_png <- function(fig_path) {
  png_path <- sub("\\.pdf$", ".png", fig_path)
  magick::image_write(magick::image_read_pdf(fig_path),
    format = "png", path = png_path,
    density = 300, quality = 100
  )
  return(png_path)
}

# example chunk options set globally
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  size = "scriptsize",
  fig.align = "center"
)
