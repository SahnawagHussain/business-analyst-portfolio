# HR Policy AI Chatbot (RAG-Based Automation)

**Project Role:** Business Analyst / Product Owner  
**Author:** Md Sahnawag Hussain  
**Domain:** HR Tech / Process Automation  

## 📌 Project Overview
This project defines the functional and technical requirements for an **AI-powered HR Chatbot** designed to automate Level 1 employee support. [cite_start]By leveraging **RAG (Retrieval-Augmented Generation)** architecture, the system ingests static policy PDFs to provide instant, verified answers, reducing the manual workload on HR teams while ensuring compliance[cite: 30, 40, 127].

## ❓ Problem Statement
Currently, the HR department faces a significant bottleneck in handling employee queries:
* [cite_start]**High Latency:** Employees wait **24-48 hours** for answers to simple questions (e.g., leave balance, reimbursements) due to manual email queues[cite: 33, 69].
* [cite_start]**Repetitive Workload:** HR staff spend valuable time answering the same routine questions instead of focusing on strategic initiatives like hiring[cite: 34].
* [cite_start]**Inconsistency:** Responses vary depending on which HR staff member replies, leading to confusion[cite: 35].

## 🎯 Goals & Objectives
* [cite_start]**Reduce HR Workload:** Automate **70%** of frequently asked questions[cite: 41].
* [cite_start]**24/7 Availability:** Provide instant support outside of standard working hours[cite: 42].
* [cite_start]**Accuracy:** Eliminate "hallucinations" by using official policy documents as the sole source of truth[cite: 45].
* [cite_start]**Fail-Safe Logic:** Ensure zero dead-ends by automatically escalating unresolved queries to a human via Salesforce[cite: 83].

---

## ⚙️ Solution Architecture
[cite_start]The solution acts as a bridge between company data and the AI engine using a **RAG (Retrieval-Augmented Generation)** approach[cite: 127].

### Logical Flow
1.  [cite_start]**User Interface:** Employee asks a question via **Slack / Microsoft Teams**[cite: 125].
2.  [cite_start]**AI Engine:** The query is processed by an LLM (e.g., GPT-4/Gemini)[cite: 126].
3.  [cite_start]**Knowledge Base:** The system retrieves the answer strictly from verified **HR Policy PDFs**[cite: 128].
4.  [cite_start]**Verification:** The bot provides the answer *plus* a direct link to the source document for proof[cite: 135].
5.  [cite_start]**Data Logging:** Interaction is stored in a **SQL Database** for analytics.
6.  [cite_start]**Human Handoff:** If the answer is not found, a **High-Priority Case** is automatically created in **Salesforce**[cite: 131].

---

## 🔄 Process Analysis (As-Is vs. To-Be)

### As-Is Process (Manual)
* [cite_start]**Workflow:** Employee emails HR -> Email sits in queue (24-48 hrs) -> HR manually searches folders -> HR types reply[cite: 70, 74].
* **Pain Point:** High wait times and manual effort.

![As-Is Diagram](docs/images/as-is-process.png)

### To-Be Process (Automated)
* [cite_start]**Workflow:** Employee chats with AI -> AI scans PDFs -> Instant Answer + Link provided[cite: 84, 87].
* [cite_start]**Fail-Safe:** If answer is unknown -> Auto-trigger Salesforce Case[cite: 93].

![To-Be Diagram](docs/images/to-be-process.png)

---

## 📝 Key User Stories & Acceptance Criteria

| User Role | Requirement | Acceptance Criteria |
| :--- | :--- | :--- |
| **Employee** | [cite_start]Check leave balance without contacting HR[cite: 98]. | 1. Bot fetches balance via ID.<br>2. [cite_start]Displays remaining leave clearly[cite: 100, 101]. |
| **Employee** | [cite_start]Understand reimbursement process[cite: 103]. | 1. Bot lists required docs (bills/receipts).<br>2. [cite_start]Provides link to submission form[cite: 105, 106]. |
| **HR Manager** | [cite_start]Upload updated policy documents[cite: 108]. | 1. New docs are searchable within minutes.<br>2. [cite_start]Outdated policies are removed/marked[cite: 110]. |
| **Business Analyst** | [cite_start]Visibility into unanswered queries[cite: 112]. | 1. Unanswered queries stored in DB.<br>2. [cite_start]Weekly report generated[cite: 114, 115]. |
| **IT Admin** | [cite_start]Role-based access to logs[cite: 117]. | 1. Sensitive data (payroll) masked for non-admins.<br>2. [cite_start]Only Admin role can view full logs[cite: 119, 120]. |

---

## 📊 Success Metrics (KPIs)
[cite_start]To measure effectiveness, the following metrics will be tracked using **Tableau Dashboards**[cite: 130]:

1.  [cite_start]**Query Resolution Rate:** Target **70%** of queries resolved without human intervention[cite: 147].
2.  [cite_start]**Average Response Time:** Measured against the previous 24-48 hour baseline[cite: 152].
3.  [cite_start]**Unanswered Query Analysis:** Weekly review of questions the bot failed to answer[cite: 159].
4.  [cite_start]**Employee Feedback Score:** Thumbs up/down rating after every interaction[cite: 166].

---

## 🛠 Tools & Tech Stack
* **Frontend:** Slack / Microsoft Teams Integration
* **AI Model:** OpenAI GPT-4 / Google Gemini (via API)
* **Database:** SQL (for chat logs)
* **Analytics:** Tableau (for performance dashboards)
* **CRM:** Salesforce (for ticketing escalation)
