# MyTemujanji

Aplikasi web peribadi pengurusan temujanji Klinik Kesihatan (Bukan sistem rasmi KKM). Dibina menggunakan Next.js, TypeScript, Tailwind CSS, dan Supabase PostgreSQL dengan pengesahan RLS serta keselamatan QR bertoken SHA-256.

## Ciri-Ciri Utama
- 10 Skrin Rujukan Lengkap (Login, Dashboard, Senarai, Kalendar, Kad Digital, Peringatan, Profil, Tambah Temujanji, Notifikasi, Landing Page).
- Penukar Tema Warna: Teal Kesihatan (Asal) & Royal Ivory (Identiti KKM).
- Direktori Klinik Kesihatan Seluruh Malaysia (16 Negeri & Wilayah Persekutuan) dengan Carian GPS Terdekat.
- Muat Naik Foto Profil Pengguna & Penjanaan Kod QR Selamat Tanpa PII.

## Cara Pemasangan & Menjalankan
1. Pasang dependensi: `npm install`
2. Letakkan fail `.env.local` dengan konfigurasi Supabase anda:
   `NEXT_PUBLIC_SUPABASE_URL=...`
   `NEXT_PUBLIC_SUPABASE_ANON_KEY=...`
3. Jalankan pelayan pembangunan: `npm run dev`
