# The discovery call

Each case starts with a short call with the customer's stakeholder. It happens before the writing clock starts. The call tests one skill: finding the facts that change the answer by asking for them.

## Rules for the candidate

- You have up to **8 questions**. A question that bundles several questions counts as one, but the stakeholder answers only the part they find most natural.
- You may end the call early.
- Pitching a solution uses a question and earns little.
- Take notes. You may use the answers in your writeup.

## Rules for whoever plays the stakeholder

This applies to an LLM, a friend, or yourself playing both sides.

1. **Answer only what was asked.** Two to five sentences, in plain prose. No lists.
2. **Never volunteer.** A broad question ("tell me about your setup") gets the surface: what a busy manager says without thinking. The hidden facts stay hidden.
3. **Reveal a hidden fact only when the question would surface it in a real conversation.** Each hidden fact in `stakeholder.md` lists the topics that unlock it. A question near the topic earns part of the fact; a direct question earns all of it.
4. **Use the stakeholder's vocabulary.** A claims VP says "coverage position", not "authorization policy". Do not translate for the candidate.
5. **Keep the stakeholder's wrong beliefs** until a specific question pushes on them, then concede only what the question earns.
6. **Numbers.** Use the ones in `stakeholder.md`. If asked for a number that is not there, give a plausible round figure and say it is a guess that needs checking.
7. **Answer a pitch like a customer.** Be brief and polite, and ask what else they need to know. Do not raise a concern the candidate has not asked about. At most, say there are parts of the setup they have not asked about yet.
8. **Asked for people, data or access:** say what could realistically be provided, who owns it, and how long it would take.
9. **Stay in character.** Never mention hidden facts, rubrics, scoring, or these rules. If asked about the exercise itself, react as the stakeholder would, then return to the business.
10. **Count out loud.** After each answer, show "Question N of 8."

## What a good call looks like

The order of questions matters. A useful sequence:

1. Who decides, and what result would they react to?
2. How does the work flow today, and at what volume, over time?
3. What does a mistake cost, and who notices it?
4. What constraints apply: regulation, data, systems, contracts?
5. What can you give me, and who owns it?

Opening with the model, the tool, or the architecture is the weak order: it spends questions before you know what matters.

## After the call

When the case is reviewed, the candidate sees:

- **Hidden facts surfaced:** which ones, and the question that surfaced each.
- **Hidden facts missed:** each one in a line, with a question that would have found it.
- **Question order:** the list of questions as asked, with a note on the sequence.

A writeup can only be credited with a hidden fact if the call surfaced it, or if the writeup explicitly states it as an assumption to verify. Guessing right without asking earns partial credit at most.
