# Assembly Basics 🧩

A beginner-friendly repository for learning **x86 Assembly Language** and understanding how high-level code maps to low-level machine instructions.  
This project focuses on **core CPU concepts**, **instruction behavior**, and foundations useful for **reverse engineering**.

> ⚠️ **Important Note**  
> All assembly examples in this repository are written for **Linux environments only**.  
> They rely on **Linux system calls**, Linux calling conventions, and **ELF binaries**,  
> so they will **not run on Windows or macOS without modification**.

---

## 📌 What You’ll Learn
- x86 Assembly syntax and structure
- CPU registers and memory addressing
- Stack behavior (`push` / `pop` / `call` / `ret`)
- Loops, conditions, and jumps
- Function calls and stack frames
- Calling conventions (32-bit & 64-bit)
- How Linux interacts with assembly via syscalls

---

## 🧠 Architectures Covered
- **x86 (32-bit)** — Linux ELF
- **x86-64 (64-bit)** — Linux ELF

---

## 🐧 Platform & OS
- **Linux only**
- Uses:
  - `int 0x80` (x86)
  - `syscall` instruction (x86-64)
- Entry points like `_start`
- No Windows WinAPI
- No macOS Mach-O binaries

> 💡 If you are on Windows, use **WSL** or a **Linux virtual machine**.

---

## 🛠 Tools Used
- **NASM** – Assembler
- **Linux / WSL** – Execution environment

---

## 🎯 Target Audience
- Beginners learning x86 Assembly
- Students studying low-level programming
- Reverse engineering beginners
- Anyone curious how software works *below* high-level languages
