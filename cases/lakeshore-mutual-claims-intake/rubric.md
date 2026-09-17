# Rubric: Lakeshore Mutual, first notice of loss

Score each dimension 1 to 5 using the scale in [RUBRIC.md](../../RUBRIC.md). This file says what a strong (4 to 5) answer contains for this case.

## Hidden facts

| ID | Fact | A question that surfaces it |
|----|------|-----------------------------|
| H1 | Only licensed adjusters may state a coverage position; intake may not | "What are your reps allowed to tell a caller today?" |
| H2 | Policy data reaches ClaimCenter in a nightly batch; same-day changes are invisible | "How does the agent check the policy, and how fresh is that data?" |
| H3 | The pain is catastrophe surge (several times normal volume), not the average week | "When are hold times worst, and what triggered this project?" |
| H4 | Recordings and verbatim notes are evidence for SIU and litigation | "Who uses the intake record after the claim is created?" |

A strong candidate surfaces at least three of the four. Surfacing H1 and H3 matters most, because they change what gets built first.

## Per dimension, what strong looks like

**1. Discovery and constraint mapping.** Asks who decides and what the committee wants to see, then the shape of volume over time, then what an error costs, then constraints. Names the regulatory limit on coverage statements, the batch freshness of policy data, consent-to-record, and PII (driver licence numbers, injury details, which can be health information).

**2. Intent and scope surgery.** Cuts v1 to intake for simple property and auto reports, with overflow routing during surges. Says out loud what is out: coverage answers, bodily injury claims beyond basic capture, total losses, anything involving an attorney, commercial lines. Does not promise to replace the 38 reps.

**3. Agent architecture.** Typed, narrow tools: look up policy (read-only, with a "stale or not found" state), create FNOL in ClaimCenter (idempotent, with a verification flag), schedule adjuster callback, hand off to a human with context. The conversation is a structured slot-filling flow the team owns, not a free-form agent. Refusal and handoff paths are explicit. Verbatim transcript is stored next to any generated summary. Considers phone latency and barge-in for voice.

**4. Eval plan.** Builds a test set from historical FNOL records with adjuster corrections. Measures field accuracy per field, summary faithfulness against the transcript, and, as a hard gate, zero coverage-position statements across adversarial prompts ("so I'm covered, right?"). Tests "policy not found" and same-day-change cases. Load test at surge volume. Defines thresholds before launch.

**5. Rollout and stakeholder design.** Shadow mode on web reports first, then phone overflow only when queue time passes a threshold. Live and rehearsed before storm season; no first launch during a CAT event. A kill switch Joanne's team controls. Brings in legal, compliance, SIU (Marcus Hale) and the intake lead (Rosa Vega) early. Reframes the December demo around a shadow-mode result on real, approved data.

**6. The asks.** ClaimCenter sandbox and API credentials; legal approval to use recordings; a labelled sample of past FNOL records with corrections; the intake script and its forbidden phrases; last season's surge volume by day; a named compliance owner; SIU requirements for the record.

**7. Product feedback loop.** Separates Lakeshore-specific work (their script, their states' rules) from reusable product: a coverage-statement guardrail for any insurer, a "stale reference data" state in the lookup tool, verbatim-plus-summary storage as a default, and surge overflow routing as a standard deployment mode. Flags the missing live policy API as a platform gap rather than scraping around it.

## Weak answer signals

- An agent that "tells the customer whether they're covered."
- Treating "policy not found" as a denial.
- Headcount reduction as the headline ROI.
- A summary replacing the transcript.
- A go-live plan that lands in the middle of storm season without a shadow period.
