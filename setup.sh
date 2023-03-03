rm -f boe_spending.db
# install sqlite, datasette, datasette-vega (data viz)
pip install sqlite-utils datasette datasette-vega
# install plugins for codespaces and full-text search
datasette install datasette-codespaces datasette-configure-fts
# add data, build db
sqlite-utils insert boe_spending.db vendors "data/boe_spending_cleaned.csv" --csv
# enable full-text search for agency name, payee name, and zip
sqlite-utils enable-fts boe_spending.db vendors agency_name payee_name_refined payee_zip5
# turn on db
datasette serve boe_spending.db