@echo off
setlocal enabledelayedexpansion

:: ========================================
:: NEW BOOK GENERATOR FOR JEKYLL
:: ========================================
echo.
echo ========================================
echo    [New Book Profile Generator]
echo ========================================
echo.

:: --- Required Fields ---
set /p title=Enter book title (required):
if "!title!"=="" (
    echo ERROR: Title is required!
    exit /b 1
)

set /p author=Enter author name (required):
if "!author!"=="" (
    echo ERROR: Author is required!
    exit /b 1
)

set /p genre=Enter genre (required):
if "!genre!"=="" (
    echo ERROR: Genre is required!
    exit /b 1
)

:: --- Optional Fields with Defaults ---
echo.
echo [Optional - Press Enter to skip]
echo.

set /p subtitle=Subtitle:
set /p published=Published year:
set /p publisher=Publisher:
set /p pages=Page count:
set /p series=Series name (or Standalone):
if "!series!"=="" set "series=Standalone"

set /p status=Status [Completed/Reading/Wishlist] (default: Completed):
if "!status!"=="" set "status=Completed"

echo.
echo Traits (up to 3, comma-separated):
set /p traits_input=Example: Tragic, Symbolic, Elegant:

:: Parse traits into YAML array format (comma-separated, quoted)
set "traits_yaml="
if not "!traits_input!"=="" (
    :: Replace commas with spaces for proper tokenization
    set "traits_clean=!traits_input:,= !"
    for %%a in (!traits_clean!) do (
        set "trait=%%a"
        :: Trim spaces
        for /f "tokens=* delims= " %%b in ("!trait!") do set "trait=%%b"
        if not "!trait!"=="" (
            if not "!traits_yaml!"=="" set "traits_yaml=!traits_yaml!, "
            :: Plain quotes, NO backslashes, comma separator
            set "traits_yaml=!traits_yaml!"!trait!""
        )
    )
    set "traits_yaml=[!traits_yaml!]"
) else (
    :: Default empty traits
    set "traits_yaml=["", "", ""]"
)

set /p cover_image=Cover image path (default: /assets/covers/placeholder.jpg):
if "!cover_image!"=="" set "cover_image=/assets/covers/placeholder.jpg"

set /p quote=Famous quote from the book:
set /p description=One-line description:
set /p buy_link=Buy link (Amazon, etc.):
set /p content_warning=Content warning (if any):
set /p about_title=About section title (default: ABOUT THIS BOOK):
if "!about_title!"=="" set "about_title=ABOUT THIS BOOK"
set /p about_text=About section text:

set /p wip=Work in progress? [y/n] (default: n):
if /i "!wip!"=="y" (
    set "work_in_progress=true"
) else (
    set "work_in_progress=false"
)

:: --- Generate Safe Filename ---
set "filename=!title!"
set "filename=!filename: =-!"
set "filename=!filename:"=!"
set "filename=!filename:/=-!"
set "filename=!filename:<=-!"
set "filename=!filename:>=-!"
set "filename=!filename::=-!"
set "filename=_books/!filename!.md"

:: --- Write the File ---
(
    echo ---
    echo title: "!title!"
    if not "!subtitle!"=="" echo subtitle: "!subtitle!"
    echo author: "!author!"
    if not "!published!"=="" echo published: "!published!"
    if not "!publisher!"=="" echo publisher: "!publisher!"
    echo genre: "!genre!"
    if not "!series!"=="" echo series: "!series!"
    if not "!pages!"=="" echo pages: "!pages!"
    echo status: "!status!"
    echo traits: !traits_yaml!
    echo cover_image: "!cover_image!"
    if not "!quote!"=="" echo quote: "!quote!"
    if not "!description!"=="" echo description: "!description!"
    if not "!buy_link!"=="" echo buy_link: "!buy_link!"
    if not "!content_warning!"=="" echo content_warning: "!content_warning!"
    echo about_title: "!about_title!"
    if not "!about_text!"=="" echo about_text: "!about_text!"
    echo work_in_progress: !work_in_progress!
    echo ---
    echo.
    echo ## Introduction
    echo.
    echo *Write your book review, analysis, or synopsis here. This content will appear in the scrollable box on the right side of the page.*
    echo.
    echo Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
    echo.
    echo ### Key Themes
    echo.
    echo - Theme one
    echo - Theme two
    echo - Theme three
    echo.
    echo ### Final Thoughts
    echo.
    echo Your concluding thoughts about the book...
) > "!filename!"

:: --- Success Message ---
echo.
echo ========================================
echo    [✓ Book Profile Created!]
echo ========================================
echo.
echo File: !filename!
echo.
echo Next steps:
echo   1. Add your cover image to /assets/covers/
echo   2. Edit the file to refine content if needed
echo   3. Run: bundle exec jekyll build
echo   4. Upload _site/ contents to Nixihost via FTP
echo.

:: --- Open File in Default Editor ---
start "" "!filename!"

echo.
echo Opening file in default editor...
pause