// assets
import { IconChartArrowsVertical } from '@tabler/icons-react';

// constant
const icons = { IconChartArrowsVertical };

// ==============================|| Recycle Statistics MENU ITEMS ||============================== //

const recyclestatistics = {
  id: 'recyclestatistics',
  title: 'recyclestatistics',
  type: 'group',
  children: [
    {
      id: 'default',
      title: 'recyclestatistics',
      type: 'item',
      url: '/reciclestatistics/',
      icon: icons.IconChartArrowsVertical,
      breadcrumbs: false
    }
  ]
};

export default recyclestatistics;
