# Convert PDF to PNG
to_png <- function(fig_path) {
  png_path <- sub("\\.pdf$", ".png", fig_path)
  magick::image_write(magick::image_read_pdf(fig_path),
    format = "png", path = png_path,
    density = 300, quality = 100
  )
  return(png_path)
}

knitr::opts_chunk$set(webshot = "webshot")

knitr::knit_hooks$set(par = function(before, options, envir) {
  if (before && options$fig.show != "none") {
    par(
      mar = c(4, 4, .1, .1)
    )
  }
})
# example chunk options set globally
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  fig.align = "center"
)

options(
  citation.bibtex.max = 999,
  crayon.enabled = FALSE,
  tinytex.engine = 'xelatex',
  tikzDefaultEngine = "xetex",
  formatR.indent = 2,
  width = 69,
  kableExtra.latex.load_packages = FALSE,
  tikzDocumentDeclaration = "\\documentclass[tikz]{standalone}\n",
  tikzXelatexPackages = c(
    "\\usepackage[fontset=fandol]{ctex}",
    "\\usepackage{amsfonts,bm,mathrsfs,amssymb}\n"
  )
)

if (xfun::is_macos()) {
  # 准备 Noto 中英文字体
  sysfonts::font_paths(new = "~/Library/Fonts/")
  ## 宋体
  sysfonts::font_add(
    family = "Noto Serif CJK SC",
    regular = "NotoSerifCJKsc-Regular.otf",
    bold = "NotoSerifCJKsc-Bold.otf"
  )
  ## 黑体
  sysfonts::font_add(
    family = "Noto Sans CJK SC",
    regular = "NotoSansCJKsc-Regular.otf",
    bold = "NotoSansCJKsc-Bold.otf"
  )
} else { # Github Action Ubuntu
  sysfonts::font_paths(new = c(
    "/usr/share/fonts/opentype/noto/",
    "/usr/share/fonts/truetype/noto/"
  ))
  ## 宋体
  sysfonts::font_add(
    family = "Noto Serif CJK SC",
    regular = "NotoSerifCJK-Regular.ttc",
    bold = "NotoSerifCJK-Bold.ttc"
  )
  ## 黑体
  sysfonts::font_add(
    family = "Noto Sans CJK SC",
    regular = "NotoSansCJK-Regular.ttc",
    bold = "NotoSansCJK-Bold.ttc"
  )
}

## 衬线字体
sysfonts::font_add(
  family = "Noto Serif",
  regular = "NotoSerif-Regular.ttf",
  bold = "NotoSerif-Bold.ttf",
  italic = "NotoSerif-Italic.ttf",
  bolditalic = "NotoSerif-BoldItalic.ttf"
)
## 无衬线字体
sysfonts::font_add(
  family = "Noto Sans",
  regular = "NotoSans-Regular.ttf",
  bold = "NotoSans-Bold.ttf",
  italic = "NotoSans-Italic.ttf",
  bolditalic = "NotoSans-BoldItalic.ttf"
)
