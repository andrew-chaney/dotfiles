return {
  {
    "google/vim-maktaba",
  },
  {
    "google/vim-glaive",
  },
  {
    "google/vim-codefmt",
    dependencies = {
      "google/vim-maktaba",
      "google/vim-glaive",
    },
    config = function()
      vim.cmd("call glaive#Install()")
      vim.cmd("Glaive codefmt plugin[mappings]")
      vim.cmd([[Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"]])
    end,
  },
}
