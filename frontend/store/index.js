const defaultState = () => {
  return {
    errorMessages: null,
  }
}

export const state = defaultState()

export const actions = {
  async fetchTasks({commit}) {
    try {
      return await this.$axios.$get(
        `/api/todos/`
      )
    } catch (err) {
      const errorMessages = ['エラーが発生しました。エラーを確認して下さい。']
      if (err.response && err.response.data.error) {
        errorMessages.push(err.response.data.error)
      }

      commit('setErrorMessages', errorMessages)
      console.log(err)
    }
  },
  async addTask({commit}, task) {
    try {
      return await this.$axios.$post(
        `/api/todos/`, task
      )
    } catch (err) {
      const errorMessages = ['エラーが発生しました。エラーを確認して下さい。']
      if (err.response && err.response.data.error) {
        errorMessages.push(err.response.data.error)
      }

      commit('setErrorMessages', errorMessages)
      console.log(err)
    }
  },
  async updateTask({commit}, task) {
    try {
      return await this.$axios.$put(
        `/api/todos/${task.id}/`, task
      )
    } catch (err) {
      const errorMessages = ['エラーが発生しました。エラーを確認して下さい。']
      if (err.response && err.response.data.error) {
        errorMessages.push(err.response.data.error)
      }

      commit('setErrorMessages', errorMessages)
      console.log(err)
    }
  },
  async removeTask({commit}, task) {
    try {
      return await this.$axios.$delete(
        `/api/todos/${task.id}/`,
      )
    } catch (err) {
      const errorMessages = ['エラーが発生しました。エラーを確認して下さい。']
      if (err.response && err.response.data.error) {
        errorMessages.push(err.response.data.error)
      }

      commit('setErrorMessages', errorMessages)
      console.log(err)
    }
  }
}

export const mutations = {
  setErrorMessages(state, errorMessages) {
    state.errorMessages = errorMessages
  },
  resetState(state) {
    Object.assign(state, defaultState())
  }
}
