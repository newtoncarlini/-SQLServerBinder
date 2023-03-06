# Imagem base
FROM mcr.microsoft.com/mssql/server:2019-latest

# Instala as dependências do Python
RUN apt-get update && \
    apt-get install -y python3-dev python3-pip unixodbc-dev && \
    pip3 install pyodbc pandas sqlalchemy jupyter

# Configura o SQL Server
ENV ACCEPT_EULA=Y \
    SA_PASSWORD=<senha> \
    MSSQL_PID=Developer \
    MSSQL_AGENT_ENABLED=true \
    MSSQL_COLLATION=SQL_Latin1_General_CP1_CI_AS

# Cria um diretório para os notebooks
RUN mkdir /notebooks

# Copia os arquivos
COPY entrypoint.sh /
COPY *.ipynb /notebooks/

# Define o comando de entrada
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
