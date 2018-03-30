# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: svigouro <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/02/15 14:59:55 by svigouro          #+#    #+#              #
#    Updated: 2018/03/29 12:32:26 by svigouro         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: all, clean, fclean, re
.SUFFIXES:

SRC_PATH = src
SRC_NAME = main.c parser.c bresenham.c draw.c hook.c init.c move.c rota.c \
		   toggle.c
OBJ_PATH = obj
OBJ_NAME = $(SRC_NAME:.c=.o)
CPPFLAGS = -Iinclude
LFT_PATH = libft
LFTFLAGS = -lft
MLX_PATH = minilibx_macos
MLXFLAGS = -lmlx -framework OpenGL -framework AppKit

NAME = fdf
CC = gcc
CFLAGS = -Werror -Wextra -Wall

SRC = $(addprefix $(SRC_PATH)/,$(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH)/,$(OBJ_NAME))

# colors
GREY    = 	$'\x1b[30m
RED     = 	$'\x1b[31m
GREEN   = 	$'\x1b[32m
YELLOW  = 	$'\x1b[33m
BLUE    = 	$'\x1b[34m
PURPLE  = 	$'\x1b[35m
CYAN    = 	$'\x1b[36m
WHITE   = 	$'\x1b[37m
BOLD    = 	$'\x1b[1m
UNDER   = 	$'\x1b[4m
REV     = 	$'\x1b[7m
END     = 	$'\x1b[0m

all: $(NAME)

$(NAME): $(OBJ)
	@printf "${GREEN}==> ${END}Creating libft.a...\n"
	@$(MAKE) -C $(LFT_PATH)
	@printf "${GREEN}==> ${END}Creating libmlx.a...\n"
	@$(MAKE) -C $(MLX_PATH)
	@printf "${GREEN}==> ${END}Creating $(NAME)...\n"
	$(CC) -L$(LFT_PATH) $(LFTFLAGS) -L$(MLX_PATH) $(MLXFLAGS) $^ -o $@

$(OBJ_PATH)/%.o: $(SRC_PATH)/%.c
	@printf "${GREEN}==> ${END}Compiling $(NAME)...\n"
	@mkdir $(OBJ_PATH) 2>/dev/null || true
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -c $<

clean:
	@printf "${RED}==> ${END}Deleting libft.a source files...\n"
	@$(MAKE) -C $(LFT_PATH) clean
	@printf "${RED}==> ${END}Deleting libmlx.a source files...\n"
	@$(MAKE) -C $(MLX_PATH) clean
	@printf "${RED}==> ${END}Deleting ${NAME} source files...\n"
	rm -f $(OBJ)
	@rmdir $(OBJ_PATH) 2>/dev/null || true

fclean: clean
	@$(MAKE) -C $(LFT_PATH) fclean
	@printf "${RED}==> ${END}Deleting $(NAME)...\n"
	rm -f $(NAME)

re: fclean all

