#!/bin/bash
set -e

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P '' -Q "EXEC sp_start_diagnostics; EXEC sp_readerrorlog;"

exec "$@"
