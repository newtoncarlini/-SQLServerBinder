# Utiliza a imagem do Jupyter Notebook como base
FROM jupyter/datascience-notebook

# Define a versão do Debian
ENV DEBIAN_VERSION=buster

# Instala o SQL Server
USER root
RUN apt-get update && \
    apt-get install -y curl gnupg2 lsb-release apt-utils && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/debian/${DEBIAN_VERSION}/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools unixodbc-dev && \
    apt-get clean && \
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> /etc/profile.d/mssql-tools.sh && \
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc && \
    . /etc/profile.d/mssql-tools.sh


