> **Do not read this file before you run the case.** It contains the facts the stakeholder holds back. Reading it first ruins the practice round.

# Stakeholder: Luis Ferreira, Director of Operations, Keelway Freight

## Who Luis is

Luis started as a dispatcher and has run operations for six years. He is direct, busy, and speaks freight: "load", "check call", "appointment", "detention", "TONU" (truck ordered, not used), "lumper", "214s", "scorecard". He thinks the problem is email volume and that "the AI can just handle it." He is proud of his coordinators and worried about burning them out.

**Beliefs Luis holds until a question pushes on them:**

- Approving accessorial charges is routine and rule-based.
- Rescheduling an appointment is a TMS update.
- Updating an ETA is low risk; "it's just a field."

## What Luis will say without being pushed

- 14 coordinators across two shifts, 6am to 10pm Central.
- "A few thousand loads a week." If pressed: "call it three thousand, I'd have to check."
- The shared inbox gets "hundreds of emails a day." He does not know the exact number.
- Most emails are carrier updates: running late, arrived, loaded, broke down, held at the dock.
- The TMS vendor has an API. IT has used it for load tendering.

## Hidden facts (reveal ONLY when a question would genuinely surface it)

### H1. Accessorial terms differ per customer contract and live in PDFs

**Surfaces if asked about:** how detention or accessorial approvals are decided, where the rules live, who pays, what happens when a charge is wrong, billing disputes.

**What Luis knows:** Each shipper contract sets its own detention terms: free time (two hours for most, some four), hourly rate, caps, and what proof is required (timestamped arrival and departure). The terms are in signed PDF contracts and amendments on the shared drive, not in the TMS. Coordinators remember the big accounts and ask the account manager for the rest. When Keelway pays a carrier for detention that the shipper's contract does not cover, Keelway eats the cost. Luis says finance "complains every month" about this and guesses it is "real money," but he does not have the number.

**Why it changes the answer:** Auto-approving money is out for v1. The rules must first be extracted into structured, reviewed data with an owner, and each approval needs evidence. A strong answer either scopes approvals out or makes contract-term extraction a separate, reviewed workstream with finance.

### H2. Appointments live in shipper and receiver portals, not the TMS

**Surfaces if asked about:** how rescheduling actually happens today, what a coordinator physically does, which systems are involved beyond the TMS.

**What Luis knows:** The TMS only records the appointment time. To change it, a coordinator logs into the facility's dock-scheduling portal (large retailers and grocers each use one, several different vendors) or calls the receiving clerk. Keelway has dozens of portal logins in a password manager. Some portals' terms prohibit automated access, and one large retailer suspended a broker's account for it last year (Luis heard this from a peer). There is no API for most of them.

**Why it changes the answer:** "Reschedules the appointment on its own" is not buildable in v1. The agent can detect that a reschedule is needed, propose a new window, and prepare the request for a human, but the write happens in systems Keelway does not control. Scraping portals is a business risk, not just a technical one.

### H3. The metric that matters is customer notification time on the top accounts

**Surfaces if asked about:** how success is measured, what customers complain about, who is unhappy, scorecards, what triggered this project, which customers matter most.

**What Luis knows:** Three shippers account for "a bit over half" of the volume (his words, from the last business review). The largest one scores brokers on a quarterly scorecard, and a key line is: notify the shipper within 30 minutes of learning a load will miss its appointment. Keelway dropped a tier on that scorecard last quarter, which puts future volume at risk, and that is why leadership approved this project. Most misses happen because the carrier email sat in the inbox for an hour before anyone read it.

**Why it changes the answer:** The first use case is fast detection and classification of delay emails plus a drafted customer notification for the top accounts, measured against the 30-minute window. That is achievable, measurable, and tied to revenue. Full autonomous resolution is not what the business needs first.

### H4. A TMS status update automatically sends EDI to the shipper

**Surfaces if asked about:** what happens when a status or ETA changes in the TMS, downstream integrations, how customers see updates, EDI, what a wrong update would cause.

**What Luis knows:** Status and ETA updates in the TMS trigger outbound EDI 214 (shipment status) messages to the large shippers' systems within minutes. Those feed the shippers' own dashboards and dock planning. A wrong ETA goes straight to the customer and counts against Keelway on the scorecard. Coordinators have been told to double-check before saving. The API user for automation would need a separate TMS license seat, which the vendor charges for.

**Why it changes the answer:** ETA writes are customer-facing actions, not internal field updates. Writes must be gated (human approval, confidence threshold, or a staging field that does not trigger EDI), and the eval must measure false updates, not only extraction accuracy. It also adds a procurement step for the API seat.

## Access and people (if asked)

- A copy of the shared inbox: IT can export three months of mail "in a week or two"; it contains driver names and phone numbers, and legal wants to know how it will be stored.
- TMS API sandbox: the vendor can set one up, "usually a few weeks," and charges for it.
- Contracts: the account managers, led by Hannah Ruiz, own the contract folder.
- Finance: the controller, Tom Becker, owns carrier payments and customer billing disputes.
- The most experienced coordinator, Jamal Price, keeps a personal spreadsheet of portal quirks.
