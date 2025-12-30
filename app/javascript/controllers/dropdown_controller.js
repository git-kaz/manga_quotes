import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["menu"]

    toggle() {
        this.menuTarget.classList.toggle("hidden")
    }

    hide(event) {
        //メニュー外のクリックで閉じる
        if (!this.element.contains(event.target)) {
            this.menuTarget.classList.add("hidden")
        }
    }
}