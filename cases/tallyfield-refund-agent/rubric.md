# Rubric: Tallyfield, refund and credit agent

Score each dimension 1 to 5 using the scale in [RUBRIC.md](../../RUBRIC.md). This file says what a strong (4 to 5) answer contains for this case.

## Hidden facts

| ID | Fact | A question that surfaces it |
|----|------|-----------------------------|
| H1 | Team leads routinely approve exceptions outside the published policy; reasons live in Slack | "Of the refunds you approved last month, how many followed the 30-day rule?" |
| H2 | Annual customers are invoiced in NetSuite, not Stripe | "Where does billing live for your larger customers?" |
| H3 | Finance requires approval above $500 and a clean trail ahead of an audit; the controller is not involved yet | "Who else signs off on refunds, and does finance know about this?" |
| H4 | Refund requests are often cancellation signals that customer success wants first | "What usually happens with the account after a refund?" |

A strong candidate surfaces at least three of the four. H1 matters most: without it, the agent automates a policy the company does not follow.

## Per dimension, what strong looks like

**1. Discovery and constraint mapping.** Asks how decisions are really made and what an error costs (a wrong denial for a large account, a wrong refund, an audit finding) before asking about Stripe's API. Maps all billing systems, the approval chain, and data sensitivity (card last-four digits and customer names in Slack and tickets).

**2. Intent and scope surgery.** v1: monthly Stripe customers, within policy, under the finance threshold, with no cancellation intent, handled end to end. Everything else gets a drafted recommendation with the evidence for a human. Out of v1: invoiced accounts, credits on annual contracts, exceptions, anything with cancellation or dispute language. Says this out loud and explains the order.

**3. Agent architecture.** Narrow tools: read account and plan (Salesforce), read charges (Stripe), classify request (refund, credit, cancellation, dispute), evaluate policy (a deterministic rules engine the team owns, not the model's judgment), issue refund (Stripe, idempotent, amount-capped), and route to CS or finance. The model extracts and classifies; the rules decide. Every decision writes a structured reason, rule version, and approver to the ticket for the audit trail. No automation against the admin page without an API.

**4. Eval plan.** Builds a labelled set from past refund tickets and the Slack approvals, with the actual decision as the label. Measures decision agreement with team leads, separately for in-policy and exception cases. Hard gates: zero refunds above threshold, zero refunds on invoiced accounts, and cancellation intent recall high enough to agree with CS. Tracks retained revenue on routed accounts after launch, not only resolution time.

**5. Rollout and stakeholder design.** Shadow mode where the agent's decision is logged next to the team lead's, then automatic only for the clean segment, with a daily sample review and a kill switch. Brings in the controller (Ben Adeyemi) before building, and customer success (Carla Mendes) to agree the routing. Leadership decides which exception rules become policy; the agent does not invent policy.

**6. The asks.** Zendesk export of refund tickets with outcomes; approved access to the #refund-approvals history; Stripe test mode; the finance approval rules in writing; CS save playbook and routing preferences; a decision owner for the written policy; the team leads' time to label disagreements.

**7. Product feedback loop.** Separates Tallyfield-specific rules from reusable pieces: a policy-as-rules component with versioning, a decision audit record, cancellation-intent routing, and amount caps as standard controls. Pushes back to Tallyfield's product and finance that the undocumented exception policy is a business problem to fix, and to the platform that the admin tool needs an API before any automation touches it.

## Weak answer signals

- Putting the help center policy in the prompt and letting the model decide.
- One integration: Stripe, for all customers.
- Success defined as faster refunds.
- Finance and customer success appear only as "notify them."
- No audit trail for automated decisions.
