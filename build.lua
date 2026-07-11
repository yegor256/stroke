-- SPDX-FileCopyrightText: Copyright (c) 2021-2026 Yegor Bugayenko
-- SPDX-License-Identifier: MIT

module = "stroke"
ctanupload = true
typesetopts = "-interaction=batchmode -shell-escape -halt-on-error"
checkopts = "-interaction=batchmode -shell-escape -halt-on-error"
tagfiles = {"build.lua", "stroke.dtx"}
checkengines = {"pdftex", "luatex", "xetex"}

uploadconfig = {
  pkg = "stroke",
  update = false,
  version = "0.0.0 0000-00-00",
  author = "Yegor Bugayenko",
  uploader = "Yegor Bugayenko",
  email = "yegor256@gmail.com",
  note = "Fix the colored option and load the required tikz libraries",
  announcement = "",
  ctanPath = "/macros/latex/contrib/stroke",
  bugtracker = "https://github.com/yegor256/stroke/issues",
  home = "",
  description = "This LaTeX package provides the \\stroke command, which underlines a word or a phrase with a line that looks as if it were drawn by hand. A straight, ruler-perfect rule blends into the text and is easy to overlook, whereas an uneven, hand-drawn stroke stands apart from the page and catches the reader's eye. The line can optionally be tinted in any color.",
  development = "",
  license = "mit",
  summary = "Eye-catching hand-drawn underline",
  repository = "https://github.com/yegor256/stroke",
  support = "",
  topic = {"underline"}
}

function update_tag(file, content, tagname, tagdate)
  return string.gsub(
    string.gsub(content, "0%.0%.0", tagname),
    "0000%-00%-00", os.date("%Y-%m-%d")
  )
end
