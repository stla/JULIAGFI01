require(shiny)

linebreak <- function(height="10pt"){
  html <- tags$hr(style="height:%s; visibility:hidden;")
  sprintf(as.character(html), height)
}

codechunk <- function(code, file=NULL, size="100%", dirfile="assets/Julia"){
  if(!is.null(file)){
    code <- paste(readLines(file.path(dirfile, file)), collapse="\n")
  }
  html <- '<pre><code class="r" style="font-size:%s">%s
</code></pre>'
  html <- sprintf(html, size, code)
  cat(html)
}

helpPopup <- function(title, content,
                      placement=c('right', 'top', 'left', 'bottom'),
                      trigger=c('hover', 'click', 'focus', 'manual'),
                      glue = NULL) {
  
  tagList(
    singleton(
      tags$head(
        tags$script("$(function() { $(\"[data-toggle='popover']\").popover(); })")
      )
    ),
    tags$a(
      #  href = "#", class = "tip", `data-toggle` = "popover",
      href = "javascript: void(0)",
      class = "btn btn-default", 
      `data-toggle` = "popover",
      title = title, 
      `data-content` = content,
      # added this parameter
      `data-html` = TRUE, 
      # 
      `data-animation` = TRUE,
      `data-placement` = match.arg(placement, several.ok=TRUE)[1],
      `data-trigger` = match.arg(trigger, several.ok=TRUE)[1],  
      glue, 
      tags$i(class="icon-info-sign")
    ),
    # CB added for popup width control
    tags$style(type='text/css', ".popover { width: 400px; relative; left: 320px !important; }")
    # end add
  )
}