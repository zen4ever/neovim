return {
  "jackMort/ChatGPT.nvim",
  keys = {
    { "<leader>vg", "<cmd>ChatGPT<cr>", desc = "ChatGPT", mode = "n" },
    { "<leader>vi", "<cmd>ChatGPTEditWithInstructions<cr>", desc = "ChatGPTEditWithInstructions" },
    { "<leader>ve", "<cmd>ChatGPTRun explain_code<cr>", desc = "ChatGPTRun explain_code", mode = { "n", "v" } },
    { "<leader>vf", "<cmd>ChatGPTRun fix_bugs<cr>", desc = "ChatGPTRun fix_bugs", mode = { "n", "v" } },
    { "<leader>vc", "<cmd>ChatGPTCompleteCode<cr>", desc = "ChatGPTCompleteCode", mode = { "n", "v" } },
    { "<leader>va", "<cmd>ChatGPTActAs<cr>", desc = "ChatGPTActAs" },
  },
  config = function()
    local chatgpt = require("chatgpt")
    chatgpt.setup({
      api_key_cmd = "op item get OPENAI_MBAIR --account my.1password.com --fields label=password",
      openai_params = {
        model = "gpt-4-turbo-preview",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 300,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
      openai_edit_params = {
        model = "gpt-4-turbo-preview",
        frequency_penalty = 0,
        presence_penalty = 0,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
    })
    vim.keymap.set(
      "n",
      "<leader>v",
      chatgpt.edit_with_instructions,
      { remap = false, desc = "ChatGPT edit with instructions" }
    )
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
