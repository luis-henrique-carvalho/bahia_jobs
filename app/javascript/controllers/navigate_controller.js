import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'

export default class extends Controller {
  static values = { url: String }

  async to (element) {
    const params = new URLSearchParams()
    params.set(element.target.name, element.target.value)

    await get(`${this.urlValue}?${params}`, { responseKind: 'turbo-stream' })
  }
}
