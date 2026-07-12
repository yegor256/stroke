# LaTeX Command for a Hand-Written Underline

[![make](https://github.com/yegor256/handstroke/actions/workflows/l3build.yml/badge.svg)](https://github.com/yegor256/handstroke/actions/workflows/l3build.yml)
[![CTAN](https://img.shields.io/ctan/v/handstroke)](https://ctan.org/pkg/handstroke)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/handstroke/blob/master/LICENSE.txt)

A plain, ruler-straight underline blends into the text and is easy to miss.
This LaTeX package underlines a word or a phrase with a line that looks
  drawn by hand: it wavers a little, stands apart from the letters,
  and catches the reader's eye where an ordinary rule would go unnoticed.
The package draws the stroke with the [pgf] package.

First, [install it] from [CTAN] and then use in the preamble:

```tex
\documentclass{article}
\usepackage{handstroke}
\begin{document}
Please, don't forget \handstroke{this}!
\end{document}
```

Otherwise, you can download [handstroke.sty] and add it to your project.

If you want to contribute yourself, make a fork, then create a branch,
  then run `l3build ctan` in the root directory.
It should compile everything without errors.
If not, submit an issue and wait.
Otherwise, make your changes and then run `l3build ctan` again.
If the build is still clean, submit a pull request.

[install it]: https://en.wikibooks.org/wiki/LaTeX/Installing_Extra_Packages
[CTAN]: https://ctan.org/pkg/handstroke
[handstroke.sty]: https://yegor256.github.io/handstroke/handstroke.sty
[pgf]: https://ctan.org/pkg/pgf
