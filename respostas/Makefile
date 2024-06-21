all:
	docker volume create imersao_sql_volume
	docker run --name imersao_sql -e POSTGRES_PASSWORD=q -e POSTGRES_DB=prefeituras -p 9090:5432 -v imersao_sql_volume:/var/lib/postgresql/data -d postgres

clean:
	docker stop imersao_sql

fclean: clean
	docker rm imersao_sql
	docker volume rm imersao_sql_volume
	docker rmi postgres

re: fclean all

.PHONY: all clean fclean re