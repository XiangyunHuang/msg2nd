if (file.exists('~/.Rprofile')) sys.source('~/.Rprofile', envir = environment())

options(
  citation.bibtex.max = 999,
  crayon.enabled = FALSE,
  tinytex.engine = 'xelatex',
  tikzDefaultEngine = "xetex",
  bookdown.clean_book = TRUE,
  kableExtra.latex.load_packages = FALSE,
  tikzDocumentDeclaration = "\\documentclass[tikz]{standalone}\n",
  tikzXelatexPackages = c(
    "\\usepackage[fontset=fandol]{ctex}",
    "\\usepackage{amsfonts,bm,mathrsfs,amssymb}\n"
  )
)
