# Contributing a case

A good case feels like a real customer request and has a few facts that change the right answer. If you have run an enterprise AI deployment, the surprises you hit are the best source material. Change names and details so nothing identifies a real customer.

## What a case needs

Create `cases/<slug>/` with three files. Use a lowercase, hyphenated slug in the form `<company>-<problem>`.

### brief.md (what the candidate reads)

- Starts with a `#` title, then these lines: `**Industry:**`, `**You will speak with:**` (name and role), `**Time:**`. The skill reads these to list cases.
- 150 to 250 words.
- Vague the way real asks are: the stakeholder's goal in their own words, a few named systems, a rough volume, a deadline or pressure.
- Contains no hidden facts and no hints about them.
- Ends with the task: run the discovery call, then write a proposal.

### stakeholder.md (the persona and hidden facts)

- The first line must be this warning, as a blockquote:
  `> **Do not read this file before you run the case.** It contains the facts the stakeholder holds back. Reading it first ruins the practice round.`
- Who the stakeholder is: role, what they are measured on, vocabulary, temperament.
- Two or three wrong beliefs they hold until a question pushes on them.
- What they say without being pushed, including numbers.
- **Three or four hidden facts**, each with:
  - `**Surfaces if asked about:**` the topics that unlock it
  - `**What <name> knows:**` the fact in the stakeholder's words
  - `**Why it changes the answer:**` how it changes scope, architecture, eval or rollout
- People, data and access they can provide, with owners and lead times.

A hidden fact must change what a strong candidate builds or how they ship it. Trivia does not count. Good hidden facts come from regulation, data freshness, side effects in downstream systems, undocumented business rules, stakeholders who were not invited, and the real metric behind the request.

### rubric.md (what a strong answer contains)

- A table of the hidden facts: ID, fact, and one question that surfaces it.
- Which hidden facts matter most, and why.
- One paragraph per dimension, in the order of [RUBRIC.md](RUBRIC.md), describing a 4 to 5 answer for this case.
- A short list of weak answer signals.

## Style

- Plain, direct English. Short sentences.
- No em-dashes. Use commas, colons or full stops.
- No real company names for the customer. Real vendor products (for example a CRM or ticketing system) are fine when they make the case concrete.
- No statistics presented as real-world facts. Numbers inside the fiction belong to the stakeholder, and the stakeholder says when a number is a guess.
- Fictional people only.

## Checklist before opening a pull request

- [ ] Three files, slug directory, warning line at the top of `stakeholder.md`
- [ ] Brief is 150 to 250 words and has no hidden facts
- [ ] Three or four hidden facts, each of which changes the answer
- [ ] Rubric covers all seven dimensions
- [ ] Run the case once yourself, with an LLM or a friend as the stakeholder, and confirm each hidden fact can be surfaced with a reasonable question
- [ ] Add the case to the table in README.md

## Other contributions

Fixes to the rubric scale, the discovery rules, or the skill instructions are welcome. Keep the skill offline: pull requests that add network calls, telemetry, or remote content will not be merged.

By contributing, you agree that your code is licensed under MIT and your case content under CC BY 4.0, as described in README.md.
