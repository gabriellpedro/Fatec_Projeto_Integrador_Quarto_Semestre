// assets
import { IconKey } from '@tabler/icons-react';
import { IconChartArrowsVertical } from '@tabler/icons-react';
import { IconScale } from '@tabler/icons-react';

// constant
const icons = {
  IconKey,
  IconChartArrowsVertical,
  IconScale,
};

// ==============================|| EXTRA PAGES MENU ITEMS ||============================== //

const pages = {
  id: 'pages',
  title: 'Principais',
  caption: 'Páginas',
  type: 'group',
  children: [
    {
      id: 'authentication',
      title: 'Autenticação',
      type: 'collapse',
      icon: icons.IconKey,

      children: [
        {
          id: 'login',
          title: 'Login',
          type: 'item',
          url: '/user/login/',
          target: true
        },
        {
          id: 'register',
          title: 'Registrar',
          type: 'item',
          url: '/user/register/',
          target: true
        }
      ]
    },
    {
      id: 'recyclestatistics',
      title: 'Estatísticas Reciclagem',
      type: 'collapse',
      icon: icons.IconChartArrowsVertical,

      children: [
        {
          id: 'state',
          title: 'Estados',
          type: 'item',
          url: '/reciclestatistics/',
          target: false
        },
        {
          id: 'city',
          title: 'Cidades',
          type: 'item',
          url: '/',
          target: false
        }
      ]
    },
    {
      id: 'balance',
      title: 'Balança',
      type: 'collapse',
      icon: icons.IconScale,

      children: [
        {
          id: 'clientbalance',
          title: 'Balança Específica',
          type: 'item',
          url: '/balance/',
          target: false
        },
        {
          id: 'clientsearch',
          title: 'Busca de Usuário',
          type: 'item',
          url: '/usersearch/',
          target: false
        }
      ]
    }
  ]
};

export default pages;
