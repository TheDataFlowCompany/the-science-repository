# Day 1 — Foundations & Setup (repo-based)

## Goal of the day

By the end of Day 1, every participant has **all the software installed** and a
**working fork of this repository** — accounts created, environment restored,
and both outputs rendering. We use the repository itself as the map: each box in
the architecture diagram is a tool we install and understand today.

> Style: **install-along**. Concept slides are interleaved with explicit
> step-by-step install/exercise slides. Slow is fine — the win is that nobody
> leaves with a broken setup.
>
> RStudio is the environment for Days 1–2. VS Code is introduced on Day 3 only.
> Deep R syntax is Day 2. The optional Shiny app is **not** covered.

---

# Part A — Framing

## Slide 1 — Welcome

**Title:** The Science Repository
**Subtitle:** One repo for your data, your analysis, and your outputs

**On slide:**

```text
Day 1: Install everything + understand the repository
Day 2: Analyse the data in R
Day 3: Reporting, publication, VS Code, and hypercharge your codebase
```

**Speaker note:**
Today is not about writing R. Today is about understanding the *system* — what
each tool does and how they fit together — and getting it all installed. If your
setup works at the end of today, Days 2 and 3 will be smooth.

---

## Slide 2 — The whole system on one picture

**Title:** Every box is a tool we install today

**Visual:** `workshop_info/overall_structure.png`

**On slide:**

```text
Reference management (Zotero) ┐
Programming language (R)      ├─→  RStudio (the GUI)  ─→  Quarto (Publisher) ─→  Website
Documentation (Markdown)      ┘          ↑   ↑                                  └→  Manuscript / Data (OSF)
                                         │   │
Packages + Coding assistants ─→ code ────┘   │
                          GitHub (Version) ──┘
                          renv  (Environment) ┘
```

**Speaker note:**
Keep this diagram visible all day. Every time we install something, point back
to its box. The center is RStudio; everything else feeds into or out of it.

---

## Slide 3 — The mental model of this repository

**Title:** One repo = data + engine + two outputs

**On slide:**

```text
R/        computes   → the analysis engine (setup + reusable functions)
reports/  present    → the recipes you render (webpage + manuscript)
renders/  are results→ the finished website and paper

Change a function in R/ and BOTH outputs update on the next render.
Nothing is copied by hand between them.
```

**Speaker note:**
This is the single most important idea of the repo. `R/` is the source of truth
for the numbers; `reports/` are just different ways to present them; `renders/`
are the built products. We'll see each folder today.

---

## Slide 4 — What lives where

**Title:** A quick tour of the folders

**On slide:**

```text
R/           analysis engine: 01_setup.R + functions/
data/        mock/ (committed)  ·  raw/ & processed/ (private, gitignored)
reports/     webpage/  ·  manuscript/   (the things you render)
renders/     webpage/  ·  manuscript/   (the rendered outputs)
references/  references.bib  (shared by website + manuscript)
renv/        pinned package versions (renv.lock)
.claude/     rules that stop AI tools from reading your raw data
```

**Speaker note:**
Each folder has its own README. The top-level README is the front door. We are
*not* memorising this — we're building intuition for where things belong.

---

# Part B — GitHub first

## Slide 5 — What is Git and GitHub?

**Title:** Version control: the safety net

**On slide:**

```text
Git    = tracks the history of changes in a project folder
GitHub = hosts that project online, so you can share and collaborate

A repository ("repo") = a project folder + its full change history
```

**Speaker note:**
GitHub is not just a cloud drive. It remembers *every* version, who changed
what, and lets several people work on the same project without overwriting each
other. That history is what makes research auditable.

---

## Slide 6 — GitHub vocabulary

**Title:** The words you'll hear all day

**On slide:**

```text
Fork    Make your own copy of someone else's repo on GitHub
Clone   Download a repo to your computer
Commit  Save a labelled snapshot of your changes
Push    Send your commits up to GitHub
Pull    Bring GitHub's changes down to your computer
Branch  A separate line of work
Merge   Combine work from different branches
```

