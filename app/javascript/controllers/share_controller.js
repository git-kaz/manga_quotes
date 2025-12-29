import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  static values = {
    url: String
  }

  shareX() {
    const shareUrl = this.urlValue;
  

    const width = 550;
    const height = 420;
    const left = (screen.width - width) / 2;
    const top = (screen.height - height) / 2;

    window.open(
      shareUrl,
      'x-share',
      `width=${width},height=${height},top=${top},left=${left},toolbar=0,menubar=0,scrollbars=yes`
    );
  }
}
