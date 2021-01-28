# Imagem
FROM continuumio/miniconda3:4.9.2

# Escolhendo um workdir
WORKDIR /ShareFiles

# Instalando principais pacotes
RUN conda install jupyter -y && \
    conda install jupyterlab -y && \
    conda install pandas==1.2.1 -y && \
    conda install numpy==1.19.2 -y && \
    conda install scipy==1.5.2 -y && \
    conda install seaborn==0.11.1 -y && \
    conda install matplotlib==3.3.2 -y && \
    conda install plotly==4.14.3 -y && \
    conda install scikit-learn==0.23.2 -y && \
    conda clean -y -a

# Expondo porta 8888
EXPOSE 8888

VOLUME /ShareFiles

# Comando a ser executado quando o container for executado (Abrir jupyter-lab)
CMD ["jupyter","lab","--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]