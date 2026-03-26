# 📚 Paperback Book Theme for Jekyll

<a href="https://jekyll-themes.com/[GITHUB USER NAME]/[GITHUB REPOSITORY NAME]">
  <img
    src="https://img.shields.io/badge/featured%20on-JT-red.svg"
    height="20"
    alt="Jekyll Themes Shield"
  />
</a>

A beautiful, vintage-inspired Jekyll theme for creating book library/profile pages. Based on the original [Paperback HTML design](https://toyhou.se/30182937.paperback-f2u/30231690.live-preview) by Starcorex, adapted for Jekyll with dynamic content generation.

![Theme Preview](https://github.com/breakthebull/book-theme/blob/main/library.png) | ![Theme Preview](https://github.com/breakthebull/book-theme/blob/main/screenshot.png)
--- | ---
![Theme Preview](https://github.com/breakthebull/book-theme/blob/main/mobile-book-view) | 

---

## Features

- **Decorative Card Layout** – Double-border frame with ornamental corner symbols (❧)
- **Left Sidebar**
  - Book cover image with decorative corners
  - Optional "Buy Book" button
  - Quote box with elegant line dividers
  - 5 metadata sections with alternating background colors
  - About/Warning section (full-width)
- **Right Content Area**
  - Book title with trait tags `[ TRAIT / TRAIT / TRAIT ]`
  - Scrollable introduction box with drop cap (CSS `::first-letter`)
  - Horizontal scrolling related books list (hidden scrollbar)
  - Footer with credits
- **Responsive Design** – Optimized for desktop, tablet, and mobile
- **Auto-Generated Links** – Related books pull automatically from your `_books/` collection
- **Batch File Generator** – `new-book.bat` creates new book profiles with interactive prompts

---

## Installation

### 1. Clone or Download
```bash
# Clone your repository
git clone https://github.com/breakthebull/book-theme.git
cd book-theme
```

### 2. Install Dependencies
```bash
bundle install
```

### 3. Configure `_config.yml`
```yaml
title: "My Book Library"
author: "Your Name"
url: "https://yourdomain.com"

collections:
  books:
    output: true
    permalink: /books/:title/
```

### 4. Run Locally
```bash
bundle exec jekyll serve
```
Visit `http://localhost:4000`

### 5. Deploy
```bash
bundle exec jekyll build
# Upload contents of _site/ folder to public_html/ via FTP
```

---

## Creating New Books

### Option 1: Use the Batch Generator (Windows)
```bash
new-book.bat
```
Follow the interactive prompts to fill in book details. The file will auto-open in your default editor.

### Option 2: Manual Creation
Create a new file in `_books/`:
```yaml
---
title: "The Great Gatsby"
subtitle: "A Novel"
author: "F. Scott Fitzgerald"
published: "1925"
publisher: "Charles Scribner's Sons"
genre: "Classic Fiction"
series: "Standalone"
pages: "180"
status: "Completed"
traits: ["Tragic", "Symbolic", "Elegant"]
cover_image: "/assets/covers/gatsby.jpg"
quote: "So we beat on, boats against the current..."
description: "A story of wealth, love, and the American Dream."
buy_link: "https://amazon.com/example"
content_warning: "Infidelity, Death"
about_text: "A story of wealth, love, and the American Dream in the Jazz Age."
work_in_progress: false
---

## Introduction

Write your book review, analysis, or synopsis here...
```

---

## Customization

### Colors
Edit `_sass/main.scss` variables:
```scss
$color-bg: #f5f3ed;
$color-text: #4a4a4a;
$color-accent: #8b7355;
$color-border: #c9b9a4;
```

## Credits

- **Original Design:** [Starcorex](https://toyhou.se/30182937.paperback-f2u/30231690.live-preview) on Toyhou.se
- **Jekyll Adaptation:** DAR
- **Fonts:** Cormorant Garamond, Space Mono (Google Fonts)

---

## License

This theme is adapted from the original Paperback HTML design. Please credit [Starcorex](https://toyhou.se/30182937.paperback-f2u/30231690.live-preview) and me when using this theme.

## 📬 Support

For questions or issues, please open a GitHub issue or contact me directly.

---

**Happy Reading! 📚✨**
