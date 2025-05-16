# GitHub Auto Commit Streak Keeper 🔥

Repositori ini menggunakan GitHub Actions untuk membuat commit otomatis setiap hari untuk menjaga streak GitHub Anda tetap aktif.

## Cara Penggunaan

1. **Fork repositori ini** (atau buat repositori baru dan tambahkan file workflow)
2. **Tempatkan file workflow di direktori yang benar:**
   - Buat folder `.github/workflows/` di repositori Anda
   - Simpan file `github-actions-daily-commit.yml` di dalam folder tersebut

## Konfigurasi

Anda dapat menyesuaikan beberapa konfigurasi pada file workflow:

### Ubah Jadwal

Cron job diatur untuk berjalan setiap hari pada pukul 02:00 UTC. Anda dapat mengubahnya di bagian ini:

```yaml
on:
  schedule:
    - cron: '0 2 * * *'  # Sesuaikan waktu yang Anda inginkan
```

Format Cron: `minute hour day(month) month day(week)`

### Ubah File yang Diupdate

Secara default, script akan mengupdate file bernama `streak.md`. Anda dapat mengubah nama file ini atau menambahkan file lain yang ingin diupdate.

### Ubah Pesan Commit

Anda dapat mengubah format pesan commit sesuai keinginan Anda:

```yaml
git commit -m "Daily commit untuk menjaga streak 🔥 $(date)"
```

## Verifikasi Bahwa Workflow Berjalan

1. Setelah Anda mengatur workflow, kunjungi tab "Actions" di repositori GitHub Anda
2. Anda akan melihat workflow "Daily Auto Commit" terdaftar
3. Anda dapat menjalankannya secara manual dengan mengklik "Run workflow" untuk menguji apakah berfungsi dengan baik

## Catatan Penting

- GitHub Actions memiliki batasan penggunaan untuk akun gratis, tetapi workflow sederhana ini seharusnya tidak melebihi batas
- Jika repositori Anda privat, commit yang dibuat oleh GitHub Actions **tidak akan dihitung** dalam grafik kontribusi GitHub
- Untuk menghitung dalam grafik kontribusi, repositori harus bersifat publik

## Keamanan

File workflow ini menggunakan `GITHUB_TOKEN` default yang disediakan secara otomatis oleh GitHub. Token ini memiliki izin terbatas pada repositori saat ini saja.

Jika Anda memerlukan akses ke repositori lain, Anda harus menggunakan Personal Access Token (PAT) yang disimpan sebagai secret di repositori Anda.
