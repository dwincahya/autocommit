# Cara Mengatasi Error 403 pada GitHub Actions

Anda mengalami error 403 (Permission denied) karena GitHub Actions bot tidak memiliki izin untuk melakukan push ke repositori Anda. Ada dua cara untuk mengatasi masalah ini:

## Solusi 1: Menggunakan Personal Access Token (Direkomendasikan)

1. **Buat Personal Access Token (PAT):**
   - Buka [GitHub Settings > Developer Settings > Personal Access Tokens](https://github.com/settings/tokens)
   - Klik "Generate new token" dan pilih "Generate new token (classic)"
   - Berikan nama yang jelas (misal: "GitHub Actions Auto Commit")
   - Pilih scope/izin: minimal `repo` (akses penuh ke repositori)
   - Klik "Generate token" dan **SALIN token yang dihasilkan** (ini adalah satu-satunya kesempatan Anda untuk melihat token)

2. **Tambahkan Token sebagai Secret di Repositori:**
   - Buka repositori Anda di GitHub
   - Klik "Settings" > "Secrets and variables" > "Actions"
   - Klik "New repository secret"
   - Nama: `PAT` (pastikan sesuai dengan yang digunakan di workflow)
   - Value: Paste token yang sudah Anda salin sebelumnya
   - Klik "Add secret"

3. **GitHub Actions akan otomatis menggunakan token ini** untuk autentikasi. Workflow sudah diperbarui untuk mencari `secrets.PAT` terlebih dahulu.

## Solusi 2: Mengubah Izin Workflow (Lebih Sederhana)

Jika tidak ingin membuat PAT, Anda dapat menggunakan GITHUB_TOKEN bawaan dengan memberikan izin yang tepat:

1. Workflow sudah diperbarui untuk menambahkan blok `permissions` dengan akses `contents: write`
2. Ini memberikan izin pada token GITHUB_TOKEN default untuk menulis ke konten repositori

## Menguji Ulang Workflow

Setelah menerapkan salah satu solusi di atas:

1. Commit dan push perubahan ke file workflow
2. Pergi ke tab "Actions" di repositori GitHub Anda
3. Pilih workflow "Daily Auto Commit"
4. Klik "Run workflow" > "Run workflow" untuk menjalankan secara manual dan memastikan error teratasi

## Catatan Tambahan

- Jika Anda menggunakan PAT, jangan pernah membagikan token tersebut kepada siapapun
- PAT memberikan akses ke akun GitHub Anda sesuai dengan izin yang Anda berikan, jadi gunakan dengan hati-hati
- Token dapat dicabut kapan saja melalui halaman GitHub Settings jika terjadi kebocoran
