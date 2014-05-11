function draw_with_data(data, parent_id) {
  var g = d3.select(parent_id)
            .append("svg")
              .attr("width", "79.37mm")
              .attr("height", "50.26mm")
              .attr("viewBox", "0 0 79.37 50.26")
              .attr("stroke-width", "0.5")
              .attr("style", "stroke:black;fill:black");
  g.append("defs");
  var ctx = {
      "scale": 1.0,
      "tx": 0.0,
      "ty": 0.0
  };
(function (g) {
  g.attr("stroke", "none")
   .attr("fill", "#000000")
   .attr("stroke-width", 0.3)
   .attr("font-family", "Helvetic,Arial,sans")
   .style("font-size", "3.88px");
  (function (g) {
    g.attr("class", "plotroot xscalable yscalable");
    (function (g) {
      g.attr("stroke", "none")
       .attr("fill", "#4C404B")
       .attr("font-family", "'PT Sans','Helvetica Neue','Helvetica',sans-serif")
       .style("font-size", "3.18px")
       .attr("class", "guide ylabels");
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 21.09)
           .attr("y", -17.61)
           .attr("text-anchor", "end")
           .style("dominant-baseline", "central")
            .call(function(text) {
      text.text("4.5");
    })
;
      }(g.append("g")));
      g.append("svg:text")
         .attr("x", 21.09)
         .attr("y", 29.01)
         .attr("text-anchor", "end")
         .style("dominant-baseline", "central")
         .call(function(text) {
     text.text("2.5");
   })
;
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 21.09)
           .attr("y", 40.66)
           .attr("text-anchor", "end")
           .style("dominant-baseline", "central")
            .call(function(text) {
      text.text("2.0");
    })
;
      }(g.append("g")));
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 21.09)
           .attr("y", -29.26)
           .attr("text-anchor", "end")
           .style("dominant-baseline", "central")
            .call(function(text) {
      text.text("5.0");
    })
;
      }(g.append("g")));
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 21.09)
           .attr("y", -5.95)
           .attr("text-anchor", "end")
           .style("dominant-baseline", "central")
            .call(function(text) {
      text.text("4.0");
    })
;
      }(g.append("g")));
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 21.09)
           .attr("y", 52.31)
           .attr("text-anchor", "end")
           .style("dominant-baseline", "central")
            .call(function(text) {
      text.text("1.5");
    })
;
      }(g.append("g")));
      g.append("svg:text")
         .attr("x", 21.09)
         .attr("y", 5.7)
         .attr("text-anchor", "end")
         .style("dominant-baseline", "central")
         .call(function(text) {
     text.text("3.5");
   })
;
      g.append("svg:text")
         .attr("x", 21.09)
         .attr("y", 17.35)
         .attr("text-anchor", "end")
         .style("dominant-baseline", "central")
         .call(function(text) {
     text.text("3.0");
   })
;
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 21.09)
           .attr("y", 63.96)
           .attr("text-anchor", "end")
           .style("dominant-baseline", "central")
            .call(function(text) {
      text.text("1.0");
    })
;
      }(g.append("g")));
    }(g.append("g")));
    (function (g) {
      g.attr("stroke", "none")
       .attr("fill", "#362A35")
       .attr("font-family", "'PT Sans','Helvetica Neue','Helvetica',sans-serif")
       .style("font-size", "3.88px");
      g.append("svg:text")
         .attr("x", 8.63)
         .attr("y", 17.35)
         .attr("text-anchor", "middle")
         .style("dominant-baseline", "central")
         .attr("transform", "rotate(-90, 8.63, 17.35)")
         .call(function(text) {
     text.text("y");
   })
;
    }(g.append("g")));
    (function (g) {
      g.attr("stroke", "none")
       .attr("fill", "#4C404B")
       .attr("font-family", "'PT Sans','Helvetica Neue','Helvetica',sans-serif")
       .style("font-size", "3.18px")
       .attr("class", "guide xlabels");
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 134.53)
           .attr("y", 35.01)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("2.6");
    })
