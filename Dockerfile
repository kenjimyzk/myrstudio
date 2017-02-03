FROM kenjimyzk/rstudio

MAINTAINER "kenjimyzk"

# Install packages
RUN Rscript -e "install.packages(c('mosaic', 'latticeExtra'))"
RUN Rscript -e "install.packages(c('xtable', 'stargazer', 'texreg'))"
RUN Rscript -e "install.packages(c('AER', 'dynlm', 'plm'))"

RUN mkdir /home/rstudio/work && chown rstudio:rstudio /home/rstudio/work

CMD ["/init"]

