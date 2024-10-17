let Hooks = {};

Hooks.ScrollToBotton = {
  mounted() {
    this.scrollToBottom();
  },
  updated() {
    this.scrollToBottom();
  },
  scrollToBottom() {
    let el = this.el;
    el.scrollTop = el.scrollHeight;
  }
};

export default Hooks;
