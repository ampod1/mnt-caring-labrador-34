alter table "public"."mnt_items" add column "deleted_at" timestamptz null ;
alter table "public"."users" add column "deleted_at" timestamptz null ;
