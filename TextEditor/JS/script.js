
const editor = document.getElementById("editor");
const fileName = document.getElementById("fileName");
const saveStatus = document.getElementById("saveStatus");

const savedText = localStorage.getItem("textflow-content");
const savedName = localStorage.getItem("textflow-name");

if (savedText !== null) {
    editor.innerHTML = savedText;
}

if (savedName) {
    fileName.value = savedName;
}

function getPlainText() {
    return editor.innerText.replace(/\n+$/, "");
}

function updateStats() {
    const text = getPlainText().trim();
    const words = text ? text.split(/\s+/).length : 0;
    const chars = getPlainText().length;

    document.getElementById("wordCount").textContent = words;
    document.getElementById("charCount").textContent = chars;
    document.getElementById("readTime").textContent =
        words ? Math.ceil(words / 200) : 0;
}

function saveDocument() {
    try {
        localStorage.setItem("textflow-content", editor.innerHTML);
        localStorage.setItem("textflow-name", fileName.value);
        saveStatus.textContent = "Saved in this browser";
    } catch (error) {
        saveStatus.textContent = "Unable to save locally";
    }

    updateStats();
}

editor.addEventListener("input", saveDocument);
fileName.addEventListener("input", saveDocument);

document.querySelectorAll("[data-command]").forEach(button => {
    button.addEventListener("click", () => {
        editor.focus();
        document.execCommand(button.dataset.command, false, null);
        saveDocument();
    });
});

document.getElementById("fontSize").addEventListener("change", event => {
    editor.focus();
    document.execCommand("fontSize", false, event.target.value);
    saveDocument();
});

document.getElementById("clearBtn").addEventListener("click", () => {
    if (confirm("Clear all text in this document?")) {
        editor.innerHTML = "";
        saveDocument();
        editor.focus();
    }
});

document.getElementById("openBtn").addEventListener("click", () => {
    document.getElementById("fileInput").click();
});

document.getElementById("fileInput").addEventListener("change", async event => {
    const file = event.target.files[0];
    if (!file) return;

    if (file.size > 2 * 1024 * 1024) {
        alert("Please select a text file smaller than 2 MB.");
        event.target.value = "";
        return;
    }

    const text = await file.text();

    // Treat imported text as text, not executable HTML.
    editor.textContent = text;
    fileName.value = file.name.replace(/\.txt$/i, "") || "Untitled document";

    saveDocument();
    event.target.value = "";
});

document.getElementById("downloadBtn").addEventListener("click", () => {
    const blob = new Blob([getPlainText()], {
        type: "text/plain;charset=utf-8"
    });

    const url = URL.createObjectURL(blob);
    const link = document.createElement("a");

    const name = fileName.value.trim() || "Untitled document";
    link.href = url;
    link.download = name.toLowerCase().endsWith(".txt")
        ? name
        : name + ".txt";

    link.click();
    URL.revokeObjectURL(url);
});

document.getElementById("themeBtn").addEventListener("click", () => {
    document.body.classList.toggle("dark");

    localStorage.setItem(
        "textflow-theme",
        document.body.classList.contains("dark") ? "dark" : "light"
    );
});

if (localStorage.getItem("textflow-theme") === "dark") {
    document.body.classList.add("dark");
}

updateStats();
