<template>
  <div>
    <h1>Show task</h1>

    <div class="ui labeled input fluid">
      <div class="ui label">
      <i class="tasks icon"></i>  Task
      </div>
      <input type="text" readonly  :value="task.task1"/>
    </div>

     <div class="ui labeled input fluid">
      <div class="ui label">
        <i class="info circle icon"></i> Details
      </div>
      <input type="text" readonly  :value="task.task2"/>
    </div>
    <div class="actions">
      <router-link :to="{ name: 'edit', params: { id: this.$route.params.id }}">
        Edit task
      </router-link>
    </div>
  </div>
</template>

<script>
import { api } from '../helpers/helpers';
export default {
  name: 'show',
  data() {
    return {
      task: ''
    };
  },
  async mounted() {
    this.task = await api.gettask(this.$route.params.id);
  }
};
</script>

<style scoped>
.actions a {
  display: block;
  text-decoration: underline;
  margin: 20px 10px;
}
</style>