# Latex templates for cover letter and reviewer responses

When submitting to an academic journal, it is customary to accompany the manuscript with a cover letter addressing the editor.
Also, during the peer review process, authors usually need to reply to the editor with a response to the points raised by referees.

This repository provides simple and elegant Latex templates to make this ~~frankly quite tedious~~ important and rewarding process a little smoother!

> To start using these templates, check the [installation](#installation) section at the end of this document!

## The basics

This repository contains the `coverletter.cls` and `responseletter.cls` document classes. To use them, simply have 

```tex
\documentclass{coverletter}
```

or

```tex
\documentclass{responseletter}
```

at the beginning of your preamble.

They leverage the default [`letter`](https://en.wikibooks.org/wiki/LaTeX/Letters) class as much as possible, styling it to conform to usual convention and reduce whitespace as much as possible.
As such they mostly maintain the [`letter`](https://en.wikibooks.org/wiki/LaTeX/Letters) commands.
If you are not familiar with them, here is a quick overview!

In the preamble we have:

* `\address`: the address of the _sender_;
* `\signature`: the names of the _sender(s)_;
* `\date`: to date the letters (defaults to `\today`, the date of compiling).

The body begins after `\begin{documen}`, with 

```tex
\begin{letter}{
Journal Street\\
Journal City\\
Journal Postcode\\
Journal Country
}
```

where you can specify the address of the _journal_.

Finally, you can specify an `\opening` and a `\closing` (usually containing standard formulas such as "Dear Editor," and "Yours sincerely,"). 

> You can find complete examples in `coverletter.tex` and `responseletter.tex`

### Additions to the `letter` class

In addition to `letter`, both document classes define a few useful options

* `\documentclass[fontsize=11p]{coverletter}` to set the font size (defaults to `12p`)
* `\headerlogo`, to be defined in the preamble, to display a logo before the `\address`.

### Commands specific to `coverletter`

`coverletter.cls` defines two commands for common inclusions in a cover letter:

* `\manuscript{Manuscript Title}{Author List}` to style the manuscript title and author list in the centre of the page;
* `\suggestedref{Reviewer 1}{affil}{email}` to specify suggestions for reviewers.

### Commands specific to `responseletter`

If you are at the stage of needing `responseletter.cls`, congratulations on your submission! Here are some useful commands:

* `\newref{Referee}` to start a new page and start replying to a referee;
* `\referee{}` to quote from the referee. By default it appears blue and _italic_, but it may me customized changing `\refereecolor` and `\refereestyle` (see [customization](#customization));
* `\todo{}` for outstanding tasks. By default it appears magenta and __bold__, but it may me customized changing `\todocolor` and `\todostyle` (see [customization](#customization)).

Unlike the `letter` class, `responseletter.cls` also natively supports the familiar `figure` and `table` environments, including captions, to easily include figures and tables! 
It also include `bibliography`-related commands to easily include references in your response letter!

### Including references from external files

When writing response letters, it is useful to be able to reference sections, equations, figures, etc., from other `tex` files - most typically the original manuscript. However, you may sometime want to reference sections from different versions of the _same_ file (i.e. original and revised manuscript). Normally, this would cause naming collisions within `\ref` commands. To avoid this, `responseletter.cls` provides the command

```tex
\external[prefix]{document-name}
```

that allows to specify a prefix when referencing! So if I include in the preamble

```tex
% include references from the manuscript
\external[original-]{original-document}
\external[revised-]{revised-document}
```

I can now refer to the `introduction` section as `\ref{original-introduction}` and `\ref{revised-introduction}` without conflicts or ambiguity in numbering!

## Customization

Most aesthetical aspects of `responseletter.cls` are customizable. To do so, simply insert a similar line **in the document preamble**

``` tex
    \renewcommand{\thecommand}{new option}
```

The commands available to be redefined are:

* `\refereecolor` [default: `blue`]: the color of `\referee` sections;
* `\todocolor` [default: `magenta`]: the color of `\todo` sections;
* `\refereestyle` [default: `\itshape`]: the styling of `\referee` sections;
* `\todostyle` [default: `\bfseries`]: the styling of `\todo` sections;

> To leave a section un-styled, use i.e., `\renewcommand{\refereestyle}{}`

> `\itshape`, `\bfseries`, etc., are preferred because they are more forgiving and accommodate multiple paragraphs. It is possible to use `\textit` and similar to fix visual issues if they arise.

## Installation

Installing a latex package is probably a little more cumbersome than it should. Here are the quickest ways to get started!

> To install the templates you are going to need the latest version of `coverletter.cls` or `responseletter.cls`. You can download the latest stable versions from [here](https://github.com/LorenzoPeri17/LatexLetters/releases/latest).

### Installing for a single document

If you plan on using the letter templates on a single document or in a single directory, by far the simplest way is to download the relevant `.cls` and copying it into the same directory of your `.tex` files.

### Installing on Overleaf project

For use on Overleaf, simply download the relevant `.cls` and upload it in the same place as your `.tex` files.

> The `.cls` must be in the same directory as the `.tex` file where `\documentclass{coverletter}` or `\documentclass{responseletter}` is used.
