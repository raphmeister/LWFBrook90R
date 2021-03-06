#' Create a parameter vector for the r_lwfbrook90-function
#'
#' The parameter vector for r_lwfbrook90 is created from the lists of model controls options, parameters, and soil.
#'
#'
#' @param param.b90 a named list of model parameters.
#' @param imodel name of hydraulic model ('MvG' or 'CH')
#'
#' @return a numerical vector with the parameters in the right order for r_brook90
#' @export
param_to_rbrook90 <- function(param.b90,
                              imodel){

  fparms <- c(param.b90$ndays,
              0, # heat always 0, it doesnt work.
              param.b90$eslope,
              param.b90$aspect,
              param.b90$alb,
              param.b90$albsn,
              param.b90$c1,
              param.b90$c2,
              param.b90$c3,
              param.b90$wndrat,
              param.b90$fetch,
              param.b90$z0w,
              param.b90$zw,
              param.b90$lwidth,
              param.b90$obsheight*param.b90$czs,   # as calculated in MS Access-GUI
              param.b90$z0s,
              param.b90$lpc,
              param.b90$cs,
              param.b90$czs,
              param.b90$czr,
              param.b90$hs,
              param.b90$hr,
              param.b90$zminh,
              param.b90$rhotp,
              param.b90$nn,
              param.b90$rstemp,
              param.b90$intrainini,
              param.b90$intsnowini,
              param.b90$frintlai,
              param.b90$fsintlai,
              param.b90$frintsai,
              param.b90$fsintsai,
              param.b90$cintrl,
              param.b90$cintrs,
              param.b90$cintsl,
              param.b90$cintss,
              param.b90$melfac,
              param.b90$ccfac,
              param.b90$laimlt,
              param.b90$saimlt,
              param.b90$grdmlt,
              param.b90$maxlqf,
              param.b90$ksnvp,
              param.b90$snoden,
              param.b90$glmax,
              param.b90$radex,
              param.b90$glmin,
              param.b90$rm,
              param.b90$r5,
              param.b90$cvpd,
              param.b90$tl,
              param.b90$t1,
              param.b90$t2,
              param.b90$th,
              param.b90$mxkpl,
              param.b90$maxrlen,
              param.b90$initrlen,
              param.b90$initrdep,
              param.b90$rgrorate,
              param.b90$rgroper,
              param.b90$fxylem,
              param.b90$psicr,
              param.b90$rrad,
              param.b90$nooutf,
              nrow(param.b90$soil_nodes),
              nrow(param.b90$soil_materials),
              param.b90$ilayer,
              param.b90$qlayer,
              ifelse(imodel == "MvG", 1,0),
              param.b90$rssa,
              param.b90$rssb,
              param.b90$infexp,
              param.b90$bypar,
              param.b90$qfpar,
              param.b90$qffc,
              param.b90$imperv,
              param.b90$dslope,
              param.b90$slopelen,
              param.b90$drain,
              param.b90$gsc,
              param.b90$gsp,
              param.b90$dtimax,
              param.b90$dswmax,
              param.b90$dpsimax)

return(fparms)
}
