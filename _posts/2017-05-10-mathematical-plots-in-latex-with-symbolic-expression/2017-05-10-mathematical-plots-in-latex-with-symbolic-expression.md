---
title:  "Mathematical plots in LaTeX with symbolic expressions"
date:   2017-05-10 15:33:25 +0100
#tags: LaTeX tikz

header-includes:
  - \usepackage{tikz}
---

Pretty ofted I need to include mathematical plots in my LaTeX documents. Using an external tools such as R to generate the plot and then including it to the documents is unconfortable and leads to many maintenance problems. Fortunetly, LaTeX provides several ways to overcome this problem. 

A very convenient method to mathematical plotting from LaTeX from Tikz. An example follows.

<script src="https://gist.github.com/dfbarrero/0543623a566f56e2df42ecd681681b8f.js"></script>

In the example x and y labels are set as LaTeX expressions, so it is straightforward to show complex mathematical expressions. The formula that is actually depicted is another expression used with the command `\addplot`. The previous code generates the following plot.

<div style="max-width: 300px; padding-bottom: 20px;" align="center">
{% tikz mathematicalplot | arrows | scale=1.0 %}
     \begin{axis}[
          xlabel=$x$,
          ylabel={$g(x) = \frac{1}{1+e^{-x}}$}
     ]
     \addplot[mark=none] {1/(1+e^(-x))};
     \end{axis}
{% endtikz %}
</div>

Customizing the output is quite easy, as the next example shows.


<div style="max-width: 300px; padding-bottom: 20px;" align="center">
{% tikz mathematicaloverlapplot | arrows | scale=1.0 %}
     \begin{axis}[
          xlabel=$x$,
          ylabel=$y$,
          domain=-2:4
     ]
     \addplot[color=red] {sin(deg(x))};
     \addplot[color=blue] {cos(deg(x)};
     \legend{$\sin(x)$,$\cos(x)$}
     \end{axis}
{% endtikz %}
</div>

The LaTeX/Tikz code that generates the previous plot is: 

<script src="https://gist.github.com/dfbarrero/bd789f82b6aec2960da843f2f7988617.js"></script>

In this case the function ``deg`` transforms radians to degrees, the x domain is restricted to [-2, 4], two plots are overlapped with different colors and the plot includes a leyend.

