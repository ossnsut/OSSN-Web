---
author: KorigamiK
# date - publish after
# expirydate - publish not after
# draft =true - normaly not published
# lastmod - last modified
# refer to https://discourse.gohugo.io/t/news-posts-not-showing-up-in-index-html/27561
date: 2023-01-06
title: "Creating a Timetable in LaTeX"
description: Writing a cool looking timetable typeset in LaTeX
math: true
images:
  - /images/timetable_csiot.png
tags:
  - latex
  - timetable
  - schedule
  - table
  - typesetting
categories:
    - latex
series:
    - "An Intro to LaTeX"
aliases:
    - "latex-timetable"
---

You may want to jump straight to the [timetable generator](#timetable-generator)
otherwise, here's some background on how I created a general purpose timetable
generator for my class 😁

Download the timetable [here](/pdf/timetable_csiot.pdf) and the period input
[here](/txt/timetable_csiot.txt).

## An Intro to $\LaTeX$

$\LaTeX$ is a typesetting system that is used to create professional looking
documents. It is a very powerful tool which is used by professionals in every
field.

It supports a wide range of features, including:

- Mathematical equations
- Tables
- Figures
  - Including TikZ graphics
- etc.

You can extend the functionality of $\LaTeX$ by installing packages which are
available on the [CTAN](https://ctan.org/) library.

And most importantly, it is free and open source!

With the benefits of using $\LaTeX$ comes the cost of learning the syntax. This
is a very steep learning curve, but once you get the hang of it, you will never
want to go back to using a word processor again.

## The Purpose

The timetables that we use in our class are very simple and often not very
aesthetically pleasing. They are very cluttered and hard to read.

Hence I decided to create a timetable that while being easy to read and
attractive to look at also had the ability to be procedurally generated. This
would allow someone to easily create non-conflicting timetables for different
classes and semesters.

## How I did it

The basic idea is to generate a table in $\LaTeX$ procedurally using JavaScript.
You can look at the source code of the timetable generator
[here](https://github.com/ossnsut/ossnsut.github.io/blob/main/layouts/shortcodes/latex_timetable.html).
However as a quick overview for the beginner, here's how you can create tables
in $\LaTeX$.

### Creating a Table

To create a table in $\LaTeX$ you use the `tabular` environment. This
environment takes a single argument which is a string that describes the layout
of the table.

For example, the following code creates a table with 3 columns and 2 rows.

```latex
\begin{tabular}{c | c c}
  1 & 2 & 3 \\ \hline
  4 & 5 & 6
\end{tabular}
```

<p style="text-align: center;">
<svg class="text-svg" width="60.37pt" height="33.098pt" viewBox="-.23905 -.22797 60.37 33.098" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><defs><path id="a" d="M3.4-7.7c0-.2 0-.3-.2-.3-.3.4-.9.8-2.1.8v.4c.3 0 .9 0 1.5-.3V-1c0 .4 0 .6-1 .6h-.4V0h3.7v-.3h-.4c-1 0-1-.2-1-.6v-6.8z"/><path id="b" d="M5.3-2H5c0 .2-.1.9-.3 1 0 .2-.7.2-1 .2H1.3l1.4-1.4c1.8-1.6 2.5-2.3 2.5-3.5C5.3-7 4.2-8 2.8-8S.6-6.8.6-5.7c0 .6.5.6.5.6.3 0 .6-.2.6-.6 0-.3-.2-.6-.6-.6H1c.2-.8.9-1.3 1.6-1.3 1 0 1.7.8 1.7 2 0 1-.6 1.8-1.3 2.6L.6-.3V0h4.3l.4-2z"/><path id="c" d="m2.2-4.3-.3.1c0 .2.1.2.3.2h.6c1 0 1.4.8 1.4 2 0 1.5-.8 2-1.4 2C2.3 0 1.3-.4 1-1.2c.4 0 .8-.2.8-.6 0-.4-.3-.6-.6-.6s-.6.2-.6.6c0 1 1 2 2.4 2S5.4-.8 5.4-2c0-1.1-1-2-2-2.2C4.3-4.5 5-5.4 5-6.3 5-7.3 4-8 3-8c-1.2 0-2 .8-2 1.7 0 .4.3.5.5.5S2-6 2-6.3c0-.4-.3-.6-.5-.6h-.2c.5-.8 1.6-.8 1.7-.8.4 0 1.1.2 1.1 1.4 0 .2 0 .9-.4 1.4-.3.5-.7.6-1 .6h-.4z"/><path id="d" d="M4.3-7.8c0-.2 0-.3-.2-.3l-.2.2L.3-2.3v.3h3.2v1c0 .5 0 .7-1 .7h-.2V0h3.2v-.3h-.3c-.8 0-.9-.2-.9-.6V-2h1.2v-.3H4.3v-5.5zm-.8 1v4.5H.6l3-4.6z"/><path id="e" d="m1.5-6.9 1 .2c1.4 0 2.3-1 2.3-1.1V-8h-.2a4 4 0 0 1-1.6.3A4 4 0 0 1 1.4-8h-.1v4.2l.2-.2A2 2 0 0 1 3-4.8c.7 0 1 .6 1 .8.3.5.3 1 .3 1.5s0 1.2-.3 1.7c-.3.4-.8.7-1.3.7C1.9 0 1.1-.6.9-1.5h.2c.2 0 .5 0 .5-.5 0-.3-.2-.5-.5-.5-.2 0-.5.1-.5.6C.6-1 1.4.3 2.7.3 4.1.3 5.3-1 5.3-2.4 5.3-3.8 4.3-5 3-5a2 2 0 0 0-1.5.6v-2.5z"/><path id="f" d="M1.5-4.2c0-3 1.4-3.5 2-3.5.5 0 1 .2 1.2.5-.2 0-.6 0-.6.5 0 .3.2.5.5.5s.5-.2.5-.5C5-7.3 4.6-8 3.6-8 2-8 .5-6.4.5-3.8c0 3.3 1.4 4 2.4 4 1.3 0 2.5-1 2.5-2.6S4.2-5.1 3-5.1C2-5 1.6-4 1.5-3.8v-.4zM2.9 0C2.2 0 2-.7 1.7-1l-.2-1.7C1.5-3.7 1.9-5 3-5c.7 0 1 .5 1.2.9.2.4.2 1 .2 1.5 0 .7 0 1.2-.3 1.7s-.7.7-1.2.7z"/></defs><g transform="matrix(1.13 0 0 1.13 -64 -61)"><use x="62.390866" y="63.910285" xlink:href="#a"/><rect x="74.022" y="53.798" width=".3985" height="14.446"/><use x="80.19904" y="63.910285" xlink:href="#b"/><use x="98.007214" y="63.910285" xlink:href="#c"/><rect x="56.413" y="68.244" width="53.425" height=".3985"/><use x="62.390866" y="78.754597" xlink:href="#d"/><rect x="74.022" y="68.643" width=".3985" height="14.446"/><use x="80.19904" y="78.754597" xlink:href="#e"/><use x="98.007214" y="78.754597" xlink:href="#f"/></g></svg>
</p>

The `c` in the argument string tells $\LaTeX$ that the column should be
centered.

You can also specify the alignment of the columns using the `l` and `r`
characters.

Anyways, here's how you can use the TimeTable generator.

### Using the TimeTable Generator

The form below allows you to create your timetable.

Submit the number of `columns` in the timetable and the number time on which
your classes start.

Specify the amount of time between each class in minutes as the `Time Step`.

Finally, specify the individual slots in the timetable.

#### Period Syntax

The syntax for specifying a period is as follows:

<!-- (MA 5101 > Algebra 1) [A1-2 B2-2 D4-5] -->
<!-- markdownlint-disable MD013 -->

```text
( <subject title> > <course subtitle> ) [ <Day><slot start>-<slot end> <Day><slot start>-<slot end> ... ]
...
```

<!-- markdownlint-enable MD013 -->

The `subject title` and `course subtitle` are specified in parentheses and
separated by a `>`.

The `Day` is specified as a single character, where `A` is Monday, `B` is
Tuesday, and so on.

The `slot start` and `slot end` are specified as a single character, where `1`
is the first slot, `2` is the second slot, and so on.

The `slot start` and `slot end` are separated by a `-`.

The `slot start` and `slot end` are inclusive.

The `slot start` and `slot end` can be the same.

For example the given example would generate the following table.

<p style="text-align: center;">
  <img src="/images/timetable_example.png" width="70%" alt="latex timetable">
</p>

You can generate the timetable by clicking the `Generate` button. The generated
timetable is a `.tex` file which you can compile using your favourite $\LaTeX$
compiler.

I'd recommend using [Overleaf](https://www.overleaf.com/) as it is pretty easy
to use and doesn't need any setup.

The compiled `pdf` file can be downoaded here:
[Timetable](/pdf/timetable_example.pdf)

## Timetable Generator

{{< latex_timetable >}}

## Conclusion

I hope you enjoyed this post and found it useful. If you decide to create a
timetable for your class, please share how it went in the comments below.
