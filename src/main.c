/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: svigouro <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/03/29 12:42:49 by svigouro          #+#    #+#             */
/*   Updated: 2018/03/30 10:36:54 by svigouro         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "fdf.h"

int		main(int argc, char **argv)
{
	t_env		e;

	if (argc < 2 || argc > 2)
		return (-1);
	if (argc == 2)
		e = *parser(argv[1], &e);
	if (init(&e) < 0)
		return (-1);
	mlx_hook(e.win, 17, (1L << 17), quit, &e);
	mlx_key_hook(e.win, key_hook, &e);
	mlx_mouse_hook(e.win, mouse_hook, &e);
	mlx_expose_hook(e.win, expose_hook, &e);
	mlx_loop(e.mlx);
}
