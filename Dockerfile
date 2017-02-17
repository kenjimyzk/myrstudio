FROM kenjimyzk/rstudio-latex

MAINTAINER "kenjimyzk"

RUN apt-get install -y libnlopt-dev fonts-ipaexfont fonts-ipafont
# Install packages
RUN Rscript -e "install.packages(c('mosaic', 'latticeExtra'))"
RUN Rscript -e "install.packages(c('xtable', 'stargazer', 'texreg'))"
RUN Rscript -e "install.packages(c('AER', 'dynlm', 'plm'))"
RUN Rscript -e "install.packages(c('bookdown', 'formatR'))"
RUN Rscript -e "install.packages(c('Cairo', 'extrafont', 'tikzDevice'))"


USER rstudio
RUN git clone https://github.com/kenjimyzk/bookdown_ja_template.git /home/rstudio/bookdown_ja_template
ADD dot.latexmkrc /home/rstudio/.latexmkrc
ADD rmd-article.Rmd /home/rstudio/rmd-article.Rmd
ADD rmd-beamer.Rmd /home/rstudio/rmd-beamer.Rmd
RUN Rscript -e "extrafont::font_import(prompt = FALSE)"


USER root 
CMD ["/init"]

