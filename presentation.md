---
title: Hilbert's tenth problem over rings of algebraic integers
subtitle: Master Defence
author: Tim B. Herbstrith
date: 28 February 2020
keywords: [number theory, theoretical computer science, decidability]
---

<!--
██   ██  ██  ██████
██   ██ ███ ██  ████
███████  ██ ██ ██ ██
██   ██  ██ ████  ██
██   ██  ██  ██████
-->
# Hilbert's tenth problem, Turing machines, and decidability

## Hilbert's tenth problem

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

:::::::::::::: {.columns}
::: {.column width="65%"}
> Given a Diophantine equation with any number of unknown quantities and with
> <span class="fragment highlight-current-red" data-fragment-index="3">
    rational integral
  </span>
> numerical coefficients: To devise a
> <span class="fragment highlight-current-red" data-fragment-index="1">
    process
  </span>
> according to which it can be
> <span class="fragment highlight-current-red" data-fragment-index="2">
    determined
  </span>
> by a
> <span class="fragment highlight-current-red" data-fragment-index="1">
    finite number of operations
  </span>
> whether the
> <span class="fragment highlight-current-red" data-fragment-index="2">
    equation is solvable
  </span>
> in
> <span class="fragment highlight-current-red" data-fragment-index="3">
    rational integers.
  </span>
