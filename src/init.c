/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: svigouro <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/03/29 12:54:51 by svigouro          #+#    #+#             */
/*   Updated: 2018/03/29 12:58:23 by svigouro         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "fdf.h"

void	free_tab(char **tab)
{
	int	i;

	i = -1;
	while (tab[++i])
		free(tab[i]);
	free(tab);
}

void	init_point(t_point *p)
{
	p->x = 0;
	p->y = 0;
	p->z = 0;
	p->color = 0xFFFFFF;
}

void	init_img(t_env *e)
{
	e->img = mlx_new_image(e->mlx, e->win_width, e->win_height);
	e->data = (int *)mlx_get_data_addr(e->img, &e->bpp, &e->size, &e->endian);
}

int		init(t_env *e)
{
	if (!(e->mlx = mlx_init()))
		return (-1);
	e->win_width = WIDTH;
	e->win_height = HEIGHT;
	e->scale = (e->win_width / e->o.width + e->win_height / e->o.height) / 4;
	e->origin.x = (e->win_width / 2) - ((e->o.width * e->scale) / 2);
	e->origin.y = (e->win_height / 2) - ((e->o.height * e->scale) / 2);
	e->win = mlx_new_window(e->mlx, e->win_width, e->win_height, "FdF");
	e->o.pitch = 1;
	e->o.bres = 1;
	e->o.iso = 1;
	e->alt = 0;
	e->color = 0xFFFFFF;
	return (0);
}