;
      }(g.append("g")));
      g.append("svg:text")
         .attr("x", 72.89)
         .attr("y", 35.01)
         .attr("text-anchor", "middle")
         .call(function(text) {
     text.text("1.6");
   })
;
      g.append("svg:text")
         .attr("x", 35.9)
         .attr("y", 35.01)
         .attr("text-anchor", "middle")
         .call(function(text) {
     text.text("1.0");
   })
;
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", -1.09)
           .attr("y", 35.01)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("0.4");
    })
;
      }(g.append("g")));
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 97.54)
           .attr("y", 35.01)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("2.0");
    })
;
      }(g.append("g")));
      g.append("svg:text")
         .attr("x", 23.57)
         .attr("y", 35.01)
         .attr("text-anchor", "middle")
         .call(function(text) {
     text.text("0.8");
   })
;
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", -13.42)
           .attr("y", 35.01)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("0.2");
    })
;
      }(g.append("g")));
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 122.2)
           .attr("y", 35.01)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("2.4");
    })
;
      }(g.append("g")));
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 109.87)
           .attr("y", 35.01)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("2.2");
    })
;
      }(g.append("g")));
      g.append("svg:text")
         .attr("x", 60.56)
         .attr("y", 35.01)
         .attr("text-anchor", "middle")
         .call(function(text) {
     text.text("1.4");
   })
;
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 11.24)
           .attr("y", 35.01)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("0.6");
    })
;
      }(g.append("g")));
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 85.22)
           .attr("y", 35.01)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("1.8");
    })
;
      }(g.append("g")));
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", -25.75)
           .attr("y", 35.01)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("0.0");
    })
;
      }(g.append("g")));
      g.append("svg:text")
         .attr("x", 48.23)
         .attr("y", 35.01)
         .attr("text-anchor", "middle")
         .call(function(text) {
     text.text("1.2");
   })
;
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", -38.08)
           .attr("y", 35.01)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("-0.2");
    })
