alter table "public"."core_user"
  add constraint "core_user_user_type_fkey"
  foreign key ("user_type")
  references "public"."core_usertype"
  ("id") on update restrict on delete restrict;
