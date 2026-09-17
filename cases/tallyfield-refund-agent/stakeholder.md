> **Do not read this file before you run the case.** It contains the facts the stakeholder holds back. Reading it first ruins the practice round.

# Stakeholder: Priya Nair, Head of Customer Support, Tallyfield

## Who Priya is

Priya has led support at Tallyfield for three years and manages 22 agents and three team leads. She is measured on first response time, time to resolution and CSAT. She is friendly, fast, and speaks support language: "macros", "escalations", "tiers", "CSAT", "handle time". She thinks of refunds as a support workflow and has not thought much about finance or retention.

**Beliefs Priya holds until a question pushes on them:**

- The help center policy is how refund decisions are made.
- Refunds are a support problem; finance just processes them.
- Faster refunds are always better.

## What Priya will say without being pushed

- About 22 support agents across US time zones.
- Refund and credit tickets are "maybe 150 to 200 a month." If pressed, she says she would need to pull the Zendesk tag report.
- Approval today: an agent asks a team lead in Slack, the lead approves, the agent asks finance to process it.
- Median time to resolve a refund ticket is "a few days."
- CSAT on refund tickets is the lowest of any ticket type.

## Hidden facts (reveal ONLY when a question would genuinely surface it)

### H1. The published policy is not the real policy

**Surfaces if asked about:** how decisions are actually made, how often requests outside 30 days are approved, exceptions, what team leads consider, examples of recent approvals or denials.

**What Priya knows:** Team leads approve a lot of requests outside the 30-day window. They look at how much the account pays, how long they have been a customer, whether a customer success manager (CSM) asks for it in Slack, and whether the customer threatens to leave or dispute the charge. Priya guesses "a third or more" of approved refunds are exceptions, but nobody tracks it. The reasons are in Slack threads, not in Zendesk.

**Why it changes the answer:** An agent that applies the help center policy would deny many requests the company currently approves, and would do it for exactly the accounts that matter most. The first step is reconstructing the real decision rules from past tickets and Slack, and deciding with leadership which of them become policy. v1 can automate only the cases that are clean under both the written and the real policy.

### H2. Larger customers are not billed in Stripe

**Surfaces if asked about:** billing systems, how larger or annual customers pay, invoices, where refunds are issued, the plan mix.

**What Priya knows:** Customers on annual contracts (the larger ones) were moved to invoicing through NetSuite about a year ago and pay by bank transfer. Stripe only covers monthly card plans. Refunds or credits for invoiced customers are handled by finance as credit memos in NetSuite. Priya thinks invoiced customers are "a minority of tickets but most of the dollars."

**Why it changes the answer:** "Issue it in Stripe" covers only self-serve accounts. v1 should be scoped to Stripe monthly plans; invoiced accounts need a finance-owned path. It also means the highest-value decisions are the ones the agent should not make alone.

### H3. Finance has approval thresholds and is preparing for an audit

**Surfaces if asked about:** who else must sign off, finance involvement, limits, approval amounts, accounting, anyone else who should be in the room.

**What Priya knows:** The controller, Ben Adeyemi, set a rule last quarter: any refund or credit above $500 needs finance approval, and credits on annual contracts must be recorded differently because they affect deferred revenue. Tallyfield is preparing for its first external financial audit ahead of a funding round, and Ben has asked for a clean approval trail on every refund. Ben does not know about this AI project yet. Priya says, "I figured we'd loop him in once it works."

**Why it changes the answer:** Finance is a sign-off stakeholder, not a downstream processor. Every automated decision needs a logged, auditable reason and approver identity (even if the approver is a policy rule). Amount thresholds cap what the agent may do alone. Surprising the controller before an audit could kill the project.

### H4. Refund requests are often churn signals, and customer success wants them

**Surfaces if asked about:** what happens after the refund, cancellations, customer success, retention, why customers ask for refunds, what a good outcome is.

**What Priya knows:** Many refund requests arrive together with a cancellation or say "we're not using it." The customer success team has a save playbook (a call, a discount, a plan downgrade, extra onboarding) and has complained that support refunds accounts before CS hears about them. The VP of Customer Success, Carla Mendes, counts a saved account as a win and a refunded-and-cancelled one as a loss. Priya has not talked to Carla about automation.

**Why it changes the answer:** Instant automatic refunds can increase churn. The agent should detect cancellation intent and route those to CS before any money moves, and success should be measured on net retained revenue and correct decisions, not only on time to resolution.

## Access and people (if asked)

- Zendesk export of refund-tagged tickets: easy, "same day."
- Slack approval threads: in a channel called #refund-approvals; export needs IT and legal sign-off because it has customer names and card last-four digits.
- Stripe test mode: available; the admin tool has no API, "it's a Rails admin page."
- NetSuite: finance only, through Ben Adeyemi.
- Team leads Maya Chen and Oscar Diaz make most approval calls.
