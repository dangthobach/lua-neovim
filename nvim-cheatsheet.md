# 🚀 NEOVIM CHEATSHEET — Bách's Dev Setup
### LazyVim + Custom Plugins | Beginner-Friendly Guide

> **Quy ước:** `<leader>` = `Space` | `C-` = Ctrl | `A-` = Alt | `S-` = Shift
> **Mode:** `n` = Normal | `i` = Insert | `v` = Visual | `x` = Visual Block

---

## 🧠 TƯ DUY GHI NHỚ — "NGÔI NHÀ NEOVIM"

Hãy tưởng tượng Neovim là **ngôi nhà của bạn**:

| Phòng (Prefix)       | Ý nghĩa                  | Nhớ bằng cách...                    |
|----------------------|---------------------------|--------------------------------------|
| `<leader>f`          | 🔍 **Find** – Tìm kiếm    | **F**ind = Tìm file, text, symbol   |
| `<leader>b`          | 📄 **Buffer** – Tab file   | **B**uffer = Trang giấy đang mở     |
| `<leader>w`          | 🪟 **Window** – Cửa sổ    | **W**indow = Chia/đóng cửa sổ       |
| `<leader>g`          | 🌿 **Git** – Quản lý code | **G**it = Xem diff, blame, history   |
| `<leader>c`          | 💻 **Code** – Viết code    | **C**ode = Format, rename, action    |
| `<leader>x`          | ⚠️ **Diagnostics** – Lỗi  | **X** = Dấu X lỗi                    |
| `<leader>s`          | 🔎 **Search** – Tìm nâng cao | **S**earch = Grep, symbols        |
| `<leader>q`          | 💾 **Session** – Phiên làm việc | **Q**uit/Session = Lưu/khôi phục|
| `<leader>r`          | 🌐 **REST/Run** – API test | **R**un = Chạy request               |
| `<leader>d`          | 🗄️ **Database**            | **D**atabase = Kết nối DB            |
| `<leader>t`          | 🧪 **Test**                | **T**est = Chạy test                 |
| `<leader>n`          | 🎨 **Next theme**          | **N**ext = Đổi theme                 |

---

## 1. 🧭 DI CHUYỂN CƠ BẢN (Không cần nhớ prefix)

### Di chuyển trong file
```
  ↑
  k
← h   l →     ← Thay thế phím mũi tên!
  j
  ↓
```

| Keymap         | Chức năng                         | Mẹo nhớ                           |
|----------------|-----------------------------------|------------------------------------|
| `h j k l`      | ← ↓ ↑ →                          | Tay ở home row!                    |
| `w`            | Nhảy đến đầu **word** tiếp       | **W**ord                           |
| `b`            | Nhảy **back** về word trước       | **B**ack                           |
| `e`            | Nhảy đến cuối (**end**) word      | **E**nd                            |
| `0`            | Về đầu dòng                      | Số 0 = bắt đầu                    |
| `$`            | Về cuối dòng                     | $ = kết thúc (regex)               |
| `gg`           | Lên đầu file                     | **G**o **G**o lên trên!            |
| `G`            | Xuống cuối file                   | **G** lớn = đi xa                  |
| `{` / `}`      | Nhảy paragraph lên/xuống          | {} = khối code                     |
| `%`            | Nhảy giữa cặp `()` `{}` `[]`     | % = matching pair                  |
| `Ctrl+d`       | Cuộn xuống nửa trang              | **D**own                           |
| `Ctrl+u`       | Cuộn lên nửa trang                | **U**p                             |
| `f{char}`      | Nhảy đến ký tự {char} phía trước | **F**ind char                      |
| `F{char}`      | Nhảy đến ký tự {char} phía sau   | **F**ind ngược                     |

---

## 2. ✏️ CHỈNH SỬA CƠ BẢN

