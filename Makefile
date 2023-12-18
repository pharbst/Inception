# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pharbst <pharbst@student.42heilbronn.de>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/17 12:55:54 by pharbst           #+#    #+#              #
#    Updated: 2023/12/18 19:18:22 by pharbst          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

include color.mk

PRONAME		=	Inception

VPATH		:=	srcs requirements mariadb wordpress nginx

COMPOSE		=	./srcs/docker-compose.yml

SERVICES	=	mariadb nginx wordpress

.PHONY: all
all: build run

build:
	docker-compose -f $(COMPOSE) build

.PHONY: run logs stop re
run:
	docker-compose -f $(COMPOSE) up -d

logs:
	docker-compose -f $(COMPOSE) logs

stop:
	docker-compose -f $(COMPOSE) down

re:
	docker-compose -f $(COMPOSE) down
	docker-compose -f $(COMPOSE) up --build -d

purge:
	docker-compose -f $(COMPOSE) down
	docker rmi $(shell docker images -q)

wipe: purge
	rm -rf $(HOME)/mariadb/*
	rm -rf $(HOME)/wordpress/*