# Product Brief: PulseBoard
**Tacheon Assessment – Task 1: Product Scoping**
*Author: Shrijanaki | May 2026*

---

## The Problem

At a marketing technology company supporting multiple client brands, one question comes up constantly:

> *"How is our marketing performing across channels right now, and where should we be focusing?"*

Today, answering it means someone manually digs through several tools, pulls numbers, and stitches together a response. The answer looks different every time depending on who does it. It takes longer than it should. And if the person who usually does it is unavailable, the question just sits there unanswered.

The team needs a tool that makes answering this question faster, more consistent, and less dependent on any one person.

---

## The Tool

**Name:** PulseBoard

**What it is:** A multi-client, role-aware marketing performance dashboard that answers two questions the moment you open it — how are we performing, and where should we focus — while giving every user the ability to go deeper on demand, from within any section, without losing their place.

**Who it is for:** Primarily internal analysts and account managers at the marketing technology company. Secondarily, client stakeholders who need a clear, non-technical view of their brand's performance.

**The core design principle:** Every user — technical or not — should be able to understand the answer before they read a single number. Color and layout do the heavy lifting. Numbers confirm what the visual already told you.

---

## User Roles

| Role | What they need | What they see |
|---|---|---|
| Client stakeholder | Quick answer, no jargon | Top-level view of all four sections |
| Internal analyst | Full data, drill-down, team visibility | Everything + Show More on every section |
| Team lead | Ownership, escalation visibility, access control | Working On + Escalation sections + export permissions |

Access is permission-based. Each client's data is siloed — logging in shows only the data you are authorised to see. No client can see another client's performance.

---

## What the Tool Does in V1

The dashboard is a single scrollable page with four sections. Every section has its own **Show More** button. Every section surfaces **who is responsible** for the work behind it.

---

### Section 1 — Performance Overview *(answers: how are we doing?)*

The first thing a user sees when they log in.

- A **customisable pie chart** showing marketing performance broken down by channel (e.g. Google Ads, Meta, Email, SEO). The user can select or deselect which channels appear — the chart updates dynamically. Default view shows all active channels.
- A **focus signal** — a clearly highlighted callout showing the channel with the lowest return. Color-coded: green (strong), amber (watch), red (needs attention). The user understands the answer before reading a number.
- **Show More** → expands into full channel metrics, historical performance, and cross-section navigation (see Navigation Model below).

---

### Section 2 — Channel Breakdown *(answers: what does the detail look like?)*

- Two charts displayed side by side: the **highest performing channel** and the **lowest performing channel**.
- Each channel card shows the **team members who worked on it**, listed on the side. Clicking a name opens their Slack profile or internal profile page directly — no need to go looking for who to contact.
- Gives context to the focus signal above — now you can see *why* a channel is flagged, and *who* to talk to about it.
- **Show More** → expands into all channel data, full breakdowns, with cross-section navigation.

---

### Section 3 — What We're Working On *(answers: what's happening right now?)*

A set of manually updated cards maintained by the internal team.

Each card shows:
- The initiative or campaign name
- The **team lead or team responsible** — named, not anonymous
- A progress status: **Upcoming / In Progress / Completed**
- A **"View Stats"** button that links directly to the relevant channel data for that initiative
- **Show More** → expands into full campaign history and all related data, with cross-section navigation.

**Why manual in V1:** Auto-pulling from Slack, newsletters, or project tools requires parsing unstructured text across multiple integrations. That adds fragility without adding enough value for a first version. A text input maintained by the analyst is reliable, fast to implement, and sufficient for V1.

---

### Section 4 — Escalations *(answers: what's actively going wrong?)*

A separate, visually distinct section — not buried in the working-on cards.

Each escalation card shows:
- **What** the issue is
- **Why** it is happening (or best current understanding)
- **Who** is handling it — named and contactable via Slack or profile link
- Current status: **Open / In Progress / Resolved**
- **Show More** → expands into the full data behind the escalation, with cross-section navigation.

**Why this matters:** Escalations are the most urgent version of the original problem. Without a visible, owned, structured place for them, urgent issues get handled inconsistently or not at all.

---

## Navigation Model (Show More)

Every section has its own Show More. This does not open a separate page — it expands into a deep data view with a **persistent sidebar** that lets the user navigate to any other section's expanded data without returning to the dashboard.

This means:
- An analyst reviewing Google Ads data in Section 2's expanded view can jump directly to the escalation data in Section 4 without going back
- The user never loses context
- The dashboard and the deep view are the same tool, not two separate experiences

---

## Who's Working On This — Everywhere

Across all sections and all expanded views, PulseBoard surfaces the people behind the work. Every channel, campaign, and escalation shows the relevant team members with a direct contact link (Slack or internal profile).

This turns PulseBoard into more than a reporting tool — it becomes a live directory of ownership. An analyst looking at underperforming Google Ads data can immediately see and contact the data scientist responsible, without leaving the tool or sending a message to ask who to speak to.

---

## Data Export

Not all data carries the same sensitivity. PulseBoard uses a two-tier export model:

| Data type | Export behaviour |
|---|---|
| Summary-level data (pie chart, top/bottom channel view) | **Downloadable directly** — low sensitivity, safe for general use |
| Raw data, campaign-level breakdowns, client-confidential figures | **Request access** — user submits a request, team lead approves or declines |

