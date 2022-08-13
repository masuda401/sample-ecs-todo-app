<template>
  <div class="mb-4">
    <div class="shadow mb-4 px-4 py-4">
      <input v-model="task.title" v-focus class="w-full mb-2  focus:outline-none font-semibold"
             placeholder="What title is your task?">

      <div class="flex items-center border-t"></div>

      <input v-model="task.description" v-focus class="w-full mt-2 focus:outline-none font-semibold"
             placeholder="What description is your task?">
    </div>

    <div class="text-right">
      <button class="bg-indigo text-white font-bold py-2 px-4 rounded" @click="add">
        Add task
      </button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'NewTask',
  data() {
    return {
      task: {
        title: '',
        description: '',
      },
    }
  },
  methods: {
    add() {
      this.$emit('add', this.task)
      this.task = {
        title: '',
        description: '',
      }
    },
  }
}
</script>

<style scoped></style>
