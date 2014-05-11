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

# marche pas comme voulu, faire un scale iframe
includeGadfly <- function(file, dirfile="assets/Julia", width=NULL, height=NULL){ # width in mm
  id <- paste0("gadfly_",file)
  file <- paste0(file, ".js")
  if(!is.null(width)){
    if(is.null(height)) height <- width
    viewbox <- paste("0 0", width, height)
    newattr <- sprintf('d3.select("#%s svg").attr("width", "%s").attr("height", "%s").attr("viewBox", "%s")', 
            id, paste0(width,"mm"),  paste0(height,"mm"), viewbox)
  }else{
    newattr <- ""
  }
  html <- '<iframe srcdoc=\'
<head>
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script src="./assets/js/gadfly.js"></script>

</head>
<body>
<div id="%s"></div>
<script src="./assets/Julia/%s"></script>
<script>
</script>
<script>
draw("#%s");
</script>
<script>
%s
</script>
</body>
\' src="demo_iframe_srcdoc.htm">
  <p>Your browser does not support iframes.</p>
</iframe>'
  html <- sprintf(html, id, file, id, newattr)
  cat(html)
}

# d3.select("#%s").find("svg")[0].attr({
#   "width": "100px",
#   "height": "100px"
# })

# var svg = d3.select("#%s").find("svg")[0];
# svg.removeAttribute("width");
# svg.removeAttribute("height");
# svg.setAttribute("width", "20mm")

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