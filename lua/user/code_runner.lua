local M = {}
M.config = function()
  local status_ok, code_runner = pcall(require, "code_runner")
  if not status_ok then
    return
  end
  code_runner.setup {
    startinsert = true,
    mode = "toggle",
    focus = true,

    -- project_path = "~/.config/lvim/project_manager.json",

    -- put here the commands by filetype
    filetype = {
      java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
      python = "python3 -u",
      typescript = "deno run",
      javascript = "cd $dir && node $dir/$fileName",
      rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",

      -- c = "cd $dir && gcc $fileName -ggdb3 -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
      --use above line and comment the function below to skip asking for compiler everytime
      c = function()
        local compiler = vim.fn.input("Select compiler 1.Clang 2.GCC 3.Custom command : ")
        if compiler == "1" then
          print(" Using Clang")
          return "cd $dir && clang $fileName -Wall -o $fileNameWithoutExt && ./$fileNameWithoutExt"
        elseif compiler == "2" then
          print(" Using GCC")
          return "cd $dir && gcc $fileName -Wall -o $fileNameWithoutExt && ./$fileNameWithoutExt"
        elseif compiler == "3" then
          local command = vim.fn.input("Enter command : ")
          return command
        else
          print(" : Invalid Choice")
        end
      end,

      cpp = function()
        local compiler = vim.fn.input("Select compiler 1.Clang++ 2.g++ 3.Custom command : ")
        if compiler == "1" then
          print(" Using Clang++")
          return "cd $dir && clang++ $fileName -Wall -std=c++17 -o $fileNameWithoutExt && ./$fileNameWithoutExt"
        elseif compiler == "2" then
          print(" Using g++")
          return "cd $dir && g++ $fileName -g -Wall -std=c++17 -o $fileNameWithoutExt && ./$fileNameWithoutExt"
        elseif compiler == "3" then
          local command = vim.fn.input("Enter command : ")
          return command
        else
          print(" : Invalid Choice")
        end
      end,
      -- cpp = "cd $dir && g++ $fileName -g -std=c++17 -o $fileNameWithoutExt && ./$fileNameWithoutExt",
    },

    -- template to add projects in future
    project = {
      ["~/project"] = {
        name = "Test Project",
        description = " Project in C",
        command = "gcc *.c && ./a.out",
      },
      ["~/code/cpp/project"] = {
        name = "Test Project",
        description = " Project in Cpp",
        command = "g++ *.cpp && ./a.out",
      }
    }
  }
end
return M
