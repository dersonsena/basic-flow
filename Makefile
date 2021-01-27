#!/bin/bash
include .env
SHELL := /bin/bash

export TZ=America/Sao_Paulo

export

##@ Docker
up: ## Start all project containers
	@echo -e "\n~~> Starting up containers for ${PROJECT_NAME}..."
	docker-compose up -d
	@echo -e "~~> [OK]\n"

in: ## Enter in app container
	@docker exec -it "${PROJECT_NAME}-app" bash

ps: ## List the project containers
	@docker-compose ps

##@ Composer

install: ## Composer install dependencies
	@echo -e "~~> Installing composer dependencies..."
	@docker exec -it "${PROJECT_NAME}-app" composer install -o
	@echo -e "~~> [OK]\n"

require: ## Run the composer require. (e.g make require PACKAGE="vendor/package")
	@docker exec -it "${PROJECT_NAME}-app" composer require "${PACKAGE}"

dump: ## Run the composer dump
	@docker exec -it "${PROJECT_NAME}-app" composer dump-autoload -o

##@ Database

db-backup: ## Backup database
	@docker exec "${PROJECT_NAME}-db" /usr/bin/mysqldump -u root -p"${DB_PASSWORD}" "${DB_DATABASE}" > backup.sql

db-restore: ## Restore database
	@cat backup.sql | docker exec -i "${PROJECT_NAME}-db" /usr/bin/mysql -u root -p"${DB_PASSWORD}" "${DB_DATABASE}"