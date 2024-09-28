SELECT constraint_name
	FROM information_schema.constraint_column_usage
   WHERE table_name = 'tb_usuarios_acesso'
     AND column_name = 'acesso_id'
	 AND constraint_name <> 'unique_access_user';

ALTER TABLE tb_usuarios_acesso DROP CONSTRAINT "uk2uatp8ygefqeuhejeed3baphi";