>
> – @Hilbert1900
:::
::: {.column width="30%"}
![Portrait of David Hilbert (1912)</br>[Published in @Reid1970]](imgs/Hilbert.jpg){#fig:David-Hilbert}
:::
::::::::::::::

## Decision problems

### Definition

A *decision problem* is a subset of the set of finite $\mathtt 0$-$\mathtt
1$-strings $ω = \lbrace \mathtt{0, 1} \rbrace^*$ including the empty string
$\lambda$.

. . .

### Example: Simple graphs

The set of all simple graphs can be encoded by strings of the form

$$
    \begin{array}{lllll}
        x := & b_{1, 2} & b_{1, 3} & …      & b_{1, n}\\
             &    & b_{2, 3} & …      & b_{2,n}\\
             &    &          & \ddots & \vdots \\
             &    &          &        & b_{n-1, n},
    \end{array}
$$

## Turing machines

:::::::::::::: {.columns}
::: {.column width="55%"}

### Definition

A *Turing machine* $\mathbb{A}$ on the *alphabet*
$A = \lbrace\mathtt{\sta, \_, 0, 1}\rbrace$ consists of

*  a finite *set of states* $S$ containing $s_{start}, s_{halt}$ and
*  a *transition function*

$$δ: S \times A \to S \times A \times \lbrace -1, 0, 1 \rbrace.$$

:::
::: {.column width="40%"}
![Turing machine increasing a binary number by 1](imgs/turing_add1.gif){#fig:add1}
:::
::::::::::::::

. . .

I write $\mathbb{A}(x)$ for the output of Turing machine $\mathbb{A}$ on input
$x ∈ ω$ if $\mathbb{A}$ halts on $x$.


## Computability, decidability, and semi-decidability

### Definition

> * A partial function $f: ω \to ω$ is *computable* if there is a Turing machine $\mathbb{A}$ with $\mathbb{A}(x) = f(x)$ for all $x$ in the domain of $f$.
> * A decision problem is *decidable* if its characteristic function is computable.
> * A decision problem $Q$ is *semi-decidable* or *computably enumerable* if there is a Turing machine that returns $\mathtt{1}$ on all members of $Q$.


## Characterizations of semi-decidable sets

### Proposition {#sec:semi-decidable label=Proposition}

Let $Q \subseteq ω$ be a problem. The following are equivalent.

* $Q$ is semi-decidable.
* $Q$ is the range of a computable function.
* There exists a computable binary relation $R$ on $ω^2$ such that
  $$ x \in Q \Leftrightarrow \exists y : R(x, y)$$

## The halting set

### Definition

The *halting set* is the set of all codes of Turing machines $\mathbb{A}$ that halt upon receiving their code as input i.e.

$$\mathcal{K} := \set{\enc{\mathbb{A}} \mid \mathbb{A} \text{ halts on } \enc{\mathbb{A}}}$$

. . .

### Theorem

The halting set $\mathcal{K}$ is semi-decidable but not decidable.


<!--
███    ██ ██    ██ ███    ███        ████████ ██   ██ ███████  ██████
████   ██ ██    ██ ████  ████           ██    ██   ██ ██      ██    ██
██ ██  ██ ██    ██ ██ ████ ██           ██    ███████ █████   ██    ██
██  ██ ██ ██    ██ ██  ██  ██           ██    ██   ██ ██      ██    ██
██   ████  ██████  ██      ██ ██        ██    ██   ██ ███████  ██████  ██
-->
# Some number theory

## Algebraic integers

### Definition

An element $α \in ℂ$ is called *algebraic integer* if there exists a monic
polynomial $p \in ℤ[X]$ such that

$$p(α) = α^n + c_{n - 1} α^{n - 1} + … + c_0 = 0$$

> * We write $\algint[]$ for the set of all algebraic integers …
> * … and if $K$ is a number field, i.e. $K$ is finite extension of $ℚ$,
    we set $\algint = \algint[] ∩ K$.

## Properties of algebraic integers

### Proposition

> * Both $\algint[]$ and $\algint$ are sub-rings of $ℂ$ (for all $K$).
> * $\algint$ is a finitely generated free $ℤ$-module (for all $K$). A basis is
    called *integral basis*.
> * The quotient field of $\algint$ is (isomorphic to) $K$.

<!--
██████  ██  ██████  ██████  ██   ██        ███████ ███████ ████████ ███████
██   ██ ██ ██    ██ ██   ██ ██   ██        ██      ██         ██    ██
██   ██ ██ ██    ██ ██████  ███████        ███████ █████      ██    ███████
██   ██ ██ ██    ██ ██      ██   ██             ██ ██         ██         ██
██████  ██  ██████  ██      ██   ██ ██     ███████ ███████    ██    ███████
-->
# Diophantine sets</br>the core of Hilbert's problem

## Diophantine Sets

### Definition

Let $R$ be a commutative ring with unit. A set $S \subseteq R^n$ is called
*Diophantine* if there exists a polynomial $p \in R[\seq{X}, \seq[m]{Y}]$ such
that

$$(\seq{α}) \in S \Leftrightarrow \exists \seq[m]{y} \in R^m : p(\seq{α},
\seq[m]{y}) = 0$$


## Examples of Diophantine Sets

Let $R$ be an integral domain. Then every finite set $S \subset R$ is
Diophantine.

. . .

### Proof

Take

$$p(X) = \prod_{a ∈ S} (X - a).$$


## Examples of Diophantine sets

The set of natural numbers $ℕ$ is Diophantine over $ℤ$.

. . .

### Proof

Using Minkowski's theorem on convex bodies one can prove that

$$x ∈ ℕ \quad \Leftrightarrow \quad \exists y_1, y_2, y_3, y_4 \in ℤ: x = y_1^2 + y_2^2 + y_3^2 + y_4^2.$$

## Examples of Diophantine sets

Let $K$ be a number field and $\algint$ its ring of algebraic integers.
Then $\algint \setminus \set{0}$ is Diophantine over $\algint$.

. . .

### Proof

Using the Chinese remainder theorem one can prove that

$$α ≠ 0 \quad ⇔ \quad ∃ β, γ ∈ \algint : α β = (2 γ - 1)(3 γ - 1).$$


## Unions and conjunctions of Diophantine sets are Diophantine

### Lemma

If $S_1$ and $S_2$ are Diophantine over $\algint$, so are

$$S_1 ∪ S_2 \quad \text{and} \quad S_1 ∩ S_2.$$

The resp. polynomial identities can be found effectively.

## Hilbert's tenth problem over algebraic integers

Fix a number field $K$. Hilbert's tenth problem over $\algint$ can informally be
stated as

> **H10:** Does there exists an algorithm, deciding for every integer $n > 0$,
> every Diophantine set $S ⊂ {\algint}^n$ and every $α ∈ {\algint}^n$, whether
> $x ∈ S$?

. . .

<p align="center">
<strong>Which subsets of $\algint$ are Diophantine?</strong>
</p>


<!--
████████ ██   ██ ███████  ██████  ██████  ██ ███████ ███████
   ██    ██   ██ ██      ██    ██ ██   ██ ██ ██      ██
   ██    ███████ █████   ██    ██ ██████  ██ █████   ███████
   ██    ██   ██ ██      ██    ██ ██   ██ ██ ██           ██
   ██    ██   ██ ███████  ██████  ██   ██ ██ ███████ ███████
-->
# Model theory—towards a modern formulation of Hilbert's problem

## Alternative view of Diophantine sets

### Definition

Let $R$ be an at most countable commutative ring with unit.

* The language of rings with unity is
  $\lang_{ring} = \set{\mathtt{+, -, \cdot; 0, 1}}$
* The $R$-language  is $\lang_{R} = \lang_{ring} ∪ \set{c_r \mid r ∈ R}$.

. . .

### Lemma

A set $S \subseteq R^n$ is Diophantine over $R$ iff

$$(\seq{α}) ∈ S \quad ⇔ \quad
\mathfrak{R} \models ∃ \seq[m]{y}: ϕ(\seq{α}, \seq[m]{y})$$

holds for an atomic $\lang_{R}$-formula $ϕ$.


## Decidability of theories

### Definition

Let $\lang$ be a language.

> * An *$\lang$-theory* is a set of $\lang$-sentences.
> * An $\lang$-theory $\mathtt{Th}$ is *(semi-)decidable* if the set of
    encodings
    $$\set{\enc{ϕ} \mid ϕ ∈ \mathtt{Th}} ⊂ ω$$
    is (semi-)decidable.

## Important theories for deciding Hilbert's tenth problem


Let $\mathfrak{O}_K$ be the $\lang_{ring}$-structure of $\algint$.

|                                                            | Quantifiers | Operators | Language       |
| ---------------------------------------------------------- | ----------- | --------- | -------------- |
| purely Diophantine theory $\mathtt{H10}^*(\mathfrak{O}_K)$   | $∃$         | none      | $\lang_{ring}$ |
| primitive positive theory $\mathtt{Th}_{∃+}(\mathfrak{O}_K)$ | $∃$         | $∧$       | $\lang_{ring}$ |
| full theory $\mathtt{Th}(\mathfrak{O}_K)$                    | $∃, ∀$      | $∧, ∨, ¬$ | $\lang_{ring}$ |
| Diophantine theory $\mathtt{H10}(\mathfrak{O}_K)$            | $∃$         | none      | $\lang_{R}$    |
| primitive positive diagram $D_{∃+}(\mathfrak{O}_K)$          | $∃$         | $∧$       | $\lang_{R}$    |
| complete diagram $D^c(\mathfrak{O}_K)$               | $∃, ∀$      | $∧, ∨, ¬$ | $\lang_{R}$    |
| atomic diagram $D(\mathfrak{O}_K)$               | none      | $¬$ | $\lang_{R}$ |


## Relationships of the theories

![](./imgs/theories.svg){width=70%}

## Hilbert's tenth problem over algebraic integers

Fix a number field $K$. We restate Hilbert's tenth problem over $\algint$ as

> **H10:** Is the Diophantine theory $\mathtt{H10}(\mathfrak{O}_K)$ decidable?

## Hilbert's tenth problem is semi-decidable

### Remark

The atomic diagram $D(\mathfrak{O}_K)$ is decidable by a theorem of @Malcev1961.

. . .

Hence, for every polynomial $p ∈ \algint[K][\seq{X}]$, the relation
$$\mathfrak{p}(\seq{α}) \; :⇔ \; p(\seq{α}) = 0$$
is computable.

. . .

We conclude that $\mathtt{H10}^*(\mathfrak{O}_K)$ and
$\mathtt{H10}(\mathfrak{O}_K)$ are semi-decidable.

<div class="notes">
  <ul>
    <li>
      A structure is computable if its atomic diagram is undecidable
    </li>
    <li>
      By a Theorem of Mal'cev every finitely generated ℤ-algebra is computable.
    </li>
  </ul>
</div>

## $m$-reducibility and semi-decidable sets

### Definition

A problem $Q$ is *many-one reducible* to a second problem $Q′$ if there exists
a total computable function $f ∶ ω → ω$ such that
$$x ∈ Q \quad ⇔ \quad f(x) ∈ Q'.$$

One writes $Q ≤_m Q'$.

. . .

### Proposition

* Let $Q, Q' \subseteq ω$ be problems such that $Q ≤_m Q'$. Then if
  $Q'$ is semi-decidable, so is $Q$.
* If $Q$ is semi-decidable, then $Q ≤_m \mathcal{K}$.


<div class="notes">
  <ul>
    <li>
      ≤_m is reflexive and transitive
    </li>
  </ul>
</div>


## Relationships of the theories w.r.t many-one reducibility

![](./imgs/theories_3.svg){width=70%}
























## What we know 1

### Theorem [@Goedel1931;@Rosser1936]

The full theory $\mathtt{Th}(ℕ)$ is undecidable.

. . .

<div fragment="true">
### Corollary

The full theory $\mathtt{Th}(ℤ)$ is undecidable.
</div>

. . .

<div fragment="true">
### Theorem [@Robinson1959]

The full first order theories $\mathtt{Th}(K)$ and $\mathtt{Th}(\algint)$ are undecidable for every number field $K$.
</div>


## What we know 2

### Theorem

The full theory $\mathtt{Th}(ℂ)$ is decidable. Thus, $\mathtt{H10}^*(ℂ)$ is decidable.

. . .

<div fragment="true">
### Theorem [@Rumely1986;@Dries1988]

The theories $\mathtt{H10}(\algint[])$ and $D^c(\algint[])$ are decidable.
</div>


## What we know 3

### DPRM theorem [@Matijasevic1970]

A subset of $ℤ$ is semi-decidable if and only if it is Diophantine over $ℤ$.

. . .

<div fragment="true">
### Corollary

$\mathtt{H10}(ℤ)$ is undecidable.
</div>


## What we know 4

### Theorem

$\mathtt{H10}(\algint)$ is undecidable if

* $K$ is totally real [@Denef1980],
* $K$ has exactly one pair of non-real embeddings [@Pheidas1988; @Shlapentokh1989],
* if $K$ is a quadratic extension of a totally real number field [@Denef1978], or
* if $K$ is a subfield of a field with one of the properties above [@Shapiro1989].


## What we would like to know

> * Is $\mathtt{H10}(\algint)$ and $\mathtt{H10}(K)$ undecidable for all number fields $K$?
> * Especially: Is $\mathtt{H10}(ℚ)$ decidable?


# Computable rings and structural methods

## Computable ring

### Definition

> * A ring $R \subseteq ω$ is *computable* if $R$ is
    decidable and all ring operations are computable.
> * A ring $R$ is *computably presentable* if $R$ is isomorphic to a computable
    ring.


## Examples of computably presentable rings

> * $ℤ$ is computably presentable.
> * Using an integral basis, the ring of integers $\algint$ is computably
    presentable.
> * If $R$ is a computable integral domain then the ring of polynomials
    $R[X_1, X_2, …]$ is computably presentable.


## Connection to Hilbert's tenth problem

### Corollary

Let $K$ be a number field. Then Hilbert's tenth problem over $\algint$ is
semi-decidable.

<div class="fragment fade-in">
### Proof

Let $p ∈ \algint{} [\seq{X}]$ be a polynomial. Interpret $p: \algint^n → \algint$, then $p$ is computable.
</div>

<div class="fragment fade-in">
Deciding whether $p$ has roots in $\algint$ is equivalent to deciding

$$∃ \seq{x} : p(\seq{x}) \doteq 0,$$

which is semi-decidable.
</div>





## Going up

### Lemma

Let $L / K$ be an extension of algebraic number fields. If $\mathtt{H10}$ is undecidable over $\algint$ and $\algint$ is Diophantine over $\algint[L]$, then $\mathtt{H10}$ is undecidable over $\algint[L]$.

. . .

<div fragment="true">
### Proof

Assume otherwise and let $p_K ∈ \algint[L][X, Y]$ give a Diophantine definition of $\algint$ over $\algint[L]$.

If $q ∈ \algint{}[X_1, …, X_n]$, then $q$ has a root in $\algint$ if and only if

$$∃ \seq{x} ∈ \algint[L] \; ∃ \seq{y} ∈ \algint[L] : q(\seq{x}) = 0 ∧ \bigwedge_{i=1}^n p_K(x_i, y_i) = 0$$
</div>


## A Diophantine definition of rational integers is key

### Theorem

Every semi-decidable subset of $\algint$ is Diophantine if and only if $ℤ$ is
Diophantine over $\algint$.


## Strong vertical method of Denef and Lipshitz

### Theorem

Let $L  /K$ be an extension of number fields and $n = [L : ℚ]$. If $x, y ∈
\algint[L]$ and $α ∈ \algint$ satisfy

1. $y$ is not a unit,
2. $|σ_i(x)| ≤ |N_{L/ℚ}(y^c)|$ for all $1 ≤ i ≤ n$,
3. $|σ_i(α)| ≤ |N_{L/ℚ}(y^c)|$ for all $1 ≤ i ≤ n$, and
4. $x \equiv α \Mod \left(2 y^{2cn}\right)$ in $\algint[L]$

where $\seq{σ}$ denote the embeddings of $L$ into  $ℂ$ and $c ∈
ℕ$ is a fixed, then

$$x = α ∈ \algint.$$


# A Diophantine definition of rational integers over the integers of a totally real number field

## Two sequences

<div fragment="true">
### Definition

Let $K$ be totally real and $a ∈ \algint$. We set

* $δ(a) := \sqrt{a^2 - 1}$ and
* $ε(a) := a + δ(a)$.
</div>

. . .

<div fragment="true">
If $δ(a) ∉ K$, we define $\px_m(a), \py_m(a)$ by

$$\px_m(a) + δ(a) \py_m(a) = ε(a)^m$$
</div>

. . .

<div fragment="true">
View this as an analogue to

$$\cos(m) + i \sin(m) = e^{im}$$
</div>


## Pell's equation

$$X^2 - (a^2 - 1) Y^2 = 1$$

### Lemma

$(±\px_m(a), ±\py_m(a))_{m ∈ ℕ}$ are all solutions to Pell's equation with parameter $a$ in $\algint$.

. . .

<div fragment="true">
View this as an analogue to

$$\cos(m)^2 - i^2 \sin(m)^2 = 1$$
</div>


---

### Notation

Let $K$ be number field of degree $n = [K : ℚ]$ and let $\seq{σ}$ denote all embeddings of $K$ into $ℂ$. For all $α ∈ K$ we set

$$α_i := σ_i(α) \quad\text{for all } 1 ≤ i ≤ n$$

---

### Main Lemma

Let $K ≠ ℚ$ be a totally real number field of degree $n = [K : ℚ]$ and let $a ∈ \algint$ satisfy

$$a_1 ≥ 2^{2n}, \quad |a_i| ≤ \frac{1}{8} \text{ for all } 2 ≤ i ≤ n.$$

Define $S \subseteq \algint$ by $ξ ∈ S ⇔ ∃ x, y, w, z, u, v, s, t, b ∈ \algint:$

:::::::::::::: {.columns}
::: {.column width="25%"}

$$\begin{aligned}
x^2 - (a^2 - 1)y^2 &= 1\\
w^2 - (a^2 - 1)z^2 &= 1\\
u^2 - (a^2 - 1)v^2 &= 1\\
s^2 - (b^2 - 1)t^2 &= 1\\
v &≠ 0\\
z^2 & \mid v\\
\end{aligned}$$

:::
::: {.column width="36%"}

$$\begin{aligned}
b_1 &≥ 2^{2n}\\
|b_i| &≤ \frac{1}{2} \; \text{for } 2 ≤ i ≤ n\\
|u_i| &≥ \frac{1}{2} \; \text{for } 2 ≤ i ≤ n\\
|z_i| &≥ \frac{1}{2} \; \text{for } 2 ≤ i ≤ n\\
b &\equiv 1 \Mod (z)\\
\end{aligned}$$

:::
::: {.column width="39%"}

$$\begin{aligned}
b &\equiv a \Mod (u)\\
s &\equiv x \Mod (u)\\
t &\equiv ξ \Mod (z)\\
2^{2n+1}& \prod_{i = 0}^{n - 1} (ξ + i)^n \prod_{j = 0}^{n - 1} (x + j)^n \;\big\vert\; z
\end{aligned}$$

:::
::::::::::::::

Then $ℕ \subseteq S \subseteq ℤ$.

---

### Main Lemma

Let $K ≠ ℚ$ be a totally real number field of degree $n = [K : ℚ]$ and let $a ∈ \algint$ satisfy

$$a_1 ≥ 2^{2n}, \quad |a_i| ≤ \frac{1}{8} \text{ for all } 2 ≤ i ≤ n.$$

Define $S \subseteq \algint$ by $ξ ∈ S ⇔ ∃ x, y, w, z, u, v, s, t, b ∈ \algint:$

:::::::::::::: {.columns}
::: {.column width="25%"}

$$\begin{aligned}
x = ±\px_k(a), & \; y = ±\py_k(a)\\
w = ±\px_h(a), & \; z = ±\py_h(a)\\
u = ±\px_m(a), & \; v = ±\py_m(a)\\
s = ±\px_j(b), & \; t = ±\py_k(b)\\
v &≠ 0\\
z^2 & \mid v\\
\end{aligned}$$

:::
::: {.column width="36%"}

$$\begin{aligned}
b_1 &≥ 2^{2n}\\
|b_i| &≤ \frac{1}{2} \; \text{for } 2 ≤ i ≤ n\\
|u_i| &≥ \frac{1}{2} \; \text{for } 2 ≤ i ≤ n\\
|z_i| &≥ \frac{1}{2} \; \text{for } 2 ≤ i ≤ n\\
b &\equiv 1 \Mod (z)\\
\end{aligned}$$

:::
::: {.column width="39%"}

$$\begin{aligned}
b &\equiv a \Mod (u)\\
s &\equiv x \Mod (u)\\
t &\equiv ξ \Mod (z)\\
2^{2n+1}& \prod_{i = 0}^{n - 1} (ξ + i)^n \prod_{j = 0}^{n - 1} (x + j)^n \;\big\vert\; z
\end{aligned}$$

:::
::::::::::::::

Then $ℕ \subseteq S \subseteq ℤ$.

## Diophantine definition of the rational integers

### Theorem [@Denef1980]

Let $K$ be a totally real number field. Then $ℤ$ is Diophantine over $\algint$.

. . .

<div fragment="true">
Use Minkowski's theorem on convex bodies to find an $a ∈ \algint$ satisfying the estimates in the previous lemma.
</div>

. . .

<div fragment="true">
Then $ℕ \subseteq S \subseteq ℤ$ is Diophantine over $\algint$, and $\set{-1, 1}$ is Diophantine as well. Now

$$α ∈ ℤ \quad ⇔ \quad ∃ s, ξ: α = s ξ ∧ (s - 1)(s + 1) = 0 ∧ ξ ∈ S$$
</div>

## References
