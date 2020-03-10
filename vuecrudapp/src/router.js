import Vue from 'vue';
import Router from 'vue-router';
import Tasks from './views/Tasks.vue';
import New from './views/New.vue';
import Show from './views/Show.vue';
import Edit from './views/Edit.vue';
import Map from './components/GoogleMap.vue';

Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  linkActiveClass: 'active',
  routes: [
    {
      path: '/',
      redirect: '/tasks'
    },
    {
      path: '/tasks',
      name: 'tasks',
      component: Tasks
    },
    {
      path: '/tasks/new',
      name: 'new-task',
      component: New
    },
    {
      path: '/tasks/:id',
      name: 'show',
      component: Show
    },
    {
      path: '/tasks/:id/edit',
      name: 'edit',
      component: Edit
    },
    {
      path: '/tasks/map',
      name: 'map',
      component: Map
    }   
  ]
});