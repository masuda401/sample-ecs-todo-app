<template>
  <div class="flex justify-between bg-white leading-none rounded-lg shadow overflow-hidden p-3 mb-4">
    <div class="flex items-center">
      <div class="rounded-full bg-white h-6 cursor-pointer flex items-center justify-center mr-2">
        <input :value="task.status" :checked="task.status === 1" type="checkbox"
               class="w-4 h-4 text-blue-600 bg-gray-100 rounded border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
               @click="toggleStatus"
        >
      </div>
      <div class="py-2">
        <p class="title font-semibold text-lg mx-2 mb-2 text-left cursor-pointer"
           :class="{'line-through text-grey' : task.status === 1}">
          {{ task.title }}
        </p>
        <span class="description mx-2" :class="{'line-through text-grey' : task.status === 1}">
          {{ task.description }}
        </span>
      </div>
    </div>

    <div class="flex items-center">
      <loading-button
        type="button"
        icon="trash"
        class="bg-red-light text-white font-bold py-2 px-4 rounded text-grey-darker text-sm"
        @click.native="remove"
      >
        Remove
      </loading-button>
    </div>
  </div>
</template>

<script>
import LoadingButton from "~/components/LoadingButton";

export default {
  name: 'TaskItem',
  components: {
    LoadingButton
  },
  props: {
    task: {
      type: Object,
      required: true
    }
  },
  methods: {
    toggleStatus(){
      let status = 0
      if (this.task.status === 0) {
        status = 1
      }
      const task = {...this.task, status}
      this.$emit('update', task)
    },
    remove() {
      this.$emit('remove', this.task)
    }
  }
}
</script>

<style scoped>

</style>
