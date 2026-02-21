# 🧠 NEOVIM MIND MAP — XMind Cheatsheet
## Cách import: Mở XMind → File → Import → Markdown

---

# 🏠 NGÔI NHÀ NEOVIM (Central Topic)

## 🦶 Bước 1: Sống Sót (Survival)
### Thoát Neovim
- `Esc` → Về Normal mode (NÚT HOÀNG KIM)
- `:q` → Thoát (Quit)
- `:q!` → Thoát KHÔNG lưu (Quit force!)
- `:w` → Lưu file (Write)
- `:wq` → Lưu & Thoát
- `Ctrl+s` → Lưu nhanh
- `Space qq` → Thoát tất cả

### 3 Chế Độ Cơ Bản
- **Normal** 🏠 (mặc định) → Điều khiển, di chuyển
  - Vào bằng: `Esc`
  - Tay đặt trên `hjkl`
- **Insert** ✏️ → Gõ chữ
  - `i` = Insert trước cursor
  - `a` = Append sau cursor
  - `o` = Open dòng mới dưới
  - `O` = Open dòng mới trên
- **Visual** 👁️ → Chọn text
  - `v` = Visual (chọn ký tự)
  - `V` = Visual Line (chọn dòng)
  - `Ctrl+v` = Visual Block (chọn cột)

---

## 🚶 Bước 2: Di Chuyển (Phương Tiện)
### 🎮 Tay Phải = Joystick (hjkl)
- `h` ← TRÁI (hướng ngón út)
- `j` ↓ XUỐNG (j giống mũi tên ↓)
- `k` ↑ LÊN (k ngược j)
- `l` → PHẢI (hướng ngón trỏ)

### 🏃 Nhảy theo Word
- `w` → Word tiếp theo (bước ngắn →)
- `b` → Back word trước (bước ngắn ←)
- `e` → End of word (cuối word)
- `W/B/E` → Nhảy theo WORD lớn (bao gồm dấu)

### 🚀 Nhảy xa
- `0` → Đầu dòng (số 0 = start)
- `$` → Cuối dòng ($ = end in regex)
- `gg` → Đầu file (Go Go lên!)
- `G` → Cuối file (Go lớn = đi xa)
- `{` / `}` → Nhảy paragraph
- `%` → Nhảy cặp ngoặc matching
- `Ctrl+d` → Down nửa trang
- `Ctrl+u` → Up nửa trang
- `f{x}` → Find ký tự x phía trước
- `F{x}` → Find ký tự x phía sau

---

## ✏️ Bước 3: Chỉnh Sửa (Bộ Dụng Cụ)
### 🔧 Combo Sức Mạnh: Verb + Object
- **Verbs (Hành động)**
  - `d` = Delete (xóa)
  - `c` = Change (xóa + chuyển Insert)
  - `y` = Yank (copy)
  - `v` = Visual (chọn)
- **Objects (Đối tượng)**
  - `iw` = Inner Word (trong word)
  - `i"` = Inner Quotes (trong "")
  - `i(` = Inner Parens (trong ())
  - `i{` = Inner Braces (trong {})
  - `it` = Inner Tag (trong <tag>)
  - `aw` = A Word (cả word + khoảng trắng)
  - `a"` = A Quotes (cả "")