**Speaker note:**
Don't worry about memorising. Today you'll *fork* once, then *commit* and *push*
small changes. Branches and merges become real on Day 2 when you collaborate in
pairs.

---

## Slide 7 — EXERCISE: create a GitHub account

**Title:** Step 1 — get an account

**On slide:**

```text
1. Go to  github.com
2. Sign up (use an email you'll keep — ideally your university email)
3. Verify your email
4. Pick a username you're happy to share publicly
```

**Check:**

```text
Can you log in and see your (empty) GitHub dashboard?
```

**Speaker note:**
If anyone already has an account, great — just log in. Public usernames will
appear in their website URL later, so pick something sensible.

---

## Slide 8 — EXERCISE: fork the repository

**Title:** Step 2 — make it yours

**On slide:**

```text
1. Open:  github.com/thedataflowcompany/the-science-repository
2. Click  "Fork"  (top right)
3. Keep the name, click "Create fork"
4. You now have:  github.com/<your-awesome-username>/the-science-repository
```

TOTHINKABOUT: Maybe here is a good point to also explain the difference between a fork and a branch? Fork is an independent copy, branch is supposed to contribute back to the main project.

**Key sentence:**

```text
A fork is your own independent copy. You can change it freely
without touching the original. 
```

**Speaker note:**
Everyone now owns a complete copy of the template — data, engine, and outputs.
This is the starting point for the whole three days. You can pull in new changes from the original repository. You can even contribute back to the original repository. Lets say you find a cool new software, you can let us know by contributing back to the repository you forked from

---

## Slide 9 — EXERCISE: turn on your website

**Title:** Step 3 — publish your analysis website

**On slide:**

```text
In YOUR fork on GitHub:
1. Settings → Pages
2. Source: "Deploy from a branch"
3. Branch: main   ·   Folder: / (root)   → Save
4. Wait ~1 minute, then open:
   https://<your-username>.github.io/the-science-repository/renders/webpage/
```

**Speaker note:**
This is the payoff moment. The website was rendered from the code in the repo,
and GitHub is now serving *your* copy of it. Nobody wrote any HTML — it came from
the analysis.

TOTHINKABOUT: We may need to point them before that already to the education license of github. If not I think they have to make their project public before they can turn on GitHub pages.

---

## Slide 10 — EXERCISE: your first commit

**Title:** Step 4 — edit the README link and commit

**On slide:**

```text
The README points to the project's website. Make it point to YOURS.

1. Open README.md on GitHub → click the pencil (edit)
2. Find the website link near the top
3. Replace the URL with your own github.io address (from Slide 9)
4. Scroll down → "Commit changes"
   Message:  "Point website link to my fork"
```

**Speaker note:**
That edit-and-commit you just did *is* a commit and a push, done entirely in the
browser. You've now changed your repo and saved a labelled snapshot of it. This
is the core GitHub loop, in miniature.

---

## Slide 11 — Forks, commits, merges — the picture

**Title:** What just happened, visually

**On slide:**

```text
template repo  ──fork──▶  your repo  ──commit──▶  your repo (new snapshot)
                                          │
                                          └── GitHub Pages rebuilds your site

Later (Day 2): branch ──▶ work ──▶ merge back into main
```

**Speaker note:**
You forked (copied), committed (snapshotted a change), and GitHub republished.
On Day 2 we add branches and merges so two people can work at once. Same loop,
more people.

TOTHINKABOUT: Maybe we can here already nonetheless teach about cloning so that they learn that they can have their forked version on their computer. A potential blockade may be that in the first round, they need to have set their username and email locally.

---

## Slide 12 — What must NEVER go on GitHub

**Title:** Data protection checkpoint

**On slide:**

```text
Usually safe to commit:        Usually NOT safe:
  scripts / code                 real / identifiable participant data
  README & docs                  passwords, tokens, API keys
  mock (synthetic) data          ethics docs with sensitive details
  rendered outputs               anything confidential

Rule of thumb:
  Scripts can be shared.  Raw data usually cannot.
  Outputs depend on whether anyone can be identified.
```