;
      }(g.append("g")));
    }(g.append("g")));
    (function (g) {
      g.attr("stroke", "none")
       .attr("fill", "#362A35")
       .attr("font-family", "'PT Sans','Helvetica Neue','Helvetica',sans-serif")
       .style("font-size", "3.88px");
      g.append("svg:text")
         .attr("x", 48.23)
         .attr("y", 43.26)
         .attr("text-anchor", "middle")
         .call(function(text) {
     text.text("x");
   })
;
    }(g.append("g")));
    (function (g) {
      g.on("mouseover", guide_background_mouseover("#C6C6C9"))
       .on("mouseout", guide_background_mouseout("#F0F0F3"))
       .call(zoom_behavior(ctx))
;
      (function (g) {
        d3.select("defs")
  .append("svg:clipPath")
    .attr("id", parent_id + "_clippath0")
    .append("svg:path")
      .attr("d", " M22.09,5 L 74.37 5 74.37 29.7 22.09 29.7 z");g.attr("clip-path", "url(#" + parent_id + "_clippath0)");
        (function (g) {
          g.attr("class", "guide background")
           .attr("stroke", "#F1F1F5")
           .attr("fill", "#FAFAFA")
           .attr("opacity", 1.00);
          g.append("svg:path")
             .attr("d", "M22.09,5 L 74.37 5 74.37 29.7 22.09 29.7 z");
        }(g.append("g")));
        (function (g) {
          g.attr("stroke", "#F0F0F3")
           .attr("stroke-width", 0.2)
           .attr("class", "guide ygridlines xfixed");
          g.append("svg:path")
             .attr("d", "M22.09,29.01 L 74.37 29.01");
          g.append("svg:path")
             .attr("d", "M22.09,-29.26 L 74.37 -29.26");
          g.append("svg:path")
             .attr("d", "M22.09,52.31 L 74.37 52.31");
          g.append("svg:path")
             .attr("d", "M22.09,17.35 L 74.37 17.35");
          g.append("svg:path")
             .attr("d", "M22.09,63.96 L 74.37 63.96");
          g.append("svg:path")
             .attr("d", "M22.09,5.7 L 74.37 5.7");
          g.append("svg:path")
             .attr("d", "M22.09,-5.95 L 74.37 -5.95");
          g.append("svg:path")
             .attr("d", "M22.09,40.66 L 74.37 40.66");
          g.append("svg:path")
             .attr("d", "M22.09,-17.61 L 74.37 -17.61");
        }(g.append("g")));
        (function (g) {
          g.attr("stroke", "#F0F0F3")
           .attr("stroke-width", 0.2)
           .attr("class", "guide xgridlines yfixed");
          g.append("svg:path")
             .attr("d", "M72.89,5 L 72.89 29.7");
          g.append("svg:path")
             .attr("d", "M-1.09,5 L -1.09 29.7");
          g.append("svg:path")
             .attr("d", "M23.57,5 L 23.57 29.7");
          g.append("svg:path")
             .attr("d", "M122.2,5 L 122.2 29.7");
          g.append("svg:path")
             .attr("d", "M60.56,5 L 60.56 29.7");
          g.append("svg:path")
             .attr("d", "M85.22,5 L 85.22 29.7");
          g.append("svg:path")
             .attr("d", "M48.23,5 L 48.23 29.7");
          g.append("svg:path")
             .attr("d", "M-38.08,5 L -38.08 29.7");
          g.append("svg:path")
             .attr("d", "M-25.75,5 L -25.75 29.7");
          g.append("svg:path")
             .attr("d", "M11.24,5 L 11.24 29.7");
          g.append("svg:path")
             .attr("d", "M109.87,5 L 109.87 29.7");
          g.append("svg:path")
             .attr("d", "M-13.42,5 L -13.42 29.7");
          g.append("svg:path")
             .attr("d", "M97.54,5 L 97.54 29.7");
          g.append("svg:path")
             .attr("d", "M35.9,5 L 35.9 29.7");
          g.append("svg:path")
             .attr("d", "M134.53,5 L 134.53 29.7");
        }(g.append("g")));
      }(g.append("g")));
      (function (g) {
        d3.select("defs")
  .append("svg:clipPath")
    .attr("id", parent_id + "_clippath1")
    .append("svg:path")
      .attr("d", " M22.09,5 L 74.37 5 74.37 29.7 22.09 29.7 z");g.attr("clip-path", "url(#" + parent_id + "_clippath1)");
        (function (g) {
          g.attr("class", "plotpanel");
          (function (g) {
            g.attr("stroke-width", 0.3);
            (function (g) {
              g.attr("stroke-width", 0.3);
g.selectAll("form0")
                  .data(d3.zip(data[0],data[1]))
                  .enter()
                  .append("circle")
.attr("cx", function(d) { return d[0]; })
.attr("cy", function(d) { return d[1]; })
.attr("r", 0.6)
.attr("class", "geometry color_LCHab(70.0,60.0,240.0)")
.on("mouseout", geom_point_mouseout(10.00, 0.50), false)
.on("mouseover", geom_point_mouseover(10.00, 0.50), false)
.attr("stroke", "#0096DD")
.attr("fill", "#00BFFF")
;
            }(g.append("g")));
          }(g.append("g")));
          (function (g) {
            g.attr("fill", "none")
             .attr("stroke-width", 0.3);
            (function (g) {
              g.attr("stroke", "#00BFFF")
               .attr("class", "geometry");
              g.append("svg:path")
                 .attr("d", "M27.09,22.35 L 35.9 29.01 71.12 23.01 51.75 8.36 27.09 22.35");
            }(g.append("g")));
          }(g.append("g")));
        }(g.append("g")));
      }(g.append("g")));
      (function (g) {
        d3.select("defs")
  .append("svg:clipPath")
    .attr("id", parent_id + "_clippath2")
    .append("svg:path")
      .attr("d", " M22.09,5 L 74.37 5 74.37 29.7 22.09 29.7 z");g.attr("clip-path", "url(#" + parent_id + "_clippath2)");
        (function (g) {
          g.attr("stroke", "none")
           .attr("class", "guide zoomslider")
           .attr("opacity", 0.00);
          (function (g) {
            g.attr("stroke", "#6A6A6A")
             .attr("stroke-opacity", 0.00)
             .attr("stroke-width", 0.3)
             .attr("fill", "#EAEAEA")
             .on("click", zoomin_behavior(ctx))
.on("dblclick", function() { d3.event.stopPropagation(); })
.on("mouseover", zoomslider_button_mouseover("#cd5c5c"))
.on("mouseout", zoomslider_button_mouseover("#6a6a6a"))
;
            g.append("svg:path")
               .attr("d", "M67.37,8 L 71.37 8 71.37 12 67.37 12 z");
            (function (g) {
              g.attr("fill", "#6A6A6A")
               .attr("class", "button_logo");
              g.append("svg:path")
                 .attr("d", "M68.17,9.6 L 68.97 9.6 68.97 8.8 69.77 8.8 69.77 9.6 70.57 9.6 70.57 10.4 69.77 10.4 69.77 11.2 68.97 11.2 68.97 10.4 68.17 10.4 z");
            }(g.append("g")));
          }(g.append("g")));
          (function (g) {
            g.attr("fill", "#EAEAEA")
             .on("click", zoomslider_track_behavior(ctx, 41.37, 58.37));
            g.append("svg:path")
               .attr("d", "M47.87,8 L 66.87 8 66.87 12 47.87 12 z");
          }(g.append("g")));
          (function (g) {
            g.attr("fill", "#6A6A6A")
             .attr("class", "zoomslider_thumb")
             .call(zoomslider_behavior(ctx, 41.37, 58.37))
.on("mouseover", zoomslider_thumb_mouseover("#cd5c5c"))
.on("mouseout", zoomslider_thumb_mouseover("#6a6a6a"))
;
            g.append("svg:path")
               .attr("d", "M56.37,8 L 58.37 8 58.37 12 56.37 12 z");
          }(g.append("g")));
          (function (g) {
            g.attr("stroke", "#6A6A6A")
             .attr("stroke-opacity", 0.00)
             .attr("stroke-width", 0.3)
             .attr("fill", "#EAEAEA")
             .on("click", zoomout_behavior(ctx))
.on("dblclick", function() { d3.event.stopPropagation(); })
.on("mouseover", zoomslider_button_mouseover("#cd5c5c"))
.on("mouseout", zoomslider_button_mouseover("#6a6a6a"))
;
            g.append("svg:path")
               .attr("d", "M43.37,8 L 47.37 8 47.37 12 43.37 12 z");
            (function (g) {
              g.attr("fill", "#6A6A6A")
               .attr("class", "button_logo");
              g.append("svg:path")
                 .attr("d", "M44.17,9.6 L 46.57 9.6 46.57 10.4 44.17 10.4 z");
            }(g.append("g")));
          }(g.append("g")));
        }(g.append("g")));
      }(g.append("g")));
    }(g.append("g")));
  }(g.append("g")));
}(g.append("g")));
    d3.select(parent_id)
      .selectAll("path")
      .each(function() {
          var sw = parseFloat(window.getComputedStyle(this).getPropertyValue("stroke-width"));
          d3.select(this)
            .attr("vector-effect", "non-scaling-stroke")
            .style("stroke-width", sw + "mm");
      });
}

var data = [
  [27.09025422496042,35.89703983228511,71.12418226158388,51.749253925469574,27.09025422496042],
  [22.346456452602006,29.0053648797045,23.012347295312253,8.36274875568676,22.346456452602006]];

var draw = function(parent_id) {
    draw_with_data(data, parent_id);
};

if ('undefined' !== typeof module) {
    module.exports = draw;
} else if ('undefined' !== typeof window) {
    window.draw = draw
}
