###############################################################################
# If you edit this file you MUST release a new version of the gatkbase docker #
# built with the updated r dependencies                                       #
#                                                                             #
# you MUST also manually clear the travis cache for master before running the #
# pull request tests in order to make sure it's still working                 #
###############################################################################

options(warn = 2)     # treat warnings as errors, otherwise script can fail silently if a package fails to install

InstallPackageFromArchive = function(packageName, packageURL) {
    # make sure to use http not https as this will give an "unsupported URL scheme" error
    if (!(packageName %in% rownames(installed.packages()))) {
        install.packages(packageURL, repos = NULL, type = "source", clean = TRUE)
    }
}

dependencies = c("gplots",
                 "digest", "gtable", "MASS", "plyr", "reshape2", "scales", "tibble", "lazyeval", # for ggplot2
                 "tidyselect", "BH", "plogr")     # for dplyr
repos <- c("http://cran.r-project.org")
install.packages(dependencies, repos = repos, clean = TRUE)

InstallPackageFromArchive("getopt", "http://cran.r-project.org/src/contrib/Archive/getopt/getopt_1.20.0.tar.gz")
InstallPackageFromArchive("optparse", "http://cran.r-project.org/src/contrib/Archive/optparse/optparse_1.3.2.tar.gz")
install.packages("data.table")
InstallPackageFromArchive("gsalib", "http://cran.r-project.org/src/contrib/gsalib_2.1.tar.gz")
InstallPackageFromArchive("ggplot2", "http://cran.r-project.org/src/contrib/Archive/ggplot2/ggplot2_2.2.1.tar.gz")
install.packages("dplyr")

# HMM is only required for testing and not in production:
install.packages("HMM")

q(save = "no")