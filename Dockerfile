FROM kenjimyzk/rstudio3
MAINTAINER "kenjimyzk"

RUN apt install -y libnlopt-dev libxt-dev
RUN Rscript -e "install.packages(c('knitr', 'kableExtra'))"
RUN Rscript -e "install.packages(c('bookdown', 'formatR', 'rmarkdown'))"
RUN Rscript -e "install.packages(c('Cairo', 'extrafont'))"
RUN Rscript -e "install.packages(c('mosaic', 'mosaicCalc', 'latticeExtra'))"
RUN Rscript -e "install.packages(c('xtable', 'stargazer', 'texreg'))"
RUN Rscript -e "install.packages(c('AER', 'dynlm', 'plm'))"

USER opencpu
RUN Rscript -e "extrafont::font_import(prompt = FALSE)"
# RUN git clone https://github.com/kenjimyzk/bookdown_ja_template.git /home/rstudio/bookdown_ja_template
# ADD dot.latexmkrc /home/opencpu/.Rprofile
# ADD dot.latexmkrc /home/opencpu/.latexmkrc
ADD rmd-article.Rmd /home/opencpu/rmd-article.Rmd
ADD rmd-beamer.Rmd /home/opencpu/rmd-beamer.Rmd

USER root 
CMD ["/init"]

