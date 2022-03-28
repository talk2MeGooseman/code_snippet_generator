import { EditorState, EditorView, basicSetup } from "@codemirror/basic-setup"
import { javascript } from "@codemirror/lang-javascript"

export const Code = {
  mounted() {
    new EditorView({
      state: EditorState.create({
        doc: document.getElementById('display-code').innerText,
        extensions: [basicSetup, javascript()]
      }),
      parent: this.el
    })
  }
}
