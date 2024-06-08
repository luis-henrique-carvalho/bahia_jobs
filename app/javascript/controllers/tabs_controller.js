import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["tab", "content"]

    showTab(event) {
        event.preventDefault()
        const clickedTab = event.target // Link clicado

        // Desativa todas as abas e seus conteúdos
        this.tabTargets.forEach(tab => tab.classList.remove("active"))
        this.contentTargets.forEach(content => content.classList.remove("active"))

        // Ativa a aba clicada e seu respectivo conteúdo
        clickedTab.classList.add("active")
        const targetContentId = clickedTab.getAttribute("href")
        const targetContent = document.querySelector(targetContentId)
        targetContent.classList.add("active")
    }
}
