---
title: Hilbert's tenth problem over rings of algebraic integers
subtitle: Miscellaneous comments on subjects of the talk
author: Tim B. Herbstrith
date: 28 February 2020
keywords: [number theory, theoretical computer science, decidability]
---

# Remarks on the main lemma

<span>
\DeclareMathOperator{\N}{\mathbb{N}}
\DeclareMathOperator{\Z}{\mathbb{Z}}
\DeclareMathOperator{\Q}{\mathbb{Q}}
\DeclareMathOperator{\R}{\mathbb{R}}
\DeclareMathOperator{\C}{\mathbb{C}}
\DeclareMathOperator{\F}{\mathbb{F}}

\DeclareMathOperator{\Aut}{Aut}
\DeclareMathOperator{\id}{id}

\DeclareMathOperator{\kernel}{ker}
\DeclareMathOperator{\im}{im}
\DeclareMathOperator{\rk}{rk}
\DeclareMathOperator{\End}{\mathrm{End}}
\DeclareMathOperator{\Hom}{\mathrm{Hom}}
\DeclareMathOperator{\D}{\mathrm{D}}
\DeclareMathOperator{\lcm}{\mathrm{lcm}}
\DeclareMathOperator{\ord}{\mathrm{ord}}

\newcommand*{\sta}{\texttt{\S}}
\newcommand*{\emp}{{\monomath \_}}
\newcommand*{\zer}{\mathtt 0}
\newcommand*{\one}{\mathtt 1}
\newcommand*{\state}[1]{s_{\text{#1}}}
\newcommand*{\sstart}{\state{start}}
\newcommand*{\shalt}{\state{halt}}
\newcommand*{\scheck}{s_{\text{check}}}
\newcommand*{\enc}[1]{\ulcorner #1 \urcorner}
\newcommand*{\rel}[1]{\mathrel{\MakeUppercase #1}}
\newcommand*{\algint}[1][K]{\mathcal{O}_{#1}}
\newcommand*{\modalgint}[1][K]{\mathfrak{O}_{#1}}
\newcommand*{\Norm}[1][L/K]{\mathrm N_{#1}}
\newcommand*{\px}{\mathrm x}
\newcommand*{\py}{\mathrm y}
\newcommand*{\sigmaK}[1]{{\left(#1\right)}^*}
\newcommand{\set}[1]{\left\lbrace #1 \right\rbrace}
\newcommand*{\seq}[2][n]{{#2}_1, \ldots, {#2}_{#1}}
\newcommand*{\lang}{\mathcal{L}}
\newcommand*{\Quot}{\mathrm{Quot}}
\newcommand*{\Mod}{\mathrel{\mathrm{mod}}}
</span>

## Estimates for $a$

One uses [strong approximation theorem](#strong-approximation-theorem) to find
an $a ∈ \algint$ satisfying the estimates

::: small
$$\begin{cases}
  r_K = n > 1\\
  a > 2^{2(n + 1)}\\
  0 < σ_i(a) < \frac{1}{2} &\text{for } 1 < i ≤ n
\end{cases}
\quad \text{or} \quad
\begin{cases}
  r_K = n - 2 > 0\\
  |σ_i(a)| > 2^{2(n + 1)} &\text{for } i ∈ \set{1, 2}\\
  0 < σ_i(a) < \frac{1}{2} &\text{for } 2 < i ≤ n
\end{cases},$$
:::

of the [main lemma](./index.html#main-lemma).

## Strong vertical method

### Theorem [@Denef1978]

Let $L/K$ be an extension of number fields and $n = [L : ℚ]$. If $x, y ∈
\algint[L]$, $y ≠ 0$, and $α ∈ \algint$ satisfy
$$
\begin{aligned}
  & |σ_i(x)| < \frac{1}{2} |N_{L/ℚ}(y)|^{\frac{1}{n}}
    \text{ for all } 1 ≤ i ≤ n, \\
  & |σ_i(α)| < \frac{1}{2} |N_{L/ℚ}(y)|^{\frac{1}{n}}
    \text{ for all } 1 ≤ i ≤ n, \text{ and}\\
  & x \equiv α \mod (y) \text{ in } \algint[L],
\end{aligned}
$$
where $\seq{σ}$ denote the embeddings of $L$ into the complex pane
$ℂ$. Then
$$
  x = α ∈ \algint.
$$

## Approximations of real embeddings are Diophantine

### Lemma [@Denef1980]

Let $K$ be a number field and $σ: K → ℝ$ be a real embedding. Then the
relation $σ(α) ≥ 0$ is Diophantine over $\algint$.

. . .

As a consequence, the relations of the [main lemma](./index.html#main-lemma)
$$
\begin{array}{lr}
0 < σ_i(b) < 2^{-18}, & s_K + 1 < i ≤ n \\
\begin{cases}
  |σ_i(z)| ≥ C \\
  |σ_i(u)| ≥ ½
\end{cases}, & s_K + 1 < i ≤ n\\
\end{array}
$$
are Diophantine.

::: notes
Replace $α$ by $u - ½$.
:::

<!--
██       ██████   ██████     ███████ ██      ██████  ███████
██      ██    ██ ██          ██      ██      ██   ██ ██
██      ██    ██ ██          █████   ██      ██   ██ ███████
██      ██    ██ ██          ██      ██      ██   ██      ██
███████  ██████   ██████     ██      ███████ ██████  ███████
-->
# Local fields

## Absolute values

An *absolute value* on a field $K$ is a function $|\cdot| : K → ℝ, x ↦
|x|$ with the properties

* $|x| ≥ 0$ for all $x ∈ K$ and $|x| = 0$ if and only if $x = 0$;
* $|xy| = |x| |y|$ for all $x, y ∈ K$; and
* $|x + y| ≤ |x| + |y|$ for all $x, y ∈ K$.

If additionally the stronger condition

* $|x + y| ≤ \max(|x|, |y|)$

holds for all $x, y ∈ K$ then $|\cdot|$ is called a \emph{non-archimedian
absolute value}.

## Absolute values of a number field

Let $K$ be a number field. Then $K$ has the following absolute values

* a trivial absolute value defined by $|0|_1 := 0$ and $|x|_1 :=
  1$ for all $x ∈ K \setminus \set{0}$;

* one absolute value for each embedding $σ: K → ℂ$ by setting $|x| :=
  |σ(a)|_ℂ$, where $|\cdot|_{ℂ}$ denotes the complex modulus; and

* one \emph{$\mathfrak{p}$-adic absolute value} for each non-zero
  prime ideal $\mathfrak{p}$ defined by
  $$
    |x|_{\mathfrak{p}} :=
     \left(\frac{1}{ℕ\mathfrak{p}}\right)^{\ord_{\mathfrak{p}}(x\algint)},
  $$
  where $ℕ\mathfrak{p} := [\algint : \mathfrak{p}]$.

## Strong approximation theorem

Let $K$ be a number field, let $\mathcal{M}_K$ be the set of all the
absolute values of $K$, let $\mathcal{F}_K = \set{|\cdot|_1,… ,|\cdot|_ℓ}
⊂ \mathcal{M}_K$ be a non-empty finite subset, and let $a_1,…,a_{ℓ - 1} ∈
K$. Then for any $ε > 0$ there exists an $x ∈ K$ such that the following
conditions are satisfied.

* For $1 ≤ i ≤ ℓ - 1$ we have that $|x − a_i|_i <ε$.

* For any absolute value $|\cdot|$ not contained in $\mathcal{F}_K$
we have that $|x| ≤ 1$.

<!--
███████  █████   ██████ ████████ ███████
██      ██   ██ ██         ██    ██
█████   ███████ ██         ██    ███████
██      ██   ██ ██         ██         ██
██      ██   ██  ██████    ██    ███████
-->
# Known facts and related problems

## What we know 1

### Theorem [@Goedel1931;@Rosser1936]

The full theory $\mathtt{Th}(\mathfrak{N})$ of $ℕ$ is undecidable.

. . .

#### Corollary

The full theory $\mathtt{Th}(\mathfrak{Z})$ of $ℤ$ is undecidable.

. . .

#### Theorem [@Robinson1959]

The full first order theories $\mathtt{Th}(\mathfrak{K})$ and
$\mathtt{Th}(\mathfrak{O}_K)$ are undecidable for every number field $K$.


## What we know 2

### Theorem

The full theory $\mathtt{Th}(\mathfrak{C})$ of $ℂ$ is decidable. Thus,
$\mathtt{H10}^*(\mathfrak{C})$ is decidable.

. . .


#### Theorem [@Rumely1986;@Dries1988]

The theories $\mathtt{H10}(\mathfrak{O})$ and $D^c(\mathfrak{O})$ of the
integral closure $\algint[]$ of $ℤ$ are decidable.



## What we know 3

### DPRM theorem [@Matijasevic1970]

A subset of $ℤ$ is semi-decidable if and only if it is Diophantine over $ℤ$.

. . .

#### Corollary

$\mathtt{H10}(\mathfrak{Z})$ is undecidable.



## What we know 4

### Theorem

$\mathtt{H10}(\mathfrak{O}_K)$ is undecidable if

* $K$ is totally real [@Denef1980],
* $K$ has exactly one pair of non-real embeddings [@Pheidas1988; @Shlapentokh1989],
* if $K$ is a quadratic extension of a totally real number field [@Denef1978], or
* if $K$ is a subfield of a field with one of the properties above [@Shapiro1989].


## What we would like to know

* Are $\mathtt{H10}(\mathfrak{O}_K)$ and $\mathtt{H10}(\mathfrak{K})$
  undecidable for all number fields $K$?
* Especially: Is Hilbert's tenth problem $\mathtt{H10}(\mathfrak{Q})$ over $ℚ$
  decidable?

## References
