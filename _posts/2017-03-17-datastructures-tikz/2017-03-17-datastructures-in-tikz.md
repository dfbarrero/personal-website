---
title:  "Data structures in Tikz"
date:   2017-03-17 15:33:25 +0100
#tags: jekyll update

header-includes:
  - \usepackage{tikz}
---

These figures were create to support one of my lectures, however, I am far from being a Tikz expert, surely there are better ways to use Tikz. None of these examples was created from scratch.

## Vector (1-D array)

<div style="max-width: 250px; padding-bottom: 20px;" align="center">
{% tikz vector | matrix,chains,positioning,decorations.pathreplacing,arrows,shapes | nodes in empty cells, nodes={minimum width=0.5cm, minimum height=0.5cm}, row sep=-\pgflinewidth, column sep=-\pgflinewidth, scale=0.5 %}
     \matrix(vector)[matrix of nodes,
          row 1/.style={nodes={draw=none, minimum width=0.3cm}},
          nodes={draw}] {
     \tiny{0} & \tiny{1} & \tiny{2} & \tiny{3}\\
     $a_{0}$ & $a_{1}$ & $a_{2}$ & $a_{3}$\\
};
{% endtikz %}
</div>

<script src="https://gist.github.com/dfbarrero/7acfa85098a52ae75ed38003fccda6b7.js"></script>

## Matrix (2-D array)

<div style="max-width: 300px; padding-bottom: 20px;" align="center">
{% tikz matrix | matrix,chains,positioning,decorations.pathreplacing,arrows,shapes | nodes in empty cells, nodes={minimum width=0.5cm, minimum height=0.5cm}, row sep=-\pgflinewidth, column sep=-\pgflinewidth  %}
       border/.style={draw}
       \matrix (matrix)[matrix of nodes, column 1/.style={nodes={draw=none, minimum width=0.3cm,  minimum height=0.3cm}},
               row 1/.style={nodes={draw=none, minimum width=0.3cm}},
                       nodes={draw}]
                       {
                               & \tiny{0} & \tiny{1} & \tiny{2} & \tiny{3}\\
                                \tiny{0} & $a_{0,0}$ & $a_{0,1}$ & $a_{0,2}$ & $a_{0,3}$\\
                                 \tiny{1} & $a_{1,0}$ & $a_{1,1}$ & $a_{1,2}$ & $a_{1,3}$\\
                                  \tiny{2} & $a_{2,0}$ & $a_{2,1}$ & $a_{2,2}$ & $a_{2,3}$\\
                       };
{% endtikz %}
</div>

<script src="https://gist.github.com/dfbarrero/0b198bc7e57dd99b88eef0a0cc564f11.js"></script>

## Stack

<div style="max-width: 200px; padding-bottom: 20px;" align="center">
{% tikz stack | matrix,chains,positioning,decorations.pathreplacing,arrows,shapes | draw, minimum width=1cm, minimum height=0.5cm  %}
    \node[draw] (in) at (-1,2) {};
    \node[draw] (out) at (1,2) {};
    \matrix (queue)[matrix of nodes, nodes={draw, nodes={draw}}, nodes in empty cells]
    {
         \\ \\ \\ \\
    };

    \draw[-latex] (0.25,1) .. controls (0.25,1.5) and (1,1.5) .. (out.south);
    \draw[-latex] (in.south) .. controls (-1, 1.5) and (-0.25,1.5) .. (-0.25,1);
{% endtikz %}
</div>

<script src="https://gist.github.com/dfbarrero/0b198bc7e57dd99b88eef0a0cc564f11.js"></script>

## Queue

<div style="max-width: 200px; padding-bottom: 20px;" align="center">
{% tikz queue | matrix,chains,positioning,decorations.pathreplacing,arrows,shapes | draw, minimum width=1cm, minimum height=0.5cm  %}
    \node[draw] (in) at (-1,2) {};
    \node[draw] (out) at (1,-2) {};
    \matrix (queue)[matrix of nodes, nodes={draw, nodes={draw}}, nodes in empty cells]
    {
       \\ \\ \\ \\
    };

    \draw[-latex] (0.25,-1) .. controls (0.25,-1.25) and (1,-1.25) .. (out.north);
    \draw[-latex] (in.south) .. controls (-1, 1.5) and (-0.25,1.5) .. (-0.25,1);
{% endtikz %}
</div>

