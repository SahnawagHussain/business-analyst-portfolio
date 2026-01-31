-- Schema for tracking HR Chatbot interactions
CREATE TABLE chat_logs (
    interaction_id INT PRIMARY KEY,
    employee_id VARCHAR(50),
    query_text TEXT,
    bot_response TEXT,
    response_time_ms INT,
    escalated_to_salesforce BOOLEAN, -- Tracks if it went to a human
    feedback_score INT -- Thumbs up/down
);
