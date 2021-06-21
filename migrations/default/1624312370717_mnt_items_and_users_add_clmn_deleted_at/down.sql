-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."mnt_items" add column "deleted_at" timestamptz null ;
alter table "public"."users" add column "deleted_at" timestamptz null ;
