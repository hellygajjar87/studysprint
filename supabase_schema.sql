-- Run this entire script in your Supabase SQL Editor to create your database tables.

-- Semester Table
CREATE TABLE semesters (
  id TEXT PRIMARY KEY,
  number INTEGER NOT NULL,
  name TEXT NOT NULL
);

-- Subject Table
CREATE TABLE subjects (
  id TEXT PRIMARY KEY,
  code TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  credits INTEGER NOT NULL,
  semester_id TEXT REFERENCES semesters(id) ON DELETE CASCADE
);

-- Topic Table
CREATE TABLE topics (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  "order" INTEGER NOT NULL,
  subject_id TEXT REFERENCES subjects(id) ON DELETE CASCADE
);

-- Notes Table
CREATE TABLE notes (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  is_important BOOLEAN DEFAULT FALSE,
  last_updated TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  content JSONB NOT NULL, -- Storing bullet point arrays as a JSONB list
  topic_id TEXT REFERENCES topics(id) ON DELETE CASCADE
);

-- MCQs Table
CREATE TABLE mcqs (
  id TEXT PRIMARY KEY,
  question TEXT NOT NULL,
  difficulty TEXT NOT NULL,
  marks INTEGER NOT NULL,
  explanation TEXT,
  options JSONB NOT NULL, -- Storing [{id, text, isCorrect}] as a JSONB array
  topic_id TEXT REFERENCES topics(id) ON DELETE CASCADE
);

-- Important Questions Table
CREATE TABLE important_questions (
  id TEXT PRIMARY KEY,
  question TEXT NOT NULL,
  marks INTEGER NOT NULL,
  is_pyq BOOLEAN DEFAULT FALSE,
  year_asked JSONB, -- Array of years it was asked
  answer TEXT NOT NULL,
  topic_id TEXT REFERENCES topics(id) ON DELETE CASCADE
);

-- Viva Questions Table
CREATE TABLE viva_questions (
  id TEXT PRIMARY KEY,
  question TEXT NOT NULL,
  answer TEXT NOT NULL,
  tips TEXT,
  topic_id TEXT REFERENCES topics(id) ON DELETE CASCADE
);

-- Enable RLS (Row Level Security) - By default we allow public read access for now
ALTER TABLE semesters ENABLE ROW LEVEL SECURITY;
ALTER TABLE subjects ENABLE ROW LEVEL SECURITY;
ALTER TABLE topics ENABLE ROW LEVEL SECURITY;
ALTER TABLE notes ENABLE ROW LEVEL SECURITY;
ALTER TABLE mcqs ENABLE ROW LEVEL SECURITY;
ALTER TABLE important_questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE viva_questions ENABLE ROW LEVEL SECURITY;

-- Create policies for public reading
CREATE POLICY "Allow public read access to semesters" ON semesters FOR SELECT USING (true);
CREATE POLICY "Allow public read access to subjects" ON subjects FOR SELECT USING (true);
CREATE POLICY "Allow public read access to topics" ON topics FOR SELECT USING (true);
CREATE POLICY "Allow public read access to notes" ON notes FOR SELECT USING (true);
CREATE POLICY "Allow public read access to mcqs" ON mcqs FOR SELECT USING (true);
CREATE POLICY "Allow public read access to important_questions" ON important_questions FOR SELECT USING (true);
CREATE POLICY "Allow public read access to viva_questions" ON viva_questions FOR SELECT USING (true);
