FROM kenjimyzk/rstudio3
MAINTAINER "kenjimyzk"

RUN apt-get install -y libnlopt-dev
# Install packages
RUN Rscript -e "install.packages(c('mosaic', 'mosaicCalc', 'kableExtra'))"
RUN Rscript -e "install.packages(c('xtable', 'stargazer', 'texreg'))"
RUN Rscript -e "install.packages(c('AER', 'dynlm', 'plm'))"

USER rstudio
# RUN git clone https://github.com/kenjimyzk/bookdown_ja_template.git /home/rstudio/bookdown_ja_template
ADD rmd-article.Rmd /home/rstudio/rmd-article.Rmd
ADD rmd-beamer.Rmd /home/rstudio/rmd-beamer.Rmd

USER root 
CMD ["/init"]

