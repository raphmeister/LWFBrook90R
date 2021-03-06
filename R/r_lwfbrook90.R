#' Interface function to the LWF-Brook90 model
#'
#' Passes input data matrices to the Fortran model code
#'
#'
#' @param siteparam a [1,6] matrix with site level information: start year, start doy,
#' latitude, initial snow, initial groundwater, precipitation interval
#' @param climveg a matrix with 15 columns of climatic and vegetation data: year, month, day
#' globrad (MJ m-2 d-1), tmax (degC), tmin (degC), vappres (kPar), wind (m s-1), prec (mm), mesfl (mm),
#' densef (-), stand height (m), lai (m2 m-2), sai (m2 m-2), age (years)
#' @param param a vector of model input parameters
#' @param pdur a [1,12]-matrix of precipitation durations (hours) for each monath
#' @param soil_materials a matrix of the 8 soil materials parameters. When imodel = 1 (Mualem-van Genuchten), these refer to:
#' mat, ths, thr , alpha (m-1), npar, ksat (mm d-1), tort (-), stonef (-). When imodel = 2 (Clapp-Hornberger):
#' mat, thsat, thetaf, psif (kPa), bexp, kf (mm d-1), wetinf (-), stonef (-)
#' @param soil_nodes a matrix of the 6 soil model layers with columns nl (layer number),
#' layer midpoint (m), thickness (mm), mat, psiini (kPa), rootden (-).
#' @param precdat a matrix precipitation interval data with 6 columns:
#' year, month, day, interval-number (1:precint), prec, meslflp
#' @param output a [12,5] matrix of output selection settings
#' @param output_log logical wether to write the output-logfile 'Log.txt'. This is where the
#' commandline-feed of the original fortan program is written.
#'
#' @details model output is written to comma-separated files (.ASC) in the working directory.
#'
#' @export
#' @useDynLib LWFBrook90R
#'
r_lwfbrook90 <- function(
  siteparam,
  climveg,
  param,
  pdur,
  soil_materials,
  soil_nodes,
  precdat = NULL,
  output,
  output_log = TRUE
  ){


  # make a matrix of precipitation fille
  if ( is.null(precdat) ){
    precdat <- matrix(-999, nrow = param[1] * siteparam[[6]], ncol = 6)
  }

  # Run the model
  out <- .Fortran(
    'fbrook90',
    siteparam = as.matrix( siteparam, ncol = 6, nrow = 1),
    climveg = as.matrix( climveg, ncol = 15),
    param = as.vector(param),
    pdur = as.matrix( pdur, ncol = 12 ),
    soil_materials = as.matrix( soil_materials, ncol = 8 ),
    soil_nodes = as.matrix( soil_nodes, ncol = 6 ),
    precdat = as.matrix( precdat, ncol = 6),
    output = as.integer( as.matrix( output, ncol = 5, nrow = 10)),
    output_log = as.integer( output_log )
    )

  # return(NULL)
}
