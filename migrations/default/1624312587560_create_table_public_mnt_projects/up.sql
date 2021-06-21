CREATE TABLE "public"."mnt_projects" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "code" serial NOT NULL, "site_id" uuid NOT NULL, "name" jsonb NOT NULL, "ext_data" jsonb, "media" jsonb, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("site_id") REFERENCES "public"."mnt_site"("id") ON UPDATE restrict ON DELETE restrict);
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_mnt_projects_updated_at"
BEFORE UPDATE ON "public"."mnt_projects"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_mnt_projects_updated_at" ON "public"."mnt_projects" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
