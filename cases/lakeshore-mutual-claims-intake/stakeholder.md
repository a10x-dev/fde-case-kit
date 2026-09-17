> **Do not read this file before you run the case.** It contains the facts the stakeholder holds back. Reading it first ruins the practice round.

# Stakeholder: Joanne Okafor, VP of Claims Operations, Lakeshore Mutual

## Who Joanne is

Joanne has run claims operations for nine years and came up through the adjuster ranks. She is measured on hold time, cycle time from report to first adjuster contact, and headcount cost. She is practical, a bit impatient with technology vocabulary, and talks in claims terms: "FNOL", "recorded statement", "coverage position", "CAT event", "SIU". She believes the problem is typing speed and wants the agent to "handle the whole call."

**Beliefs Joanne holds until a question pushes on them:**

- The agent can tell callers whether they are covered. ("That is what customers want to know first.")
- The pain is steady, all year.
- The call notes are just notes; a summary is fine.

## What Joanne will say without being pushed

- About 38 intake reps, two shifts, weekdays plus a small weekend crew.
- Normal volume is "around 1,200 reports a week" across phone and web, roughly 70% phone. (If asked for more precision, she says it is from memory and she would need to pull the report.)
- Average handle time is "about 14 minutes" per phone report.
- ClaimCenter was upgraded two years ago. IT says it has REST APIs.
- She wants a demo for the executive committee in December.

## Hidden facts (reveal ONLY when a question would genuinely surface it)

### H1. Only a licensed adjuster may communicate a coverage position

**Surfaces if asked about:** what the agent is allowed to say, regulation, licensing, what reps are trained or scripted to say, compliance, what "where they stand" means.

**What Joanne knows:** In all four states, discussing whether a loss is covered counts as adjusting, and only licensed adjusters may do it. Intake reps are not licensed. Their script forbids "you're covered" or "that won't be covered." Two years ago a rep told a caller a flood was covered, and the complaint went to a state insurance department. Joanne wants the agent to "tell them where they stand" because customers ask. When pushed she concedes that intake can only say a claim was opened, give the claim number, and say an adjuster will call within a set time.

**Why it changes the answer:** The agent's scope is intake and next steps, not coverage. Any design that answers "am I covered?" is a regulatory incident. Guardrails and eval must specifically test for coverage-position leakage.

### H2. Policy data is a nightly batch, not live

**Surfaces if asked about:** how the agent would look up the policy, where policy data comes from, freshness, integration with the policy system, what happens with recent changes.

**What Joanne knows:** The policy admin system runs on an IBM midrange box. ClaimCenter receives a nightly batch extract of policies. Anything changed today (a new car added, a cancellation for non-payment, a new policy bound this morning) is not visible until tomorrow. Reps handle this by creating the claim anyway and flagging "policy not found" for an adjuster to verify. She guesses "maybe a few percent" of reports hit this, and would need to check.

**Why it changes the answer:** The agent cannot treat a missing or mismatched policy as "no coverage" and cannot confirm vehicles or drivers from policy data with certainty. It must create the claim with a verification flag, never reject or turn away a caller. This is a clear eval case and a product feedback item (a live policy lookup API).

### H3. The real pain is catastrophe surge, not the average week

**Surfaces if asked about:** volume over time, peaks, seasonality, when hold times are worst, what "leadership wants" is driven by, why now.

**What Joanne knows:** On an ordinary week the team keeps up. After a hailstorm or a severe wind event, reports jump to "five to eight times normal" for one to two weeks (her guess from last spring). Hold times went past an hour, callers abandoned, and the story reached local news. That is what the executive committee remembers. Storm season in their states starts in spring. Most CAT reports are home and auto hail damage with simple facts. Joanne has borrowed adjusters to take intake calls during surges, which delays the actual claims.

**Why it changes the answer:** The first use case is overflow capacity for high-volume, simple CAT reports, not replacing the 38 reps on ordinary days. It must be live, tested and switchable before storm season, and must not debut during a surge. Load and concurrency matter more than average handle time. The ROI story is abandoned calls and adjuster time during surges, not headcount.

### H4. Intake recordings and statements are used as evidence

**Surfaces if asked about:** who uses the intake output downstream, what happens after the claim is created, fraud, special investigations, legal, call recording, what adjusters need from the notes.

**What Joanne knows:** The Special Investigations Unit (SIU) uses the intake recording and the rep's verbatim notes when a claim is flagged for possible fraud. In litigation, the first description of the loss matters, and a paraphrase that changes a detail ("the other car ran the light" versus "I think the light was yellow") is a problem. One of their states requires all-party consent to record, which the current phone greeting covers. The SIU director is Marcus Hale; he was not invited to this project and will object if he hears about it late.

**Why it changes the answer:** The agent must preserve the verbatim transcript and recording alongside any summary, label generated summaries as such, keep the consent disclosure, and never "clean up" the caller's own words in the record. SIU and legal become sign-off stakeholders. Eval must check summary faithfulness against the transcript, not just field completeness.

## Access and people (if asked)

- ClaimCenter sandbox: IT can provide one "in two to three weeks" after security review.
- Call recordings and transcripts: available, but legal must approve use for testing. Joanne guesses a month.
- Historical FNOL records with adjuster corrections: yes, in ClaimCenter.
- The intake team lead, Rosa Vega, knows the script and the edge cases better than anyone.
- The policy admin system team is two people and busy; any live API is "a next-year conversation."
