-- SPDX-FileCopyrightText: Copyright (c) 2021-2026 Yegor Bugayenko
-- SPDX-License-Identifier: MIT

module = "handstroke"
ctanupload = true
typesetopts = "-interaction=batchmode -shell-escape -halt-on-error"
checkopts = "-interaction=batchmode -shell-escape -halt-on-error"
tagfiles = {"build.lua", "handstroke.dtx"}
checkengines = {"pdftex", "luatex", "xetex"}

uploadconfig = {
  pkg = "handstroke",
  version = "0.4.0 2026-07-13",
  author = "Yegor Bugayenko",
  uploader = "Yegor Bugayenko",
  email = "yegor256@gmail.com",
  note = "Fix the colored option and load the required tikz libraries",
  announcement = "",
  ctanPath = "/macros/latex/contrib/handstroke",
  bugtracker = "https://github.com/yegor256/handstroke/issues",
  home = "",
  description = "This LaTeX package provides the \\handstroke command, which underlines a word or a phrase with a line that looks as if it were drawn by hand. A straight, ruler-perfect rule blends into the text and is easy to overlook, whereas an uneven, hand-drawn handstroke stands apart from the page and catches the reader's eye. The line can optionally be tinted in any color.",
  development = "",
  license = "mit",
  summary = "Eye-catching hand-drawn underline",
  repository = "https://github.com/yegor256/handstroke",
  support = "",
  topic = {"underline"}
}

function update_tag(file, content, tagname, tagdate)
  return string.gsub(
    string.gsub(content, "0%.0%.0", tagname),
    "0000%-00%-00", os.date("%Y-%m-%d")
  )
end

-- Fail the build when the typesetting log reports a warning, since
-- l3build otherwise swallows overfull boxes and package warnings.
local pdftypeset = typeset
function typeset(file, dir, exe)
  local errorlevel = pdftypeset(file, dir, exe)
  if errorlevel ~= 0 then
    return errorlevel
  end
  local log = dir .. "/" .. jobname(file) .. ".log"
  local handle = io.open(log, "r")
  if not handle then
    return 0
  end
  local warnings = 0
  for line in handle:lines() do
    if line:find("^Overfull") or line:find("^Underfull")
      or line:find("Warning") then
      print("! " .. line)
      warnings = warnings + 1
    end
  end
  handle:close()
  if warnings > 0 then
    print("Typesetting of " .. jobname(file) .. " left "
      .. warnings .. " warning(s) unresolved")
    return 1
  end
  return 0
end