**Speaker note:**
This repo is built to enforce that. The next slide shows how `.gitignore`
protects you automatically.

---

## Slide 13 — How the repo protects you: `.gitignore`

**Title:** Real data can't be committed by accident

**On slide:**

```text
data/mock/        committed     (synthetic, safe — everyone uses this today)
data/raw/         gitignored    (your real data — never leaves your machine)
data/processed/   gitignored    (cleaned data — also stays local)

.gitignore also blocks common data file types everywhere except mock/.
```

**Speaker note:**
For day one of this workshop we use the mock dataset, so there's no risk. Tomorrow you can also bring your own data if you want to learn on your own data. In your own
projects, `.gitignore` is the seatbelt: raw and processed data simply won't be
pushed, even if you forget.

---

# Part C — R + RStudio

## Slide 14 — R vs RStudio

**Title:** The engine and the cockpit

**On slide:**

```text
R        = the programming language that does the work (the engine)
RStudio  = the environment you work in: write code, see data,
           run scripts, view plots, manage the project (the cockpit)

You can run R without RStudio — but RStudio makes everything visible.
```

**Speaker note:**
They are two separate installs. We install both. We are *not* learning R syntax
today — that's Day 2. Today we just need it working.

---

## Slide 15 — EXERCISE: install R and RStudio

**Title:** Step 5 — install the software

**On slide:**

```text
1. Install R:        cran.r-project.org   (pick your OS, latest version)
2. Install RStudio:  posit.co/download/rstudio-desktop  (free Desktop)
3. Open RStudio — it finds R automatically
```

**Check:**

```text
Does RStudio open without errors?
In the Console, type 1 + 1 and press Enter → you should see [1] 2
```

**Speaker note:**
Install R *first*, then RStudio. Windows and Mac differ slightly on the CRAN
page — point to the right link. This is where setup problems surface, so go
slowly and help neighbours.

---

## Slide 16 — EXERCISE: get the repo onto your laptop

**Title:** Step 6 — clone your fork

**On slide:**

```text
Easiest in RStudio:
  File → New Project → Version Control → Git
  Repository URL: https://github.com/<your-username>/the-science-repository
  → Create Project

This downloads YOUR fork and opens it as an RStudio Project.
```

**Speaker note:**
Cloning = downloading your GitHub copy to your machine, with its history
attached. RStudio can do it through menus, no command line needed.

---

## Slide 17 — Open the project, not the files

**Title:** Always open via the .Rproj

**On slide:**

```text
the-science-repository.Rproj   ← double-click THIS

Opening the project (not single files) tells R:
  - where the project root is
  - where data, scripts, and outputs live
  → file paths work the same on everyone's computer
```

**Speaker note:**
The number-one beginner trap is "R can't find my file". Opening the project
fixes most of it, because paths are anchored to the project root, not your
Desktop.

---

## Slide 18 — RStudio in 60 seconds

**Title:** The four panes

**On slide:**

```text
Source       where you write and save scripts
Console      where R runs commands
Environment  the objects currently in memory
Files/Plots/Packages/Help   manage files, see figures, read docs
```

**Speaker note:**
That's all you need today. We'll live in these panes properly on Day 2. For now,
just know where the Console is — we'll type one command into it next.

---

# Part D — Environment control (renv)

## Slide 19 — The "works on my machine" problem

**Title:** Why pinning package versions matters

**On slide:**

```text
Same code + different package versions = different (or broken) results.

"It works on my laptop but not yours."
"It worked last year but not today."
```

**Speaker note:**
Reproducibility isn't only about your code — it's also about the exact versions
of the tools your code depends on. This repo solves that with `renv`.

---

## Slide 20 — What renv does

**Title:** renv = a locked, per-project package library

**On slide:**

```text
renv.lock     records the exact version of every package this project uses
renv/         a private package library just for this project
.Rprofile     activates renv automatically when the project opens

→ Everyone restores the SAME versions. No more version drift.
```

