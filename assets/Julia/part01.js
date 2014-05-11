function draw_with_data(data, parent_id) {
  var g = d3.select(parent_id)
            .append("svg")
              .attr("width", "166.67mm")
              .attr("height", "89.95mm")
              .attr("viewBox", "0 0 166.67 89.95")
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
           .attr("y", -33.67)
           .attr("text-anchor", "end")
           .style("dominant-baseline", "central")
            .call(function(text) {
      text.text("4.5");
    })
;
      }(g.append("g")));
      g.append("svg:text")
         .attr("x", 21.09)
         .attr("y", 47.32)
         .attr("text-anchor", "end")
         .style("dominant-baseline", "central")
         .call(function(text) {
     text.text("2.5");
   })
;
      g.append("svg:text")
         .attr("x", 21.09)
         .attr("y", 6.82)
         .attr("text-anchor", "end")
         .style("dominant-baseline", "central")
         .call(function(text) {
     text.text("3.5");
   })
;
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 21.09)
           .attr("y", 108.06)
           .attr("text-anchor", "end")
           .style("dominant-baseline", "central")
            .call(function(text) {
      text.text("1.0");
    })
;
      }(g.append("g")));
      g.append("svg:text")
         .attr("x", 21.09)
         .attr("y", 67.56)
         .attr("text-anchor", "end")
         .style("dominant-baseline", "central")
         .call(function(text) {
     text.text("2.0");
   })
;
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 21.09)
           .attr("y", -53.92)
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
           .attr("y", 87.81)
           .attr("text-anchor", "end")
           .style("dominant-baseline", "central")
            .call(function(text) {
      text.text("1.5");
    })
;
      }(g.append("g")));
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 21.09)
           .attr("y", 128.31)
           .attr("text-anchor", "end")
           .style("dominant-baseline", "central")
            .call(function(text) {
      text.text("0.5");
    })
;
      }(g.append("g")));
      g.append("svg:text")
         .attr("x", 21.09)
         .attr("y", 27.07)
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
           .attr("y", -13.43)
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
           .attr("y", 148.55)
           .attr("text-anchor", "end")
           .style("dominant-baseline", "central")
            .call(function(text) {
      text.text("0.0");
    })
;
      }(g.append("g")));
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 21.09)
           .attr("y", -74.17)
           .attr("text-anchor", "end")
           .style("dominant-baseline", "central")
            .call(function(text) {
      text.text("5.5");
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
         .attr("y", 37.19)
         .attr("text-anchor", "middle")
         .style("dominant-baseline", "central")
         .attr("transform", "rotate(-90, 8.63, 37.19)")
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
           .attr("x", 322.31)
           .attr("y", 74.69)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("2.6");
    })
;
      }(g.append("g")));
      g.append("svg:text")
         .attr("x", 157.72)
         .attr("y", 74.69)
         .attr("text-anchor", "middle")
         .call(function(text) {
     text.text("1.6");
   })
;
      g.append("svg:text")
         .attr("x", 58.96)
         .attr("y", 74.69)
         .attr("text-anchor", "middle")
         .call(function(text) {
     text.text("1.0");
   })
;
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", -39.8)
           .attr("y", 74.69)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("0.4");
    })
;
      }(g.append("g")));
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 223.56)
           .attr("y", 74.69)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("2.0");
    })
;
      }(g.append("g")));
      g.append("svg:text")
         .attr("x", 26.04)
         .attr("y", 74.69)
         .attr("text-anchor", "middle")
         .call(function(text) {
     text.text("0.8");
   })
;
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", -72.72)
           .attr("y", 74.69)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("0.2");
    })
;
      }(g.append("g")));
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 289.39)
           .attr("y", 74.69)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("2.4");
    })
;
      }(g.append("g")));
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 256.47)
           .attr("y", 74.69)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("2.2");
    })
;
      }(g.append("g")));
      g.append("svg:text")
         .attr("x", 124.8)
         .attr("y", 74.69)
         .attr("text-anchor", "middle")
         .call(function(text) {
     text.text("1.4");
   })
;
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", -6.88)
           .attr("y", 74.69)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("0.6");
    })
;
      }(g.append("g")));
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", 190.64)
           .attr("y", 74.69)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("1.8");
    })
;
      }(g.append("g")));
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", -105.64)
           .attr("y", 74.69)
           .attr("text-anchor", "middle")
            .call(function(text) {
      text.text("0.0");
    })
;
      }(g.append("g")));
      g.append("svg:text")
         .attr("x", 91.88)
         .attr("y", 74.69)
         .attr("text-anchor", "middle")
         .call(function(text) {
     text.text("1.2");
   })