### 🎯 Ví dụ Thực Tế
- `diw` = Delete Inner Word → Xóa word
- `ci"` = Change Inner " → Đổi nội dung trong ""
- `ya{` = Yank A { → Copy cả block {}
- `vi(` = Visual Inner ( → Chọn trong ()

### ⚡ Thao Tác Nhanh
- `dd` → Xóa dòng
- `yy` → Copy dòng
- `p` / `P` → Paste sau/trước
- `u` → Undo
- `Ctrl+r` → Redo
- `x` → Xóa 1 ký tự
- `.` → Repeat thao tác trước (SIÊU HỮU ÍCH!)
- `>>` / `<<` → Indent phải/trái
- `~` → Toggle HOA/thường

---

## 🔍 Bước 4: Tìm Kiếm (Kính Lúp)
### Tìm trong file
- `/pattern` → Tìm xuôi
- `?pattern` → Tìm ngược
- `n` → Next kết quả
- `N` → Prev kết quả
- `*` → Tìm word tại cursor

### Tìm trong Project (Space = Mở Cánh Cổng)
- `Space ff` 🔍 → Find Files (tìm file)
- `Space fg` 🔎 → Find by Grep (tìm text)
- `Space fw` 🔤 → Find Word tại cursor
- `Space fr` 📋 → Find Recent files
- `Space fb` 📄 → Find Buffers (file đang mở)
- `Space fc` ⚙️ → Find Config files
- `Space Space` → Quick find file (shortcut)

### Thay thế
- `:%s/old/new/g` → Thay thế toàn file
- `:%s/old/new/gc` → Thay thế có confirm

---

## 📁 Bước 5: Quản Lý Files (Tủ Hồ Sơ)
### File Explorer
- `Space e` 📂 → Mở Explorer (Neo-tree)
- `Space E` 📂 → Explorer tại thư mục gốc

### Buffer = Trang Giấy Đang Mở
- `Space bb` → Xem tất cả buffers
- `Space bd` → Đóng buffer hiện tại
- `Space bo` → Đóng tất cả buffer khác
- `Shift+h` → Buffer trước ←
- `Shift+l` → Buffer sau →

### 🎣 Harpoon = Câu File Yêu Thích
- `Space a` 🎣 → Add file vào Harpoon
- `Space h` 📋 → Mở Harpoon menu
- `Space 1` → Nhảy đến file #1
- `Space 2` → Nhảy đến file #2
- `Space 3` → Nhảy đến file #3
- `Space 4` → Nhảy đến file #4

---

## 🪟 Bước 6: Cửa Sổ (Kiến Trúc Sư)
### Tạo Split
- `Space w-` → Chia ngang ─
- `Space w|` → Chia dọc │
- `Space wd` → Đóng cửa sổ
- `Space Wc` → Đóng tất cả floating

### Di chuyển = Ctrl + hjkl 🧭
- `Ctrl+h` ← Di chuyển trái
- `Ctrl+j` ↓ Di chuyển xuống
- `Ctrl+k` ↑ Di chuyển lên
- `Ctrl+l` → Di chuyển phải
- ⚡ Hoạt động seamless với WezTerm!

### Resize = Alt + hjkl 📐
- `Alt+h` ← Thu nhỏ trái
- `Alt+j` ↓ Thu nhỏ xuống
- `Alt+k` ↑ Mở rộng lên
- `Alt+l` → Mở rộng phải

### Swap = Space w + hjkl 🔄
- `Space wh` → Swap buffer trái
- `Space wj` → Swap buffer xuống
- `Space wk` → Swap buffer lên
- `Space wl` → Swap buffer phải

---

## 💻 Bước 7: Code Thông Minh (Trợ Lý AI)
### Nhảy đến Code (g = Go)
- `gd` → Go to Definition (đi đến khai báo)
- `gr` → Go to References (ai dùng nó?)
- `gI` → Go to Implementation
- `gy` → Go to Type definition
- `K` → Hover xem doc

### Code Actions (Space c = Code)
- `Space ca` → Code Action (fix gợi ý)
- `Space cr` → Rename symbol (đổi tên)
- `Space cf` → Format code
- `Space cl` → LSP Info
- `Space cd` → Line Diagnostics

### Diagnostics (Space x = eXamine)
- `Space xq` → Xem lỗi toàn project
- `Space xd` → Xem lỗi buffer hiện tại
- `]d` / `[d` → Next/Prev diagnostic
- `]e` / `[e` → Next/Prev error
- `]w` / `[w` → Next/Prev warning

---

## 🌿 Bước 8: Git (Cỗ Máy Thời Gian)
### Git Tổng Quan (Space g = Git)
- `Space gg` → LazyGit (full GUI tuyệt đẹp!)
- `Space gs` → Git Status
- `Space gb` → Git Blame (ai viết dòng này?)
- `Space gd` → Git Diff
- `Space gl` → Git Log

### Git Hunks (thay đổi nhỏ)
- `]h` → Next hunk →
- `[h` → Prev hunk ←
- `Space ghs` → Stage hunk
- `Space ghr` → Reset hunk

---

## 🌐 Bước 9: Web Dev Toolkit
### REST API Testing (Space r = Run)
- `Space rr` ▶️ → Run Request
- `Space rl` 🔁 → Replay Last
- `Space rp` 📝 → Scratchpad
- `Space rn` / `rN` → Next/Prev Request
- `Space re` 🌍 → Select Environment
- `Space ri` 🔍 → Inspect Request

### Database (Space d = Database)
- `Space db` → Toggle DB UI
- `Space da` → Add DB Connection
- `Space df` → Find DB Buffer

---

## 🧪 Bước 10: Test & Debug (Phòng Thí Nghiệm)
### Testing (Space t = Test)
- `Space tt` → Run File Tests
- `Space tr` → Run Nearest Test
- `Space ts` → Test Summary
- `Space to` → Test Output

### Debugging (Space d = Debug)
- `Space db` → Toggle Breakpoint 🔴
- `Space dB` → Conditional Breakpoint
- `Space dc` → Continue ▶️
- `Space di` → Step Into ⤵️
- `Space do` → Step Over ⏭️
- `Space dO` → Step Out ⤴️
- `Space dp` → Pause ⏸️
- `Space dt` → Terminate ⏹️

---

## 🎨 Bước 11: Tùy Chỉnh (Decorator)
### Themes
- `Space nt` 🎨 → Cycle Theme
  - tokyonight → accent → catppuccin → rose-pine

### UI Tools
- `Space u` 🌳 → Toggle Undotree
- `Space o` → Toggle Outline
- `Space cs` → Symbols Outline

### Code Folding (z = Zip/Unzip)
- `za` → Toggle fold
- `zo` → Open fold
- `zc` → Close fold
- `zR` → Reveal ALL (mở hết)
- `zM` → Mask ALL (đóng hết)

### Session (Space q = Quit/Session)
- `Space qs` → Restore Session
- `Space ql` → Restore Last Session
- `Space qd` → Don't Save Session

---

# 🗺️ BẢN ĐỒ HÀNH TRÌNH BEGINNER

## Tuần 1: Sống Sót 🦶
- Học `hjkl`, `i`, `Esc`, `:wq`, `:q!`
- Dùng `Space e` để duyệt file
- Dùng `Space ff` để tìm file

## Tuần 2: Di Chuyển 🚶
- Học `w`, `b`, `e`, `0`, `$`, `gg`, `G`
- Dùng `Ctrl+d/u` để cuộn trang
- Thử `f{char}` để nhảy nhanh

## Tuần 3: Chỉnh Sửa ✏️
- Master `dd`, `yy`, `p`, `u`, `ciw`
- Học combo: `ci"`, `di(`, `va{`
- Dùng `.` để repeat

## Tuần 4: Code Pro 💻
- Dùng `gd`, `gr`, `K` cho LSP
- `Space ca` cho Code Actions
- `Space gg` cho LazyGit

## Tuần 5: Power User 🚀
- Setup Harpoon cho workflow
- Dùng Kulala test API
- Dùng DAP debug
- Master splits + resize

---

# 💡 QUY TẮC VÀNG

## Ctrl = Di chuyển giữa splits
## Alt = Resize splits  
## Space = Mở cánh cổng tính năng
## g = Go to (nhảy đến)
## z = Fold (gập code)
## ] / [ = Next / Prev
