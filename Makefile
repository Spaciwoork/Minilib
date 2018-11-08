##
## EPITECH PROJECT, 2018
## Minilibc augustin
## File description:
## Makfile augustin
##

NAME	=	libasm.so

SRC	=	src/strlen.S	\
		src/strchr.S	\
		src/memset.S	\
		src/memcpy.S	\
		src/strcmp.S	\
		src/memmove.S	\
		src/strncmp.S	\
		src/strcasecmp.S	\
		src/rindex.S	\
		src/strstr.S	\
		src/strcspn.S	\
		src/strpbrk.S

OBJ	=	$(SRC:.S=.o)

all:	$(NAME)

%.o: %.S
	nasm -o $@ $< -f elf64

$(NAME): $(OBJ)
	gcc -shared -static-libgcc -nostdlib -fno-builtin -o $(NAME) $(OBJ)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re:	fclean all

.PHONY: all clean fclean
