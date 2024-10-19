import { Controller } from "@hotwired/stimulus"
import axios from 'axios'

export default class extends Controller {
  static targets = ["form", "content", "messages"]

  connect() {
    this.fetchMessages()
  }

  async fetchMessages() {
    const senderId = this.element.dataset.senderId
    const receiverId = this.element.dataset.receiverId
    const response = await axios.get(`/messages?sender_id=${senderId}&receiver_id=${receiverId}`)
    this.messagesTarget.innerHTML = response.data.map(message => `
      <div>
        <p>${message.content}</p>
        <small>${new Date(message.created_at).toLocaleString()}</small>
      </div>
    `).join('')
  }

  async sendMessage(event) {
    event.preventDefault()
    const senderId = this.element.dataset.senderId
    const receiverId = this.element.dataset.receiverId
    const content = this.contentTarget.value

    await axios.post('/messages', { message: { sender_id: senderId, receiver_id: receiverId, content } })
    this.contentTarget.value = ''
    this.fetchMessages()
  }
}
