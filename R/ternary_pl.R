#' Data structure with the  projected and boundary by node and class.
#' 
#' @param dat data.frame
#' @param dx first direction included in id
#' @param dy second direction included in id
#' @return ternary plot
#' @export
#' @importFrom magrittr %>%
#' @examples
#' #crab data set with all the observations used as training
#' pprf.crab <- PPforest::PPforest(data = crab, std =TRUE, class = "Type",
#'  size.tr = 1, m = 100, size.p = .5, PPmethod = 'LDA')
#'  st <- ternary_str(pprf.crab, id = c(1, 2, 3), sp = 3, dx = 1, dy = 2)
#'  ternary_pl(st, dx =1, dy = 2)
ternary_pl <- function(dat, dx, dy) {
  pair <- NULL
  Class <- NULL
  x <- NULL
  y <- NULL
  x1 <- NULL
  x2 <- NULL
  y1 <- NULL
  y2 <- NULL
  
  p1  <-
    dat[[1]] %>% dplyr::filter(pair %in% paste(dx, dy, sep = "-")) %>%
    dplyr::select(Class, x, y) %>%
    ggplot2::ggplot(ggplot2::aes(x, y, color = Class)) +
    ggplot2::geom_segment(data = dat[[2]], ggplot2::aes(
                            x = x1, xend = x2,
                            y = y1, yend = y2 ),
                          color = "black") +
    ggplot2::geom_point(size = I(3), alpha = .5) +
    ggplot2::labs(y = " ",  x = " ") +
    ggplot2::theme(legend.position = "none", aspect.ratio = 1) +
    ggplot2::scale_colour_brewer(type = "qual", palette = "Dark2") +
    ggplot2::labs(x = paste0("T", dx, " "), y = paste0("T", dy, " ")) +
    ggplot2::theme(aspect.ratio = 1)
  p1
}
