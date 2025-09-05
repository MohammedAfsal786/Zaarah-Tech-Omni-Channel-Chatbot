-- Leads collected from any channel
CREATE TABLE IF NOT EXISTS leads (
id SERIAL PRIMARY KEY,
name VARCHAR(120),
phone VARCHAR(50),
email VARCHAR(120),
channel VARCHAR(40) NOT NULL, -- web, messenger, instagram, whatsapp, telegram
meta JSONB,
created_at TIMESTAMP DEFAULT NOW()
);


-- FAQ pairs for quick replies
CREATE TABLE IF NOT EXISTS faq (
id SERIAL PRIMARY KEY,
question VARCHAR(255) NOT NULL,
answer TEXT NOT NULL,
tags VARCHAR(120),
lang VARCHAR(10) DEFAULT 'en'
);


-- message transcripts
CREATE TABLE IF NOT EXISTS transcripts (
id SERIAL PRIMARY KEY,
user_id VARCHAR(120), -- channel user id
channel VARCHAR(40) NOT NULL,
direction VARCHAR(10) NOT NULL, -- inbound/outbound
message TEXT NOT NULL,
payload JSONB,
created_at TIMESTAMP DEFAULT NOW()
);


-- sessions to keep context by channel user id
CREATE TABLE IF NOT EXISTS sessions (
id SERIAL PRIMARY KEY,
user_id VARCHAR(120) UNIQUE NOT NULL,
channel VARCHAR(40) NOT NULL,
context JSONB,
updated_at TIMESTAMP DEFAULT NOW()
);
