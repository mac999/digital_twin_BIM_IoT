<template>
  <div>
    <h1>tasks</h1>
    <table id="tasks" class="ui celled compact table">
      <thead>
				<ul>
					<li> <i class="calendar plus icon"></i>Task</li>
          <li> <i class="info circle icon"></i>Detail</li>
					<li> <i class="lock open icon"></i>Lock</li>
					<li> <i class="edit icon"></i>Edit</li>
					<li> <i class="trash icon"></i>Trash</li>
        </ul>
      </thead>
      <tr v-for="(task, i) in tasks" :key="i">
        <td>{{ task.task1 }}</td>
        <td>{{ task.task2 }}</td>
        <td width="75" class="center aligned">
          <router-link :to="{ name: 'show', params: { id: task._id }}">Show</router-link>
        </td>
        <td width="75" class="center aligned">
          <router-link :to="{ name: 'edit', params: { id: task._id }}">Edit</router-link>
        </td>
        <td width="75" class="center aligned" @click.prevent="onDestroy(task._id)">
          <a :href="`/tasks/${task._id}`">Delete</a>
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
import { api } from '../helpers/helpers';

export default {
  name: 'tasks',
  data() {
    return {
      tasks: []
    };
  },
  methods: {
    async onDestroy(id) {
      const sure = window.confirm('Are you sure?');
      if (!sure) return;
      await api.deletetask(id);
      this.flash('task deleted sucessfully!', 'success');
      const newtasks = this.tasks.filter(task => task._id !== id);
      this.tasks = newtasks;
    }
  },
  async mounted() {
    this.tasks = await api.gettasks();
  }
};
</script>

<style scoped>

</style>