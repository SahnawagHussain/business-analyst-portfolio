# HR Policy AI Chatbot (RAG-Based Automation)

**Project Role:** Business Analyst / Product Owner  
**Author:** Md Sahnawag Hussain  
**Domain:** HR Tech / Process Automation  

## 📌 Project Overview
This project defines the functional and technical requirements for an **AI-powered HR Chatbot** designed to automate Level 1 employee support. By leveraging **RAG (Retrieval-Augmented Generation)** architecture, the system ingests static policy PDFs to provide instant, verified answers, reducing the manual workload on HR teams while ensuring compliance.

## ❓ Problem Statement
Currently, the HR department faces a significant bottleneck in handling employee queries:
* **High Latency:** Employees wait **24-48 hours** for answers to simple questions (e.g., leave balance, reimbursements) due to manual email queues.
* **Repetitive Workload:** HR staff spend valuable time answering the same routine questions instead of focusing on strategic initiatives like hiring.
* **Inconsistency:** Responses vary depending on which HR staff member replies, leading to confusion.

## 🎯 Goals & Objectives
* **Reduce HR Workload:** Automate **70%** of frequently asked questions.
* **24/7 Availability:** Provide instant support outside of standard working hours.
* **Accuracy:** Eliminate "hallucinations" by using official policy documents as the sole source of truth.
* **Fail-Safe Logic:** Ensure zero dead-ends by automatically escalating unresolved queries to a human via Salesforce.

---

## ⚙️ Solution Architecture
The solution acts as a bridge between company data and the AI engine using a **RAG (Retrieval-Augmented Generation)** approach.

### Logical Flow
1.  **User Interface:** Employee asks a question via **Slack / Microsoft Teams**.
2.  **AI Engine:** The query is processed by an LLM (e.g., GPT-4/Gemini).
3.  **Knowledge Base:** The system retrieves the answer strictly from verified **HR Policy PDFs**.
4.  **Verification:** The bot provides the answer *plus* a direct link to the source document for proof.
5.  **Data Logging:** Interaction is stored in a **SQL Database** for analytics.
6.  **Human Handoff:** If the answer is not found, a **High-Priority Case** is automatically created in **Salesforce**.

---

## 🔄 Process Analysis (As-Is vs. To-Be)

### As-Is Process (Manual)
* **Workflow:** Employee emails HR -> Email sits in queue (24-48 hrs) -> HR manually searches folders -> HR types reply.
* **Pain Point:** High wait times and manual effort.

![As-Is Diagram](docs/images/as-is-process.png)

### To-Be Process (Automated)
* **Workflow:** Employee chats with AI -> AI scans PDFs -> Instant Answer + Link provided.
* **Fail-Safe:** If answer is unknown -> Auto-trigger Salesforce Case.

![To-Be Diagram](docs/images/to-be-process.png)

---

## 📝 Key User Stories & Acceptance Criteria

| User Role | Requirement | Acceptance Criteria |
| :--- | :--- | :--- |
| **Employee** | Check leave balance without contacting HR. | 1. Bot fetches balance via ID.<br>2. Displays remaining leave clearly. |
| **Employee** | Understand reimbursement process. | 1. Bot lists required docs (bills/receipts).<br>2. Provides link to submission form. |
| **HR Manager** | Upload updated policy documents. | 1. New docs are searchable within minutes.<br>2. Outdated policies are removed/marked. |
| **Business Analyst** | Visibility into unanswered queries. | 1. Unanswered queries stored in DB.<br>2. Weekly report generated. |
| **IT Admin** | Role-based access to logs. | 1. Sensitive data (payroll) masked for non-admins.<br>2. Only Admin role can view full logs. |

---

## 📊 Success Metrics (KPIs)
To measure effectiveness, the following metrics will be tracked using **Tableau Dashboards**:

1.  **Query Resolution Rate:** Target **70%** of queries resolved without human intervention.
2.  **Average Response Time:** Measured against the previous 24-48 hour baseline.
3.  **Unanswered Query Analysis:** Weekly review of questions the bot failed to answer.
4.  **Employee Feedback Score:** Thumbs up/down rating after every interaction.

---

## 🛠 Tools & Tech Stack
* **Frontend:** Slack / Microsoft Teams Integration
* **AI Model:** OpenAI GPT-4 / Google Gemini (via API)
* **Database:** SQL (for chat logs)
* **Analytics:** Tableau (for performance dashboards)
* **CRM:** Salesforce (for ticketing escalation)