;
      (function (g) {
        g.attr("visibility", "hidden");
        g.append("svg:text")
           .attr("x", -138.56)
           .attr("y", 74.69)
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
         .attr("x", 91.88)
         .attr("y", 82.95)
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
      .attr("d", " M22.09,5 L 161.67 5 161.67 69.39 22.09 69.39 z");g.attr("clip-path", "url(#" + parent_id + "_clippath0)");
        (function (g) {
          g.attr("class", "guide background")
           .attr("stroke", "#F1F1F5")
           .attr("fill", "#FAFAFA")
           .attr("opacity", 1.00);
          g.append("svg:path")
             .attr("d", "M22.09,5 L 161.67 5 161.67 69.39 22.09 69.39 z");
        }(g.append("g")));
        (function (g) {
          g.attr("stroke", "#F0F0F3")
           .attr("stroke-width", 0.2)
           .attr("class", "guide ygridlines xfixed");
          g.append("svg:path")
             .attr("d", "M22.09,47.32 L 161.67 47.32");
          g.append("svg:path")
             .attr("d", "M22.09,108.06 L 161.67 108.06");
          g.append("svg:path")
             .attr("d", "M22.09,-53.92 L 161.67 -53.92");
          g.append("svg:path")
             .attr("d", "M22.09,128.31 L 161.67 128.31");
          g.append("svg:path")
             .attr("d", "M22.09,-13.43 L 161.67 -13.43");
          g.append("svg:path")
             .attr("d", "M22.09,-74.17 L 161.67 -74.17");
          g.append("svg:path")
             .attr("d", "M22.09,148.55 L 161.67 148.55");
          g.append("svg:path")
             .attr("d", "M22.09,27.07 L 161.67 27.07");
          g.append("svg:path")
             .attr("d", "M22.09,87.81 L 161.67 87.81");
          g.append("svg:path")
             .attr("d", "M22.09,67.56 L 161.67 67.56");
          g.append("svg:path")
             .attr("d", "M22.09,6.82 L 161.67 6.82");
          g.append("svg:path")
             .attr("d", "M22.09,-33.67 L 161.67 -33.67");
        }(g.append("g")));
        (function (g) {
          g.attr("stroke", "#F0F0F3")
           .attr("stroke-width", 0.2)
           .attr("class", "guide xgridlines yfixed");
          g.append("svg:path")
             .attr("d", "M157.72,5 L 157.72 69.39");
          g.append("svg:path")
             .attr("d", "M-39.8,5 L -39.8 69.39");
          g.append("svg:path")
             .attr("d", "M26.04,5 L 26.04 69.39");
          g.append("svg:path")
             .attr("d", "M289.39,5 L 289.39 69.39");
          g.append("svg:path")
             .attr("d", "M124.8,5 L 124.8 69.39");
          g.append("svg:path")
             .attr("d", "M190.64,5 L 190.64 69.39");
          g.append("svg:path")
             .attr("d", "M91.88,5 L 91.88 69.39");
          g.append("svg:path")
             .attr("d", "M-138.56,5 L -138.56 69.39");
          g.append("svg:path")
             .attr("d", "M-105.64,5 L -105.64 69.39");
          g.append("svg:path")
             .attr("d", "M-6.88,5 L -6.88 69.39");
          g.append("svg:path")
             .attr("d", "M256.47,5 L 256.47 69.39");
          g.append("svg:path")
             .attr("d", "M-72.72,5 L -72.72 69.39");
          g.append("svg:path")
             .attr("d", "M223.56,5 L 223.56 69.39");
          g.append("svg:path")
             .attr("d", "M58.96,5 L 58.96 69.39");
          g.append("svg:path")
             .attr("d", "M322.31,5 L 322.31 69.39");
        }(g.append("g")));
      }(g.append("g")));
      (function (g) {
        d3.select("defs")
  .append("svg:clipPath")
    .attr("id", parent_id + "_clippath1")
    .append("svg:path")
      .attr("d", " M22.09,5 L 161.67 5 161.67 69.39 22.09 69.39 z");g.attr("clip-path", "url(#" + parent_id + "_clippath1)");
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
                 .attr("d", "M87.17,61.2 L 153.01 36.9 101.28 11.45 35.44 35.75 87.17 61.2");
            }(g.append("g")));
          }(g.append("g")));
        }(g.append("g")));
      }(g.append("g")));
      (function (g) {
        d3.select("defs")
  .append("svg:clipPath")
    .attr("id", parent_id + "_clippath2")
    .append("svg:path")
      .attr("d", " M22.09,5 L 161.67 5 161.67 69.39 22.09 69.39 z");g.attr("clip-path", "url(#" + parent_id + "_clippath2)");
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
               .attr("d", "M154.67,8 L 158.67 8 158.67 12 154.67 12 z");
            (function (g) {
              g.attr("fill", "#6A6A6A")
               .attr("class", "button_logo");
              g.append("svg:path")
                 .attr("d", "M155.47,9.6 L 156.27 9.6 156.27 8.8 157.07 8.8 157.07 9.6 157.87 9.6 157.87 10.4 157.07 10.4 157.07 11.2 156.27 11.2 156.27 10.4 155.47 10.4 z");
            }(g.append("g")));
          }(g.append("g")));
          (function (g) {
            g.attr("fill", "#EAEAEA")
             .on("click", zoomslider_track_behavior(ctx, 128.67, 145.67));
            g.append("svg:path")
               .attr("d", "M135.17,8 L 154.17 8 154.17 12 135.17 12 z");
          }(g.append("g")));
          (function (g) {
            g.attr("fill", "#6A6A6A")
             .attr("class", "zoomslider_thumb")
             .call(zoomslider_behavior(ctx, 128.67, 145.67))
.on("mouseover", zoomslider_thumb_mouseover("#cd5c5c"))
.on("mouseout", zoomslider_thumb_mouseover("#6a6a6a"))
;
            g.append("svg:path")
               .attr("d", "M143.67,8 L 145.67 8 145.67 12 143.67 12 z");
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
               .attr("d", "M130.67,8 L 134.67 8 134.67 12 130.67 12 z");
            (function (g) {
              g.attr("fill", "#6A6A6A")
               .attr("class", "button_logo");
              g.append("svg:path")
                 .attr("d", "M131.47,9.6 L 133.87 9.6 133.87 10.4 131.47 10.4 z");
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
  [87.17454806828388,153.01354177897574,101.28290386343221,35.44391015274033,87.17454806828388],
  [61.20130986846172,36.904294794088145,11.450279001887267,35.74729407626084,61.20130986846172]];

var draw = function(parent_id) {
    draw_with_data(data, parent_id);
};

if ('undefined' !== typeof module) {
    module.exports = draw;
} else if ('undefined' !== typeof window) {
    window.draw = draw
}
