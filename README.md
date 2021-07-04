# Hasura cloud project - mnt - data

* To run console

`hasura console`

* Sql for new table
```
CREATE TABLE "public"."bsc_customer" (
    "id" uuid NOT NULL DEFAULT gen_random_uuid(),
    "code" serial NOT NULL,
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "updated_at" timestamptz NOT NULL DEFAULT now(),
    "name" jsonb NOT NULL,
    "ext_data" jsonb,
    "deleted_at" timestamptz,
    PRIMARY KEY ("id")
);
```