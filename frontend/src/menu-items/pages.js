// assets
import { IconKey } from '@tabler/icons-react';
import { IconChartArrowsVertical } from '@tabler/icons-react';

// constant
const icons = {
  IconKey,
  IconChartArrowsVertical
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
    }
  ]
};

export default pages;
