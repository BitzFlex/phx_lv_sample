let Hooks = {};

Hooks.ScrollToBotton = {
  mounted() {
    this.scrollToBottom();

    this.handleEvent("event_by_click", param => {console.log ["client received event", param]})

  },
  updated() {
    this.scrollToBottom();
  },
  scrollToBottom() {
    let el = this.el;
    el.scrollTop = el.scrollHeight;
  },
};



export default Hooks;
