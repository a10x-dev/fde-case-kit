# Rubric: Keelway Freight, carrier exception desk

Score each dimension 1 to 5 using the scale in [RUBRIC.md](../../RUBRIC.md). This file says what a strong (4 to 5) answer contains for this case.

## Hidden facts

| ID | Fact | A question that surfaces it |
|----|------|-----------------------------|
| H1 | Accessorial terms vary per customer contract and live in PDFs; wrong approvals cost Keelway money | "How does a coordinator decide whether to approve detention today?" |
| H2 | Rescheduling happens in third-party dock portals, many with no API and some forbidding automation | "Walk me through what a coordinator actually does to move an appointment." |
| H3 | The business metric is 30-minute delay notification on the largest shipper's scorecard | "How will you know this worked, and what made this a priority now?" |
| H4 | TMS status updates send EDI 214 messages to shippers automatically | "What happens downstream when someone updates an ETA?" |

A strong candidate surfaces at least three of the four. H3 and H4 matter most: H3 picks the first use case, H4 decides whether the agent may write at all.

## Per dimension, what strong looks like

**1. Discovery and constraint mapping.** Asks what success is measured by and why now before asking about the API. Maps the email flow and its volume, the cost of a wrong ETA or a wrong payment, and the systems outside Keelway's control (portals, shipper EDI). Notes PII in carrier email (driver names, phone numbers) and the need for evidence on money decisions.

**2. Intent and scope surgery.** v1: classify inbound carrier email, extract load and delay facts, match to the load in the TMS, alert on likely appointment misses, and draft customer notifications for the top accounts. Explicitly out of v1: approving accessorial charges, rescheduling in portals, free-form replies to carriers. Explains why each is out.

**3. Agent architecture.** A pipeline, not one agent: email ingestion with deduplication and thread handling, a classifier with a fixed intent set, structured extraction (load number, new ETA, reason, evidence), load matching against the TMS (read), and a proposal queue for humans. Writes to the TMS go through a gated tool that is off by default and never fires EDI without approval. Idempotency on email reprocessing. Unmatched or ambiguous emails route to a human with the extraction shown.

**4. Eval plan.** Labels a sample from the exported inbox: intent accuracy, extraction accuracy per field, load-match precision. The headline metric is time from email arrival to customer notification on top accounts, compared with a measured baseline. Counts false ETA proposals separately and sets a threshold before any write is enabled. If approvals are ever in scope, each one is checked against the extracted contract term with a reviewer.

**5. Rollout and stakeholder design.** Shadow mode on the live inbox, with coordinators seeing proposals next to their own actions. Then assisted mode for the largest shipper's loads only. Then, possibly, gated automatic ETA writes on high-confidence cases, with a kill switch Luis owns. Involves account management (Hannah Ruiz) and finance (Tom Becker) before anything touching money, and the coordinators (Jamal Price) in design. Talks about notifying the largest shipper if message behaviour changes.

**6. The asks.** Inbox export with a data-handling agreement; TMS API sandbox and the licensed API seat; the scorecard definition and last quarter's results; a list of top-account contracts and their accessorial terms; the EDI mapping for 214s; a coordinator to label a few hundred emails; a named owner for write permissions.

**7. Product feedback loop.** Separates Keelway-only work (their contract terms, their portal list) from reusable product: a carrier-email classifier and extractor for any broker, a "proposed update" state that does not trigger EDI, a structured accessorial-terms schema, and scorecard-window alerting. Flags to the TMS vendor (or the platform team) the missing staging state for status updates rather than building a private workaround.

## Weak answer signals

- An agent that approves detention from a prompt that says "use standard terms."
- Portal automation with browser bots and no mention of terms of use.
- Treating an ETA update as a harmless internal field.
- Success defined as "emails handled" with no link to the scorecard.
- One large agent with an "update_tms" tool that can do anything.