This keeps the tool fast for everyday use while maintaining control over sensitive data. Team leads manage access requests from a simple admin view — no engineering involvement needed for approvals.

---

## What I Am Deliberately Not Building in V1

| Feature | Why it's out of scope |
|---|---|
| Auto-pull from Slack / newsletters | Adds integration complexity and fragility without enough V1 value |
| Gradient color system showing trend direction | Strong V2 idea: needs trend data validated in V1 first |
| ML-based predictive recommendations | Requires ML layer: not justified until the basic data view is validated |
| Cross-client benchmarking | Raises data privacy complexity; better addressed after V1 is stable |
| Mobile-optimised view | Desktop-first is sufficient for internal analyst use cases |

These are not permanent exclusions. They are deliberate deferrals based on what delivers the most value with the least risk in a first version.

---

## V2 Vision (for context)

Two ideas deliberately deferred from V1 that form a coherent V2:

**Gradient color system:** Instead of static red/green/amber, colors shift as a gradient showing *direction* — a channel trending toward red looks different from one that has been red for weeks. This gives users a momentum signal, not just a current-state signal.

**ML recommendations:** Once trend data is established and validated in V1, a machine learning layer can explain *why* a channel is trending a certain way and suggest what to do. The gradient shows where you are heading. The ML layer explains why and recommends action. Together they form a genuinely intelligent tool. V1 earns the right to build this.

---

## What the Tool Needs to Work

**Data sources:** PulseBoard connects to existing marketing platform APIs the team already uses — Google Ads, Meta Ads Manager, GA4, and any email marketing platform in use. It does not require the team to change tools or workflows. It reads from what already exists.

**Data freshness:** Channel data refreshes on a defined schedule (e.g. daily or every 6 hours). The dashboard displays a "last updated" timestamp so users always know how current the data is. This is a core trust signal.

**Authentication:** Role-based login. Client data is siloed at the data layer, not just the UI layer.

**Manual inputs:** The "What We're Working On" and "Escalations" sections have a simple admin input interface — a form with fields for each card. No technical knowledge required to update these.

---

## What a Successful Interaction Looks Like

A client stakeholder logs in on a Monday morning. Within 30 seconds they know:
- Their email channel is performing well (green)
- Their Meta spend is underdelivering (red, flagged)
- The team is already aware and working on it (Section 3 card, with the lead named)
- There is an active escalation on the Meta issue with an owner named and reachable (Section 4)

They close the tab feeling informed. They do not need to message anyone to ask what is happening.

An internal analyst opens the same dashboard and clicks Show More on Section 2. They see full Google Ads data, spot an anomaly, see the DS responsible listed on the side, click their name, and open a Slack message — all without leaving PulseBoard.

That is the outcome this tool is designed to produce.

---

## What I Would Revisit With More Time

- **User research:** I have made assumptions about what "performing well" means across channels. Different clients define success differently (ROAS vs impressions vs conversions). A short discovery conversation with two or three internal analysts would sharpen the metrics shown significantly.
- **The color system:** I have assumed a simple green/amber/red logic. A more nuanced system — accounting for trend direction, not just current value — is already scoped for V2 but worth validating in V1 user testing.
- **The Show More navigation experience:** I have scoped persistent sidebar navigation but not defined the exact layout, filtering options, or what data appears by default in each expanded view. That needs a design pass.
- **Request access workflow:** I have defined the model but not the UX — how does a user request access, how does a team lead get notified, how long does approval take? These details matter for adoption.
- **Auto-pull for Section 3:** The newsletter/Slack integration deferred from V1 is worth prototyping once the manual version is validated and usage patterns are understood.

---

## Flow Diagram

```
User logs in
      │
      ▼
Authentication → client data loaded (siloed by permission)
      │
      ▼
┌──────────────────────────────────────────────────────┐
│  SECTION 1: Performance Overview                     │
│  [Customisable Pie Chart] [Focus Signal — color]     │
│  [Show More → full channel metrics + nav]            │
└──────────────────────────────────────────────────────┘
      │ scroll
      ▼
┌──────────────────────────────────────────────────────┐
│  SECTION 2: Channel Breakdown                        │
│  [Highest Channel] | [Lowest Channel]                │
│  [Team members listed] [Click → Slack / profile]     │
│  [Show More → all channels + nav]                    │
└──────────────────────────────────────────────────────┘
      │ scroll
      ▼
┌──────────────────────────────────────────────────────┐
│  SECTION 3: What We're Working On                    │
│  [Card: Initiative | Lead | Progress | View Stats]   │
│  [Show More → campaign history + nav]                │
└──────────────────────────────────────────────────────┘
      │ scroll
      ▼
┌──────────────────────────────────────────────────────┐
│  SECTION 4: Escalations                              │
│  [What | Why | Who | Status | Contact link]          │
│  [Show More → full escalation data + nav]            │
└──────────────────────────────────────────────────────┘
      │
      ▼
Export: [Download summary] or [Request access for raw data]
```

---

*This brief represents V1 scope only. Decisions were made to prioritise clarity, reliability, and usefulness over completeness. Every exclusion is deliberate. Every V2 idea listed was considered for V1 and deferred with a reason.*
