FROM kenjimyzk/rstudio

MAINTAINER "kenjimyzk"

# Install packages
RUN Rscript -e "install.packages(c('Cairo', 'extrafont', 'tikzDevice'))"
RUN Rscript -e "extrafont::font_import()"
RUN Rscript -e "install.packages(c('mosaic', 'latticeExtra'))"
RUN Rscript -e "install.packages(c('xtable', 'stargazer', 'texreg'))"
RUN Rscript -e "install.packages(c('AER', 'dynlm', 'plm'))"

CMD ["/init"]  
