# Utiliza a imagem do Jupyter Notebook como base
FROM jupyter/datascience-notebook

# Instala o SQL Server
USER root
RUN apt-get update && \
    apt-get install -y curl gnupg2 lsb-release && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/debian/$(lsb_release -rs)/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools unixodbc-dev && \
    dpkg -l | grep '^rc' | awk '{print $2}' | xargs dpkg --purge && \
    dpkg -l | grep '^iU' | awk '{print $2}' | xargs dpkg --purge && \
    apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> /etc/profile.d/mssql-tools.sh && \
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc && \
    . /etc/profile.d/mssql-tools.sh
