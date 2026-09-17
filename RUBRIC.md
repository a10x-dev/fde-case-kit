# The seven dimensions

Every case is scored 1 to 5 on the same seven dimensions. Each case's `rubric.md` says what a strong answer looks like for that scenario. This file defines the scale.

Score what the candidate actually did. For discovery, that means the questions they asked on the call, not the questions their writeup says they would ask. A 3 is a competent answer that would not stand out. Reserve 5 for answers you would forward to a hiring panel as an example.

## 1. Discovery and constraint mapping

Did they find out what shapes the solution before designing it?

| Score | Observable behaviour |
|-------|----------------------|
| 1 | Asks no questions, or only about tools and models. Designs from the brief as written. |
| 2 | Asks generic questions ("tell me more about your data") that get surface answers. Surfaces none of the hidden facts. |
| 3 | Asks about volume and systems. Surfaces one hidden fact, often by luck. Misses the cost of an error. |
| 4 | Asks who decides and how success is measured, then the current workflow, then what an error costs, then constraints. Surfaces most hidden facts. |
| 5 | As 4, and uses answers to sharpen the next question. Surfaces the fact that changes the first use case. Names regulatory, data and integration constraints precisely. |

## 2. Intent and scope surgery

Can they cut the ask down to a first version that can reach production, and say what is out?

| Score | Observable behaviour |
|-------|----------------------|
| 1 | Builds everything the customer asked for. |
| 2 | Mentions "start small" without saying what that means. |
| 3 | Picks a smaller first use case but does not say why, or leaves the risky parts in. |
| 4 | Names the v1 intents or workflows, names what is out, and ties the cut to a constraint or risk. |
| 5 | As 4, and the cut is driven by what they learned on the call. Explains the order of later phases and what must be true before each. |

## 3. Agent architecture

Is the system built from parts they can test, control and reason about?

| Score | Observable behaviour |
|-------|----------------------|
| 1 | "An LLM with access to the system." No tools, no boundaries. |
| 2 | One agent with broad tools such as "update_record" that can do anything. |
| 3 | Reasonable components, but writes are ungated, or decisions that should be deterministic are left to the model. |
| 4 | Narrow, typed tools with clear read and write boundaries. Deterministic logic where rules exist. Explicit handoff to humans. Idempotent writes. |
| 5 | As 4, and the design handles the specific failure modes of this customer's systems (stale data, side effects, missing APIs) with named mechanisms. |

## 4. Eval plan

Would their evaluation catch the failure that actually matters?

| Score | Observable behaviour |
|-------|----------------------|
| 1 | No eval, or "we'll test it." |
| 2 | A generic metric such as accuracy or CSAT with no dataset. |
| 3 | A labelled dataset and per-task metrics, but no hard gates for the dangerous failures. |
| 4 | Dataset built from the customer's real history, metrics per intent or field, hard gates for the high-cost failures, thresholds set before launch. |
| 5 | As 4, and the headline metric is the business outcome the stakeholder is judged on, measured against a baseline. Includes adversarial cases specific to this deployment. |

## 5. Rollout and stakeholder design

Does it go live safely, with the right people agreeing?

| Score | Observable behaviour |
|-------|----------------------|
| 1 | A launch date. |
| 2 | "Pilot, then full rollout," with no criteria. |
| 3 | Shadow or pilot phase with some criteria, but missing a kill switch or key stakeholders. |
| 4 | Shadow mode, a limited segment, promotion criteria, a kill switch with a named owner, and the stakeholders who can block the project involved early. |
| 5 | As 4, and the timeline is reshaped around real business events (season, audit, contract review). Resets unrealistic expectations with the stakeholder directly and offers something they can show. |

## 6. The asks

What do they require from the customer before building?

| Score | Observable behaviour |
|-------|----------------------|
| 1 | Nothing, or "access to the data." |
| 2 | A list of systems to connect to. |
| 3 | Specific data and access, but no owners or timelines. |
| 4 | Specific data, access, people and decisions, each with an owner. |
| 5 | As 4, and includes the uncomfortable ask: the decision nobody has made, the stakeholder who was not invited, or the data that needs legal approval. |

## 7. Product feedback loop

Do they separate what is one customer's quirk from what the product should learn?

| Score | Observable behaviour |
|-------|----------------------|
| 1 | Not mentioned. |
| 2 | "We'll collect feedback." |
| 3 | Lists some reusable pieces, but treats every workaround as custom code. |
| 4 | Clearly separates customer-specific configuration from reusable components, and names gaps to report back to the product or platform team. |
| 5 | As 4, and refuses to hack around a platform gap when the fix belongs in the product, explaining the cost of the workaround. Proposes how the next deployment of this kind gets faster. |

## Overall

Give an overall score from 1 to 5. It is a judgement, not an average: a design that would cause a regulatory incident or move money wrongly cannot score above 2, however good the other sections are.
