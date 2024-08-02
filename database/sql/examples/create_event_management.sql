
CREATE TABLE IF NOT EXISTS events (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS sessions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    start_time TIME NOT NULL,
    event_id INT REFERENCES events(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS speakers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    biography TEXT,
    presentation_history TEXT
);

CREATE TABLE IF NOT EXISTS session_speakers (
    session_id INT REFERENCES sessions(id) ON DELETE CASCADE,
    speaker_id INT REFERENCES speakers(id) ON DELETE CASCADE,
    PRIMARY KEY (session_id, speaker_id)
);

CREATE TABLE IF NOT EXISTS participants (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    company VARCHAR(255),
    contact_info VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS session_participants (
    session_id INT REFERENCES sessions(id) ON DELETE CASCADE,
    participant_id INT REFERENCES participants(id) ON DELETE CASCADE,
    PRIMARY KEY (session_id, participant_id)
);
