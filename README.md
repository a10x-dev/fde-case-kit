# fde-case-kit

Practice cases for forward deployed engineer (FDE) interview case rounds. Each case is a realistic enterprise AI deployment request: a vague brief, a discovery call with a stakeholder who holds back the facts that matter, a 45-minute written proposal, and a rubric to review it against.

It works offline. You can run it as an agent skill, paste it into any LLM, or practise with a friend.

## Who it is for

Engineers preparing for FDE, forward deployed AI engineer, solutions engineer, or applied AI engineer interviews, where a case round asks you to scope and design a deployment for a customer. It is also usable by interviewers who want a structured case to run with candidates.

## How a round works

1. **Read the brief.** It is short and vague, like a real customer email.
2. **Discovery call.** Ask the stakeholder up to 8 questions. They answer only what you ask and never volunteer. Some facts change the right answer, and you only get them by asking. See [DISCOVERY.md](DISCOVERY.md).
3. **Write.** You have 45 minutes to write a proposal: first scope, architecture, eval plan, rollout, asks, and product feedback.
4. **Review.** Score the proposal on the seven dimensions in [RUBRIC.md](RUBRIC.md), using the case's `rubric.md`. List which hidden facts you surfaced, which you missed, and the order you asked in.

## Usage

### As an agent skill (Claude Code and other agents that read SKILL.md)

```sh
npx skills add a10x-dev/fde-case-kit
```

Then ask your agent to run an FDE practice case. The skill lets you pick a case, plays the stakeholder, keeps time with `date`, reviews your answer, and saves everything to `./fde-case/<slug>-<timestamp>.md`. It makes no network calls. See [SKILL.md](SKILL.md).

### By hand with any LLM

1. Read `cases/<slug>/brief.md` yourself. Do not open the other two files.
2. Start a new chat. Paste the stakeholder rules from [DISCOVERY.md](DISCOVERY.md) and the full `cases/<slug>/stakeholder.md`, and tell the model to play the stakeholder under those rules.
3. Ask your questions. Stop at 8.
4. Start a timer (`sh bin/case-timer.sh start`) and write your proposal in a file.
5. In a new chat, paste `RUBRIC.md`, the case `rubric.md`, your call transcript and your proposal, and ask for a score per dimension and the hidden facts surfaced and missed.

### With a friend

Your friend reads `stakeholder.md` and [DISCOVERY.md](DISCOVERY.md) and plays the stakeholder. You read only `brief.md`. After you write, your friend scores you with `rubric.md` and [RUBRIC.md](RUBRIC.md). This is closest to a real interview, and it works well for mock interview pairs taking turns.

## Cases

| Case | Industry | Stakeholder | The ask |
|------|----------|-------------|---------|
| [lakeshore-mutual-claims-intake](cases/lakeshore-mutual-claims-intake/brief.md) | Property and casualty insurance | VP of Claims Operations | An agent that takes first notice of loss reports by phone and web and creates claims |
| [keelway-freight-exception-desk](cases/keelway-freight-exception-desk/brief.md) | Freight brokerage | Director of Operations | An agent that reads carrier emails and resolves load exceptions on its own |
| [tallyfield-refund-agent](cases/tallyfield-refund-agent/brief.md) | B2B software | Head of Customer Support | An agent that approves and issues refunds and credits from support tickets |

All companies and people in the cases are fictional.

## Structure

```text
.
├── SKILL.md             agent skill instructions
├── RUBRIC.md            the seven dimensions and their 1 to 5 scale
├── DISCOVERY.md         how the discovery call works
├── CONTRIBUTING.md      how to add a case
├── bin/case-timer.sh    optional timer, POSIX sh, no dependencies
└── cases/<slug>/
    ├── brief.md         what the candidate reads
    ├── stakeholder.md   the persona and hidden facts (do not read before the round)
    └── rubric.md        what a strong answer contains, per dimension
```

## The seven dimensions

1. Discovery and constraint mapping
2. Intent and scope surgery
3. Agent architecture
4. Eval plan
5. Rollout and stakeholder design
6. The asks
7. Product feedback loop

Full scale in [RUBRIC.md](RUBRIC.md).

## Contributing

New cases are welcome, especially from people who have run real deployments. See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

Code, the skill file and everything else (SKILL.md, bin/, and the rest of the repository) are under the [MIT License](LICENSE). Case content (everything under `cases/`, plus RUBRIC.md and DISCOVERY.md) is under [CC BY 4.0](LICENSE-content).

This kit is maintained by A10X, which also runs graded rounds on unseen cases at a10x.dev.