**Speaker note:**
`renv` is the "Environment Control" box in the diagram. Each project gets its own
isolated set of packages, described precisely in `renv.lock`.

---

## Slide 21 — EXERCISE: restore the environment

**Title:** Step 7 — install the exact packages

**On slide:**

```r
install.packages("renv")   # only if RStudio doesn't prompt you
renv::restore()            # installs every package at the pinned version
```

**Check:**

```text
renv reads renv.lock and installs what's missing.
This can take a few minutes — that's normal.
When it finishes, you have every package the project needs.
```

**Speaker note:**
Run this in the Console. It may ask to proceed — say yes. This is the moment
everyone's environment becomes identical. Later, after adding a package, you'd
run `renv::snapshot()` to record it — but not today.

---

# Part E — Documentation & data

## Slide 22 — README: the front door

**Title:** Every project explains itself

**On slide:**

```text
The top-level README tells you:
  - what the project is
  - what lives in each folder
  - how to set up and render

Every folder also has its OWN README (R/, data/, reports/, renders/...).
```

**Speaker note:**
If you open this project in six months, the README gets you back in. When you
fork for your own work, you rewrite the README first.

---

## Slide 23 — Markdown, lightly

**Title:** READMEs are written in Markdown

**On slide:**

```text
# Heading            **bold**        *italic*
- bullet             [link](url)     `code`

Plain text + a few symbols → clean, readable docs.
It's the "Documentation" box in the diagram.
```

**Speaker note:**
You already used Markdown when you edited the README on GitHub. It's deliberately
simple — the same syntax shows up in Quarto later today.

---

## Slide 24 — Mock vs real data: `.Renviron`

**Title:** Step 8 — choose your data mode

**On slide:**

```bash
cp .Renviron.example .Renviron      # make your own local copy
```

```text
Inside .Renviron:
  DATA_MODE=mock   → uses the safe synthetic dataset (default, today)
  DATA_MODE=real   → uses your private raw data (your own projects only)
```

**Speaker note:**
`.Renviron` is local and gitignored — it never gets committed. Today everyone
stays on `mock`. The same code runs on real data later just by flipping this
switch, with no code changes.

---

## Slide 25 — The three data buckets

**Title:** raw → processed → mock

**On slide:**

```text
data/raw/        original data, exactly as received — never hand-edited (private)
data/processed/  cleaned, analysis-ready — created BY scripts, can be rebuilt (private)
data/mock/       synthetic stand-in — committed, safe to share, used in the workshop
```

**Speaker note:**
Raw is input you never touch. Processed is output a script creates. Mock is the
public, synthetic version that lets us all run the same examples safely.

---

# Part F — Reference management (Zotero)

## Slide 26 — Zotero and citations

**Title:** Manage references once, cite everywhere

**On slide:**

```text
Zotero      collects your papers and generates citations
   │  export
   ▼
references/references.bib      ONE shared bibliography
   │
   ├──▶ used by the website
   └──▶ used by the manuscript
```

**Speaker note:**
This is the "Reference management" box. You keep your library in Zotero, export a
`.bib` file into the repo, and *both* outputs cite from the same source. Change a
reference once, it updates everywhere.

---

# Part G — Publisher (Quarto) & outputs

## Slide 27 — What is Quarto?

**Title:** Quarto = prose + code → polished output

**On slide:**

```text
A .qmd file mixes:
  - text (Markdown)
  - R code chunks
  - the results those chunks produce (tables, figures, numbers)

Quarto runs the code and weaves results into the finished document.
```

**Speaker note:**
Quarto is the "Publisher" box. The key idea: your figures and tables are *not*
pasted in — they're generated when the document renders, straight from the `R/`
engine. No copy-paste, no stale numbers.

---

## Slide 28 — Code runs top to bottom

**Title:** A report is a recipe, read in order

**On slide:**

```text
reports/webpage/
  01-data-preparation.qmd   load + clean the data
  02-descriptives.qmd       summarise it
  03-analysis.qmd           model it

Each page runs top → bottom. Setup first, results last.
They all call the shared functions in  R/functions/.
```