<script src="https://gist.github.com/dfbarrero/02d42b26bc6e89d82cb83f9e445c146e.js"></script>

## Linked list

This figure was taken and modified from [StackExhange](http://tex.stackexchange.com/questions/76267/creating-tikz-node-using-macro).

<div style="max-width: 300px; padding-bottom: 20px;" align="center">
{% tikz list | matrix,chains,positioning,decorations.pathreplacing,arrows,shapes | every node/.style={rectangle split, rectangle split parts=2, rectangle split horizontal,minimum height=14pt}, node distance=1em, start chain, every join/.style={->, shorten <=-4.5pt}  %}
    \node[draw, on chain, join] {   };
    \node[draw, on chain, join] {   };
    \node[draw, on chain, join] {};
    \chainlabel{chain-1.one north}{};
{% endtikz %}
</div>

<script src="https://gist.github.com/dfbarrero/0b412c9d973ec48f596f6e3e8d3c1760.js"></script>

## Hash table (associative array)

<div style="max-width: 200px; padding-bottom: 20px;" align="center">
{% tikz hashtable | matrix,chains,positioning,decorations.pathreplacing,arrows,shapes | nodes={minimum width=0.8cm, minimum height=0.8cm}, row sep=-\pgflinewidth, column sep=-\pgflinewidth  %}

    \matrix (hash)[matrix of nodes, nodes={draw, anchor=center}] {
       Key1 & Value1 \\
       Key2 & Value2 \\
       Key3 & Value3 \\
    };

{% endtikz %}
</div>

<script src="https://gist.github.com/dfbarrero/228b4363ff06f8d2e7f21392d4830cbf.js"></script>


## Tree

This figure was taken and modified from [StackExhange](http://tex.stackexchange.com/questions/2340/how-to-make-a-3-level-deep-tree-with-tikz).

<div style="max-width: 300px; padding-bottom: 20px;" align="center">
{% tikz tree | matrix,chains,positioning,decorations.pathreplacing,arrows,shapes | level distance=1.3cm, level 1/.style={sibling distance=3cm, level distance=1cm}, level 2/.style={sibling distance=1.5cm, level distance=0.8cm}  %}
\node {Root}
   child {node {Child}
   child {node {Node}}
   child {node {Node}}
               }
   child {node {Level 2}
   child {node {Level 3}}
   child {node {Level 3}}
};
{% endtikz %}
</div>

<script src="https://gist.github.com/dfbarrero/24b5ae208e8c5627aab073a99d1e1cfa.js"></script>

## Graph

This figure was taken and modified from [StackExhange](http://tex.stackexchange.com/questions/166083/showing-weights-on-tikz-graph-using-draw-edge-commands).

<div style="max-width: 300px; padding-bottom: 20px;" align="center">
{% tikz graph | matrix,chains,positioning,decorations.pathreplacing,arrows,shapes | scale=1  %}
     \tikzstyle{node_style} = [circle,draw=black]
     \tikzstyle{edge_style} = [draw=black]
     \node[node_style] (v1) at (-2,2) {2};
     \node[node_style] (v2) at (2,2) {3};
     \node[node_style] (v3) at (4,0) {6};
     \node[node_style] (v4) at (2,-2) {4};
     \node[node_style] (v5) at (-2,-2) {5};
     \node[node_style] (v6) at (-4,0) {1};
     \draw[edge_style]  (v1) edge (v2);
     \draw[edge_style]  (v2) edge (v3);
     \draw[edge_style]  (v3) edge (v4); 
     \draw[edge_style]  (v4) edge (v5); 
     \draw[edge_style]  (v5) edge (v6); 
     \draw[edge_style]  (v6) edge (v1); 
     \draw[edge_style]  (v5) edge (v1); 
     \draw[edge_style]  (v5) edge (v2); 
     \draw[edge_style]  (v4) edge (v2);
{% endtikz %}
</div>

<script src="https://gist.github.com/dfbarrero/dccb24d3cc39a494bc62338d11a7e22d.js"></script>

