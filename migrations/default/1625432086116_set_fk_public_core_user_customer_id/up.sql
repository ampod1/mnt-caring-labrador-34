alter table "public"."core_user"
  add constraint "core_user_customer_id_fkey"
  foreign key ("customer_id")
  references "public"."bsc_customer"
  ("id") on update restrict on delete restrict;