**Speaker note:**
This ordering — prepare, describe, analyse — is the backbone of the whole
analysis, and the same order you'll work in on Day 2. Code always executes from
the top down; nothing later works if something earlier failed.

---

## Slide 29 — Two outputs from one engine

**Title:** Website and manuscript, same numbers

**On slide:**

```text
reports/webpage/      ──quarto render──▶  renders/webpage/      (HTML website)
reports/manuscript/   ──quarto render──▶  renders/manuscript/   (LaTeX → PDF paper)

Both reuse R/. Same data, same functions, two presentations.
```

**Speaker note:**
A website needs clickable HTML tables; a journal needs LaTeX. The repo formats
the same results two ways. This is the right-hand side of the diagram: Report
Output.

---

## Slide 30 — EXERCISE: render the website

**Title:** Step 9 — build the site locally

**On slide:**

```bash
quarto render reports/webpage
```

```text
→ rebuilds renders/webpage/
Open renders/webpage/index.html to see it.
(Quarto ships inside RStudio — no separate install needed.)
```

**Speaker note:**
This is the same render that GitHub ran for your Pages site. Now you can do it on
your own laptop and preview before pushing. If it builds, your R + renv + Quarto
chain is fully working — that's the Day 1 finish line.

---

## Slide 31 — The manuscript and Overleaf

**Title:** The paper, and how co-authors join in

**On slide:**

```text
quarto render reports/manuscript
  → generates the data-driven parts (methods, results, figures, tables)
  → assembled by renders/manuscript/main.tex into manuscript.pdf

Overleaf:
  the self-contained renders/manuscript/ folder can sync to Overleaf
  → online, collaborative LaTeX writing with co-authors
```

**Speaker note:**
You don't need Overleaf today. The point is that the manuscript folder is
self-contained, so it can live on Overleaf for co-authoring while the data-driven
parts still come from your R code. We go deeper on Day 3.

---

# Part H — Wrap-up

## Slide 32 — A word on AI assistants

**Title:** Coding assistants — helpful, with guardrails

**On slide:**

```text
AI can help: explain code, draft README text, debug errors.

This repo guards your data:
  .claude/settings.json          blocks AI tools from reading raw/processed data
  *.llm.code-workspace           hides private data from the editor

Rule: AI supports the workflow — it does not receive confidential data.
```

**Speaker note:**
Light touch today — the "Coding assistants" box exists and the repo is built to
keep raw data away from AI tools. We cover responsible AI use properly on Day 3.

---

## Slide 33 — What we deliberately skipped

**Title:** Not today

**On slide:**

```text
Deep R syntax        → Day 2 (objects, functions, dataframes, modelling)
VS Code              → Day 3 (RStudio is our environment for now)
The Shiny app        → optional, not part of this workshop
```

**Speaker note:**
Keeping scope tight is intentional. If your setup works, you're exactly where you
need to be.

---

## Slide 34 — End-of-Day-1 checklist

**Title:** Before you leave today

**On slide:**

```text
[ ] GitHub account created
[ ] Repository forked to your account
[ ] GitHub Pages on → your website loads
[ ] First commit made (README link points to your site)
[ ] R and RStudio installed
[ ] Fork cloned and opened via the .Rproj
[ ] renv::restore() finished successfully
[ ] .Renviron copied (DATA_MODE=mock)
[ ] quarto render reports/webpage works locally
```

**Speaker note:**
Run through this as an exit check. Anyone with unticked boxes should grab the
optional support session — Day 2 assumes all of this works.

---

## Slide 35 — Tomorrow

**Title:** Day 2 — analyse the data in R

**On slide:**

```text
With the scaffold in place, tomorrow we:
  - work inside R/ and the report pages
  - import, clean, and inspect the data
  - build descriptives, figures, and models
  - use branches and merges to collaborate in pairs
```

**Speaker note:**
Everything we installed today becomes the workbench for Day 2. The structure you
set up is what makes the analysis easy to follow and easy to share.
