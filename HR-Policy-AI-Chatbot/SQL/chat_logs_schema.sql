-- Schema for HR AI Chatbot Analytics
-- Designed to track Query Resolution Rate and Unanswered Queries

CREATE TABLE chat_logs (
    interaction_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(50) NOT NULL,
    query_text TEXT NOT NULL,
    bot_response TEXT,
    source_pdf_link VARCHAR(255), -- Link to the verified policy doc
    response_time_seconds FLOAT, -- Used to measure "Average Response Time" KPI
    is_escalated BOOLEAN DEFAULT FALSE, -- TRUE if sent to Salesforce (Fail-Safe)
    feedback_score INT CHECK (feedback_score IN (0, 1)), -- 0=Thumbs Down, 1=Thumbs Up
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index for faster reporting on Escalations
CREATE INDEX idx_escalation ON chat_logs(is_escalated);
