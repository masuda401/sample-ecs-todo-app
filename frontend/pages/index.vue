<template>
  <div class="">
    <nav class="bg-indigo">
      <div class="container mx-auto px-4 py-4">
        <div class="flex justify-between">
          <div>
            <span class="text-white no-underline font-bold text-3xl">
              Todo App
            </span>
          </div>
        </div>
      </div>
    </nav>

    <div v-if="status === 'loading'"
         class="flex items-top justify-center min-h-screen bg-gray-100 items-center"
    >
      <div class="flex text-xl my-6 justify-center text-grey-darker">
        <div class="animate-spin h-10 w-10 border-4 border-blue rounded-full border-t-transparent mr-2"></div>
        <span class="flex items-center">Loading</span>
      </div>
    </div>

    <div v-else class="container mx-auto px-16 py-4">
      <new-task @add="addTask" @cancel="status = ''"></new-task>
      <h2 class="w-full text-3xl font-bold border-b mb-4">Task List</h2>
      <task-item v-for="task in tasks"
            :key="task.id"
            :task="task"
            class=""
            @update="updateTask"
            @remove="removeTask"
      />
    </div>
  </div>
</template>

<script>
export default {
  name: 'TodoHome',
  data() {
    return {
      status: 'loading',
      tasks: [],
    }
  },
  async fetch() {
    const {store} = this.$nuxt.context
    this.tasks = await store.dispatch('fetchTasks')
    this.status = ''
  },
  methods: {
    async addTask(task) {
      await this.$store.dispatch('addTask', task)
      this.tasks = await this.$store.dispatch('fetchTasks')
      this.status = ''
    },
    async updateTask(task) {
      await this.$store.dispatch('updateTask', task)
      this.tasks = await this.$store.dispatch('fetchTasks')
      this.status = ''
    },
    async removeTask(task) {
      await this.$store.dispatch('removeTask', task)
      this.tasks = await this.$store.dispatch('fetchTasks')
      this.status = ''
    },
  }
}
</script>
