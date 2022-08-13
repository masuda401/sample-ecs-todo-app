import { shallowMount } from '@vue/test-utils'
import TaskItem from '@/components/TaskItem.vue'

describe('TaskItem', () => {
  test('should show task title and description', () => {
    const props = {
      task: {
        id: 1,
        title: 'Implement API',
        description: 'Implement an API to retrieve Todo',
        status: 0,
        created_at: "2022-08-13T23:59:39.057161+09:00",
      }
    }

    const wrapper = shallowMount(TaskItem, {
      propsData: props
    })

    expect(wrapper.find('.title').text()).toBe('Implement API')
    expect(wrapper.find('.description').text()).toBe('Implement an API to retrieve Todo')
  })
})
