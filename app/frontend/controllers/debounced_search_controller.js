import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input", "icon"];
    timeoutId = null;
    search() {
        this.#updateClass();
        if(this.timeoutId) {
            clearTimeout(this.timeoutId);
        }
        if(!this.hasContent()) {
            this.submitForm();
            return;
        }

        this.timeoutId = setTimeout(() => {
            this.submitForm();
        }, 300);
    }

    clear() {
        this.inputTarget.value = "";
        this.search();
    }

    submitForm() {
        this.element.requestSubmit();
    }

    hasContent() {
        return this.inputTarget.value.trim().length > 0;
    }

    #updateClass(){
        if(this.hasContent()){
            this.iconTarget.classList.add('swap-active');
        } else {
            this.iconTarget.classList.remove('swap-active');
        }
    }
}