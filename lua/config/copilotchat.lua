require("CopilotChat").setup({
  window = {
    width = 0.4,
  },
  show_help = false,
  question_header = "",
  answer_header = "",
  error_header = "E",
  mappings = {
    submit_prompt = {
      normal = "<CR>",
      insert = "<C-s>",
    },
  },
})