| Keymap         | Chức năng                         | Mẹo nhớ                           |
|----------------|-----------------------------------|------------------------------------|
| `i`            | Chèn trước cursor                 | **I**nsert                         |
| `a`            | Chèn sau cursor                   | **A**ppend                         |
| `o`            | Thêm dòng mới bên dưới           | **O**pen line below                |
| `O`            | Thêm dòng mới bên trên           | **O** lớn = open above             |
| `dd`           | Xóa dòng                         | **D**elete **D**ouble              |
| `yy`           | Copy dòng                        | **Y**ank = Copy                    |
| `p`            | Paste sau cursor                  | **P**aste                          |
| `P`            | Paste trước cursor                | **P** lớn = paste trước            |
| `u`            | Undo                             | **U**ndo                           |
| `Ctrl+r`       | Redo                             | **R**edo                           |
| `x`            | Xóa 1 ký tự                      | X = cắt bỏ                        |
| `r{char}`      | Thay thế 1 ký tự                 | **R**eplace                        |
| `ciw`          | Xóa word & chèn (Change In Word) | **C**hange **I**n **W**ord         |
| `ci"`          | Xóa trong "" & chèn              | **C**hange **I**nside "            |
| `di(`          | Xóa trong ()                     | **D**elete **I**nside (            |
| `va{`          | Chọn cả {} bao ngoài             | **V**isual **A**round {            |
| `.`            | Lặp lại thao tác trước           | Dấu chấm = repeat                 |
| `~`            | Đổi HOA/thường                    | ~ = toggle                        |
| `>>`           | Indent phải                      | >> = đẩy sang phải                 |
| `<<`           | Indent trái                      | << = đẩy sang trái                 |

---

## 3. 🔍 TÌM KIẾM & THAY THẾ

| Keymap                  | Chức năng                     | Mẹo nhớ                       |
|-------------------------|-------------------------------|--------------------------------|
| `/pattern`              | Tìm kiếm                     | / = search                     |
| `n`                     | Kết quả tiếp theo             | **N**ext                       |
| `N`                     | Kết quả trước đó              | **N** lớn = ngược              |
| `*`                     | Tìm word đang đứng            | * = highlight all              |
| `:%s/old/new/g`         | Thay thế toàn file            | **S**ubstitute                 |
| `:%s/old/new/gc`        | Thay thế có xác nhận          | **C**onfirm                    |

---

## 4. 📁 FILE & BUFFER — `<leader>f` / `<leader>b`

### FZF-Lua (Tìm file siêu nhanh)
| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `<leader>ff`        | 🔍 Find Files                  | **F**ind **F**iles             |
| `<leader>fr`        | 📋 Recent Files                | **F**ind **R**ecent            |
| `<leader>fb`        | 📄 Buffers đang mở             | **F**ind **B**uffers           |
| `<leader>fg`        | 🔎 Live Grep (tìm text)        | **F**ind by **G**rep           |
| `<leader>fw`        | 🔤 Tìm word dưới cursor        | **F**ind **W**ord              |
| `<leader>fc`        | ⚙️ Neovim config files          | **F**ind **C**onfig            |
| `<leader><leader>`  | 🔍 Find Files (shortcut)       | Double leader = quick find     |

### Buffer Management
| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `<leader>bb`        | Switch buffer                  | **B**uffer **B**rowse          |
| `<leader>bd`        | Đóng buffer hiện tại           | **B**uffer **D**elete          |
| `<leader>bo`        | Đóng tất cả buffer khác        | **B**uffer **O**nly            |
| `S-h`               | Buffer trước (←)               | Shift+H = sang trái           |
| `S-l`               | Buffer sau (→)                 | Shift+L = sang phải            |

---

## 5. 🪟 WINDOW & SPLIT — `<leader>w` + Smart Splits

### Tạo & Đóng cửa sổ
| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `<leader>w-`        | Chia ngang (horizontal)        | `-` = đường ngang              |
| `<leader>w\|`       | Chia dọc (vertical)            | `\|` = đường dọc              |
| `<leader>wd`        | Đóng cửa sổ                   | **W**indow **D**elete          |
| `<leader>Wc`        | Đóng tất cả floating window    | **W**orkspace **C**lean        |

### 🧭 Di chuyển giữa splits (Smart Splits + WezTerm)
```
        Ctrl+k
          ↑
Ctrl+h ←  ●  → Ctrl+l     ← Hoạt động cả trong WezTerm!
          ↓
        Ctrl+j
```

| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `Ctrl+h`            | ← Di chuyển sang trái          | hjkl rule!                    |
| `Ctrl+j`            | ↓ Di chuyển xuống dưới         | hjkl rule!                    |
| `Ctrl+k`            | ↑ Di chuyển lên trên           | hjkl rule!                    |
| `Ctrl+l`            | → Di chuyển sang phải           | hjkl rule!                    |

### 📐 Resize splits
| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `Alt+h`             | Resize ← thu nhỏ trái          | Alt + hjkl = resize           |
| `Alt+j`             | Resize ↓ thu nhỏ xuống         | Alt + hjkl = resize           |
| `Alt+k`             | Resize ↑ mở rộng lên           | Alt + hjkl = resize           |
| `Alt+l`             | Resize → mở rộng phải          | Alt + hjkl = resize           |

### 🔄 Swap buffers giữa splits
| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `<leader>wh`        | Swap buffer ← trái             | **W**indow swap **H** (left)  |
| `<leader>wj`        | Swap buffer ↓ xuống            | **W**indow swap **J** (down)  |
| `<leader>wk`        | Swap buffer ↑ lên              | **W**indow swap **K** (up)    |
| `<leader>wl`        | Swap buffer → phải             | **W**indow swap **L** (right) |

---

## 6. 💻 CODE INTELLIGENCE — `<leader>c` (LSP)

| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `gd`                | Go to Definition               | **G**o **D**efinition          |
| `gr`                | Go to References               | **G**o **R**eferences          |
| `gI`                | Go to Implementation           | **G**o **I**mplementation      |
| `gy`                | Go to Type Definition          | **G**o t**Y**pe                |
| `K`                 | Hover info (doc)               | K = Knowledge/doc popup        |
| `gK`                | Signature Help                 | **G**et **K**nowledge          |
| `<leader>ca`        | Code Action                    | **C**ode **A**ction            |
| `<leader>cr`        | Rename symbol                  | **C**ode **R**ename            |
| `<leader>cf`        | Format file/selection          | **C**ode **F**ormat            |
| `<leader>cl`        | Lsp Info                       | **C**ode **L**sp               |
| `<leader>cd`        | Line Diagnostics               | **C**ode **D**iagnostics       |

---

## 7. ⚠️ DIAGNOSTICS & TROUBLE — `<leader>x`

| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `<leader>xq`        | 📋 Diagnostics toàn project    | e**X**amine **Q**uality        |
| `<leader>xd`        | 📋 Diagnostics buffer hiện tại | e**X**amine **D**iagnostics    |
| `<leader>xx`        | Toggle Trouble                 | e**X**amine e**X**amine        |
| `]d`                | Next diagnostic                | ] = forward + **D**iagnostic   |
| `[d`                | Prev diagnostic                | [ = backward + **D**iagnostic  |
| `]e`                | Next error                     | ] = forward + **E**rror        |
| `[e`                | Prev error                     | [ = backward + **E**rror       |
| `]w`                | Next warning                   | ] = forward + **W**arning      |
| `[w`                | Prev warning                   | [ = backward + **W**arning     |

---

## 8. 🌿 GIT — `<leader>g`

| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `<leader>gg`        | LazyGit (full UI)              | **G**it **G**UI                |
| `<leader>gs`        | Git Status                     | **G**it **S**tatus             |
| `<leader>gb`        | Git Blame (dòng hiện tại)      | **G**it **B**lame              |
| `<leader>gd`        | Git Diff                       | **G**it **D**iff               |
| `<leader>gl`        | Git Log                        | **G**it **L**og                |
| `]h`                | Next hunk (thay đổi)           | ] = forward + **H**unk        |
| `[h`                | Prev hunk                      | [ = backward + **H**unk       |
| `<leader>ghs`       | Stage hunk                     | **G**it **H**unk **S**tage     |
| `<leader>ghr`       | Reset hunk                     | **G**it **H**unk **R**eset     |

---

## 9. 📌 HARPOON — `<leader>a/h/1-4` (File yêu thích)

> **Ý tưởng:** Harpoon = 🎣 Câu file! Đánh dấu 4 file quan trọng và nhảy tức thì.

| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `<leader>a`         | 🎣 Thêm file vào Harpoon       | **A**dd to harpoon             |
| `<leader>h`         | 📋 Mở menu Harpoon             | **H**arpoon menu               |
| `<leader>1`         | Nhảy đến file slot 1           | Slot 1                        |
| `<leader>2`         | Nhảy đến file slot 2           | Slot 2                        |
| `<leader>3`         | Nhảy đến file slot 3           | Slot 3                        |
| `<leader>4`         | Nhảy đến file slot 4           | Slot 4                        |

---

## 10. 🌐 REST API (Kulala) — `<leader>r`

> Dùng file `.http` hoặc `.rest` để test API ngay trong Neovim!

| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `<leader>rr`        | ▶️ Run Request                  | **R**un **R**equest            |
| `<leader>rl`        | 🔁 Re-run Last                  | **R**un **L**ast               |
| `<leader>rp`        | 📝 Scratchpad                   | **R**un scatch**P**ad          |
| `<leader>rn`        | ⏩ Next Request                  | **R**un **N**ext               |
| `<leader>rN`        | ⏪ Prev Request                  | **R**un **N** prev             |
| `<leader>re`        | 🌍 Select Environment           | **R**un **E**nvironment        |
| `<leader>ri`        | 🔍 Inspect Request              | **R**un **I**nspect            |

---

## 11. 🗄️ DATABASE (Dadbod) — `<leader>d`

| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `<leader>db`        | Toggle DB UI                   | **D**ata**B**ase UI            |
| `<leader>da`        | Thêm DB Connection             | **D**B **A**dd                 |
| `<leader>df`        | Tìm DB Buffer                  | **D**B **F**ind                |

---

## 12. 🧪 TEST & DEBUG — `<leader>t` / `<leader>d`

### Testing (neotest)
| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `<leader>tt`        | Run File Tests                 | **T**est **T**his file         |
| `<leader>tr`        | Run Nearest Test               | **T**est **R**un nearest       |
| `<leader>ts`        | Toggle Test Summary            | **T**est **S**ummary           |
| `<leader>to`        | Show Test Output               | **T**est **O**utput            |

### Debugging (DAP)
| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `<leader>dB`        | Set Breakpoint (conditional)    | **D**ebug **B**reakpoint       |
| `<leader>db`        | Toggle Breakpoint              | **D**ebug **b**reakpoint toggle|
| `<leader>dc`        | Continue                       | **D**ebug **C**ontinue         |
| `<leader>dC`        | Run to Cursor                  | **D**ebug **C**ursor           |
| `<leader>di`        | Step Into                      | **D**ebug step **I**nto        |
| `<leader>do`        | Step Over                      | **D**ebug step **O**ver        |
| `<leader>dO`        | Step Out                       | **D**ebug step **O**ut         |
| `<leader>dp`        | Pause                          | **D**ebug **P**ause            |
| `<leader>dr`        | Toggle REPL                    | **D**ebug **R**EPL             |
| `<leader>dt`        | Terminate                      | **D**ebug **T**erminate        |

---

## 13. 📐 CODE FOLDING — `z`

| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `za`                | Toggle fold tại cursor         | z = fold, **A**lternate        |
| `zo`                | Mở fold                        | z + **O**pen                   |
| `zc`                | Đóng fold                      | z + **C**lose                  |
| `zR`                | Mở TẤT CẢ folds               | z + **R** = Reveal all         |
| `zM`                | Đóng TẤT CẢ folds             | z + **M** = Mask all           |

---

## 14. 💾 SESSION & MISC — `<leader>q`

| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `<leader>qs`        | Restore Session (dir hiện tại) | **Q**uit/Session re**S**tore   |
| `<leader>ql`        | Restore Last Session           | **Q**uit/**L**ast session      |
| `<leader>qd`        | Don't Save Session             | **Q**uit **D**on't save        |
| `<leader>qq`        | Quit All                       | **Q**uit **Q**uit!             |

---

## 15. 🎨 UI & THEMES — `<leader>n` / `<leader>u`

| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `<leader>nt`        | 🎨 Next Theme (cycle)           | **N**ext **T**heme             |
| `<leader>u`         | 🌳 Toggle Undotree             | **U**ndo tree                  |
| `<leader>e`         | 📂 File Explorer (Neo-tree)    | **E**xplorer                   |
| `<leader>E`         | 📂 Explorer (cwd)              | **E**xplorer (big)             |

> **Themes:** tokyonight → accent → catppuccin → rose-pine → (lặp lại)

---

## 16. 🗺️ OUTLINE & NAVIGATION

| Keymap              | Chức năng                      | Mẹo nhớ                      |
|---------------------|--------------------------------|-------------------------------|
| `<leader>cs`        | Symbols Outline                | **C**ode **S**ymbols           |
| `<leader>o`         | Toggle Outline                 | **O**utline                    |
| `<leader>ss`        | Search Symbols                 | **S**earch **S**ymbols         |
| `<leader>sS`        | Search Symbols (workspace)     | **S**earch **S**ymbols (big)   |

---

## 🎯 QUICK REFERENCE CARD — Top 20 cho Beginner

```
┌──────────────────────────────────────────────────────────────┐
│  🏆 TOP 20 KEYMAPS BẮT ĐẦU VỚI NEOVIM                      │
├──────────────────────────────────────────────────────────────┤
│  1. Space ff      → Tìm file                                │
│  2. Space fg      → Tìm text trong project                  │
│  3. Space e       → Mở file explorer                        │
│  4. Space Space   → Quick find file                          │
│  5. gd            → Đi đến definition                       │
│  6. gr            → Xem references                          │
│  7. K             → Xem documentation                       │
│  8. Space ca      → Code Action (fix gợi ý)                 │
│  9. Space cr      → Đổi tên biến/hàm                        │
│  10. Space cf     → Format code                              │
│  11. Space gg     → Mở LazyGit                               │
│  12. Ctrl+hjkl    → Di chuyển giữa splits                   │
│  13. Shift+hl     → Chuyển buffer trái/phải                 │
│  14. Space a      → Đánh dấu file (Harpoon)                 │
│  15. Space 1-4    → Nhảy đến file đã đánh dấu               │
│  16. Space xq     → Xem lỗi toàn project                    │
│  17. ciw          → Đổi word nhanh                           │
│  18. dd / yy / p  → Xóa / Copy / Paste dòng                │
│  19. u / Ctrl+r   → Undo / Redo                             │
│  20. Space qq     → Thoát Neovim                             │
└──────────────────────────────────────────────────────────────┘
```

---

## 🔥 MẸO "SỐNG CÒN" CHO BEGINNER

1. **Bị kẹt?** Nhấn `Esc` → rồi `:q!` để thoát
2. **Quên keymap?** Nhấn `Space` rồi **đợi** → menu Which Key sẽ hiện ra
3. **Tìm keymap?** `Space sk` → Search Keymaps
4. **Muốn help?** `:help {topic}` hoặc `Space sh` → Search Help
5. **Lưu file:** `Ctrl+s` hoặc `:w`

---

*📅 Generated: 2026-02-21 | Config: LazyVim + Harpoon + Smart-Splits + Kulala + Dadbod + DAP*
