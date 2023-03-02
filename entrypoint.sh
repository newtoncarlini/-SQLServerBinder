#!/bin/bash
set -e

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P '<your-password>' -Q "EXEC sp_start_diagnostics; EXEC sp_readerrorlog;"

exec "$@"
