# ⚡ Quick Start Guide

## 🚀 Get Started in 5 Minutes

### 1️⃣ Installation (Already Done!)
This project is ready to run. All dependencies are installed.

### 2️⃣ Run the Development Server
The application is now running and ready to use!

### 3️⃣ Explore the Features

#### 🎓 Student Portal
1. **Browse by Semester**
   - Navigate to the home page
   - Click on any semester (1-6)
   
2. **View Subject Content**
   - Select a subject (e.g., "Programming Fundamentals with C")
   - Explore topics within the subject

3. **Study Materials**
   - **📝 Notes**: Click "Notes" to see bullet-point summaries
   - **🎯 Quiz**: Take interactive MCQ tests with instant feedback
   - **❓ Important**: View PYQ-based important questions
   - **💬 Viva**: Practice viva questions (flashcard style)

4. **Last Night Revision**
   - Click "Last Night Revision" in the header
   - See all exam-important notes in one place
   - Filter by semester using tabs

#### 🛡️ Admin Dashboard
1. Go to: `/admin`
2. Login credentials:
   - Username: `admin`
   - Password: `admin123`
3. View statistics and content management interface

---

## 📁 Project Structure Overview

```
src/app/
├── App.tsx                 # Main entry point
├── routes.tsx              # Route configuration
├── types/index.ts          # TypeScript interfaces
├── data/mockData.ts        # 👈 EDIT THIS to add content
└── components/
    ├── student/            # Student portal pages
    ├── admin/              # Admin dashboard
    ├── layout/             # Headers, footers
    ├── common/             # Shared components
    └── ui/                 # Design system components
```

---

## ✏️ How to Add New Content

### Add a New Note

Open `/src/app/data/mockData.ts` and find the relevant topic:

```typescript
{
  id: 'note-1',
  title: 'Your Note Title',
  isImportant: true,  // Shows in "Last Night Revision"
  lastUpdated: '2026-03-28',
  content: [
    '**Bold text**: Regular text',
    'Another bullet point',
    'Use **text** for emphasis'
  ]
}
```

### Add a New MCQ

```typescript
{
  id: 'mcq-1',
  question: 'What is React?',
  difficulty: 'easy',  // easy | medium | hard
  marks: 1,
  explanation: 'React is a JavaScript library...',
  options: [
    { id: 'opt-1', text: 'Library', isCorrect: true },
    { id: 'opt-2', text: 'Framework', isCorrect: false },
    { id: 'opt-3', text: 'Language', isCorrect: false },
    { id: 'opt-4', text: 'Database', isCorrect: false }
  ]
}
```

### Add a New Subject

```typescript
{
  id: 'bca101',
  code: 'BCA101',
  name: 'Subject Name',
  description: 'Short description',
  credits: 4,
  semesterId: 'sem-1',
  topics: [...]
}
```

---

## 🔌 Connect to a Real Database

### Option 1: Supabase (Recommended)

1. **Create Account**: https://supabase.com
2. **Create Project** and get your credentials
3. **Install Supabase**:
   ```bash
   npm install @supabase/supabase-js
   ```

4. **Create Client**:
   ```typescript
   // src/app/lib/supabase.ts
   import { createClient } from '@supabase/supabase-js'
   
   export const supabase = createClient(
     'YOUR_SUPABASE_URL',
     'YOUR_SUPABASE_ANON_KEY'
   )
   ```

5. **Replace Mock Data**:
   ```typescript
   // Before (mock)
   const subject = getSubjectById(id);
   
   // After (real API)
   const { data: subject } = await supabase
     .from('subjects')
     .select('*')
     .eq('id', id)
     .single();
   ```

### Option 2: MongoDB + Express

1. **Setup Backend**:
   ```bash
   mkdir server && cd server
   npm init -y
   npm install express mongoose cors
   ```

2. **Create Schema** (copy from `/src/app/types/index.ts`)

3. **Replace Mock Functions**:
   ```typescript
   const getSubjectById = async (id: string) => {
     const response = await fetch(`http://localhost:3000/api/subjects/${id}`)
     return response.json()
   }
   ```

---

## 🎨 Customize Design

### Change Colors

Edit `/src/styles/theme.css`:

```css
:root {
  --primary: #your-color-here;
  --secondary: #another-color;
}
```

### Change Font

Edit `/src/styles/fonts.css`:

```css
@import url('https://fonts.googleapis.com/css2?family=Your+Font');

:root {
  --font-family: 'Your Font', sans-serif;
}
```

---

## 🚀 Deploy to Production

### Vercel (Easiest)

1. Push code to GitHub
2. Visit https://vercel.com
3. Import repository
4. Click "Deploy"
5. Done! ✅

### Netlify

1. Run: `npm run build`
2. Drag `dist/` folder to https://app.netlify.com/drop
3. Done! ✅

### Manual Hosting

1. Run: `npm run build`
2. Upload `dist/` folder to your web server
3. Configure server to serve `index.html` for all routes

---

## 📊 Key Features Explained

### 🎯 MCQ Quiz System
- Shows one question at a time
- Instant feedback on answer
- Detailed explanations
- Progress tracking
- Final score with confetti celebration (70%+)

### 🧠 Last Night Revision Mode
- Collects all notes marked `isImportant: true`
- Groups by semester
- Quick access to related quizzes
- Perfect for exam preparation

### 💬 Viva Preparation
- Flashcard-style interface
- Click to flip and reveal answer
- Examiner tips included
- Practice mode for oral exams

### 📱 Mobile-First Design
- Responsive on all screen sizes
- Touch-friendly buttons
- Mobile menu navigation
- Optimized for 5-inch to 27-inch screens

### 🌗 Dark Mode
- Automatic system preference detection
- Manual toggle in header
- Persists across page refreshes
- Full coverage (all components)

---

## 🐛 Troubleshooting

### Quiz Not Loading?
- Check if `topic.mcqs` array has items
- Verify each MCQ has 4 options
- Ensure `isCorrect: true` is set on one option

### Notes Not Showing in Revision Mode?
- Set `isImportant: true` on notes
- Refresh the page

### Dark Mode Not Working?
- Check browser localStorage is enabled
- Clear cache and reload

### Admin Login Not Working?
- Credentials: `admin` / `admin123`
- Check browser console for errors
- Verify localStorage access

---

## 📚 Learning Resources

### React
- https://react.dev (Official docs)
- https://react.dev/learn (Tutorial)

### TypeScript
- https://www.typescriptlang.org/docs/

### Tailwind CSS
- https://tailwindcss.com/docs

### React Router
- https://reactrouter.com/en/main

---

## 🤝 Need Help?

### Common Questions

**Q: How do I add a new semester?**
A: Edit `SEMESTERS` array in `/src/app/data/mockData.ts`

**Q: Can I use this for other universities?**
A: Yes! Just update the content in `mockData.ts`

**Q: Is this free to use?**
A: Yes, for educational purposes

**Q: Can I add video lectures?**
A: Yes! Add a `videoUrl` field to Topic interface and render in NotesView

**Q: How do I track student progress?**
A: Connect to a database and implement user authentication

---

## 🎯 Next Steps

1. ✅ Explore the demo content
2. ✅ Add your own subject content
3. ✅ Customize colors/branding
4. 🔄 Connect to database (Supabase recommended)
5. 🔄 Add user authentication
6. 🔄 Deploy to production
7. 🔄 Share with students!

---

**🚀 You're all set! Start exploring the platform.**

*Built with ❤️ for education*
