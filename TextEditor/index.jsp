
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TextFlow | Text Editor</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="topbar">
        <a class="brand" href="index.jsp">
            <span class="brand-icon">T</span>
            TextFlow
        </a>
        <div class="top-actions">
            <span class="status"><span></span> All changes saved locally</span>
            <button id="themeBtn" class="icon-btn" title="Toggle theme">◐</button>
        </div>
    </header>

    <main class="workspace">
        <section class="welcome">
            <div>
                <p class="eyebrow">YOUR WRITING SPACE</p>
                <h1>Ideas start <span>here.</span></h1>
                <p class="subtitle">A simple, focused space for your thoughts.</p>
            </div>
            <div class="actions">
                <button class="btn secondary" id="openBtn">↑ Open file</button>
                <button class="btn primary" id="downloadBtn">↓ Export .txt</button>
                <input type="file" id="fileInput" accept=".txt,text/plain" hidden>
            </div>
        </section>

        <section class="editor-card">
            <div class="document-bar">
                <div class="document-name">
                    <span class="file-icon">▤</span>
                    <input id="fileName" value="Untitled document"
                           aria-label="Document name">
                    <span class="live-dot"></span>
                </div>
                <button class="clear-btn" id="clearBtn">Clear document</button>
            </div>

            <div class="toolbar">
                <select id="fontSize" aria-label="Font size">
                    <option value="2">Small</option>
                    <option value="3" selected>Normal</option>
                    <option value="4">Large</option>
                    <option value="5">Extra large</option>
                </select>
                <span class="tool-divider"></span>
                <button class="tool" data-command="bold" title="Bold"><b>B</b></button>
                <button class="tool" data-command="italic" title="Italic"><i>I</i></button>
                <button class="tool" data-command="underline" title="Underline"><u>U</u></button>
                <span class="tool-divider"></span>
                <button class="tool" data-command="justifyLeft" title="Align left">☰</button>
                <button class="tool" data-command="justifyCenter" title="Align center">≡</button>
                <button class="tool" data-command="insertUnorderedList" title="Bullet list">☷</button>
            </div>

            <div id="editor" contenteditable="true" spellcheck="true"
                 data-placeholder="Start writing something wonderful..."></div>

            <div class="editor-footer">
                <span id="saveStatus">Ready to write</span>
                <div class="stats">
                    <span><strong id="wordCount">0</strong> words</span>
                    <span><strong id="charCount">0</strong> characters</span>
                    <span><strong id="readTime">0</strong> min read</span>
                </div>
            </div>
        </section>

        <p class="privacy-note"> --Your writing stays in this browser. Export a text file to keep a copy.--</p>
        <P class="privacy-note">Rajveer Kushwaha</P>
    </main>

    <script src="JS/script.js"></script>
</body>
</html>
