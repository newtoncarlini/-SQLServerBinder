#!/bin/bash
set -e

/opt/mssql-tools/bin/sqlcmd -S localhost -U adminbanco -P 'fito@2023' -Q "EXEC sp_start_diagnostics; EXEC sp_readerrorlog;"

exec "$@"
