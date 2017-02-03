FROM kenjimyzk/rstudio

MAINTAINER "kenjimyzk"

USER root
# Install packages
RUN Rscript -e "install.packages(c('mosaic', 'latticeExtra'))"
RUN Rscript -e "install.packages(c('xtable', 'stargazer', 'texreg'))"
RUN Rscript -e "install.packages(c('AER', 'dynlm', 'plm'))"

USER rstudio
RUN mkdir /home/rstudio/work

CMD ["/init"]

