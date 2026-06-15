
# supabase db dump --db-url "$old_connection" -f data.sql --data-only --use-copy
# supabase db dump --db-url "$old_connection" -f actual_data.sql --data-only --use-copy
# supabase db dump --db-url "$old_connection" -f auth_data.sql --data-only --schema auth

# psql "$new_connection" -c "SET session_replication_role = replica;" -f auth_data.sql
# supabase db push --db-url "$new_connection" < data.sql
# # 1. Inject the replica bypass straight into the SQL file
# echo "SET session_replication_role = replica;" | cat - actual_data.sql > temp_data.sql

# # 2. Push it via the Supabase CLI pipe
# supabase db push --db-url "$new_connection" < temp_data.sql

# # 3. Clean up the temp file
# rm temp_data.sql

# supabase link --project-ref


# docker run --rm -v "$(pwd)":/workspace -w /workspace postgres:alpine \
# psql "$new_connection" \
# -c "SET session_replication_role = replica;" \
# -f actual_data.sql