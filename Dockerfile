FROM microsoft/mssql-server-linux:latest

RUN mkdir /var/opt/sqlserver
# Local copy of Adventure works DB
COPY Adventureworks.mdf.gz /tmp/Adventureworks.mdf.gz 
RUN  tar -C /var/opt/sqlserver -xvf /tmp/Adventureworks.mdf.gz && rm /tmp/Adventureworks.mdf.gz 

COPY init_sql.sh  /
COPY entrypoint.sh  /

ENV ACCEPT_EULA=Y

#HEALTHCHECK --interval=10s  \
RUN chmod +x /init_sql.sh /entrypoint.sh
CMD /entrypoint.sh


