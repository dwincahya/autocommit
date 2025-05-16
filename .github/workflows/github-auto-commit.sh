name: Daily Auto Commit

on:
  schedule:
    - cron: '0 2 * * *'  # Berjalan setiap hari pada pukul 02:00 UTC (sesuaikan dengan timezone yang Anda inginkan)
  workflow_dispatch:  # Memungkinkan untuk menjalankan workflow secara manual dari GitHub UI

jobs:
  auto-commit:
    runs-on: ubuntu-latest
    # Tambahkan permission yang diperlukan
    permissions:
      contents: write
    
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        with:
          fetch-depth: 0
          # Gunakan PAT daripada GITHUB_TOKEN standar untuk mengatasi masalah izin
          token: ${{ secrets.PAT || secrets.GITHUB_TOKEN }}
      
      - name: Setup Git user
        run: |
          git config --global user.name "GitHub Actions Bot"
          git config --global user.email "actions@github.com"
      
      - name: Create/update streak file
        run: |
          # Buat atau update file untuk streak
          echo "Daily commit pada $(date)" >> streak.md
          
          # Buat random perubahan pada file untuk menghindari commit identik
          echo "Timestamp: $(date +%s)" >> streak.md
          echo "Random number: $RANDOM" >> streak.md

      - name: Commit dan push jika ada perubahan
        run: |
          # Cek apakah ada perubahan untuk di-commit
          if [ -n "$(git status --porcelain)" ]; then
            git add streak.md
            git commit -m "Daily commit untuk menjaga streak 🔥 $(date)"
            git push
            echo "✅ Berhasil commit dan push!"
          else
            echo "❌ Tidak ada perubahan untuk di-commit"
          fi
