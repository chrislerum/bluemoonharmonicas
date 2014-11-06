class StaticController < ApplicationController
  def home
    @top_bit = CustomHtml.find_by_display_order(1)
    @bottom_bit = CustomHtml.find_by_display_order(2)
  end

  def newsletter
  end
  def list_users
    sql = %{
SELECT u.usename AS "User name",
  u.usesysid AS "User ID",
  CASE WHEN u.usesuper AND u.usecreatedb THEN CAST('superuser, create
database' AS pg_catalog.text)
       WHEN u.usesuper THEN CAST('superuser' AS pg_catalog.text)
       WHEN u.usecreatedb THEN CAST('create database' AS
pg_catalog.text)
       ELSE CAST('' AS pg_catalog.text)
  END AS "Attributes"
FROM pg_catalog.pg_user u
ORDER BY 1;
    }
    @user_list = ActiveRecord::Base.connection.execute(sql)
  end
end
