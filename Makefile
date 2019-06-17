# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    Makefile                                         .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: kcabus <kcabus@student.le-101.fr>          +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/04/06 14:53:11 by kcabus       #+#   ##    ##    #+#        #
#    Updated: 2019/06/17 15:07:22 by kcabus      ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

.PHONY: all clean fclean re

NAME = sdl_game

WFLAGS = -Wall -Wextra -Werror

SRC_PATH = ./srcs/
INC_PATH = ./includes/
OBJ_PATH = ./obj/
SDL_PATH = ./SDL2/
SDL_INC = includes/

SRC = $(addprefix $(SRC_PATH),$(N_SRCS))
OBJ = $(addprefix $(OBJ_PATH),$(OBJ_NAME))

SDL_SRC = $(addprefix $(SDL_PATH),lib/)
SDL_LIB = $(addprefix $(SDL_PATH),includes/)

INC = -I $(INC_PATH) -I $(SDL_LIB)

LIB_A = -L $(SDL_SRC) -l SDL2-2.0.0

OBJ_NAME = $(N_SRCS:.c=.o)

N_SRCS =	main.c

all : $(NAME)

$(NAME):	$(OBJ)
			@gcc $(OBJ) $(INC) $(LIB_A) -o $(NAME)
			@printf "\033[33;5m compile OK ! \n\033[0m"

$(OBJ_PATH)%.o:	$(SRC_PATH)%.c
				@mkdir -p $(OBJ_PATH)
				@gcc -c $(INC) -o $@ $<
				@printf "\033[43m \033[0m"
	
clean :
			@rm -rf $(OBJ_PATH)

fclean : 	clean
			@rm -rf $(NAME)

re : fclean clean all
