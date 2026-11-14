-- 1. Jadual Profil Pengguna
create table public.profiles (
  id uuid references auth.users on delete cascade primary key,
  full_name text not null,
  email text not null,
  phone text,
  preferred_clinic text,
  dob date,
  avatar_url text,
  theme_mode text default 'teal',
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 2. Jadual Temujanji
create table public.appointments (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users on delete cascade not null,
  title text not null,
  clinic text not null,
  address text,
  appointment_date timestamp with time zone not null,
  visit_type text not null,
  doctor text,
  notes text,
  status text default 'Akan Datang',
  reference_no text not null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 3. Jadual Token QR Selamat (Hanya simpan hash, tiada PII)
create table public.qr_access_tokens (
  id uuid default gen_random_uuid() primary key,
  appointment_id uuid references public.appointments on delete cascade not null,
  user_id uuid references auth.users on delete cascade not null,
  token_hash text not null,
  expires_at timestamp with time zone not null,
  is_revoked boolean default false,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 4. Jadual Tetapan Peringatan
create table public.reminder_preferences (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users on delete cascade unique not null,
  days_7 boolean default true,
  days_3 boolean default true,
  days_1 boolean default true,
  on_day boolean default true,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- RLS Policies
alter table public.profiles enable row level security;
alter table public.appointments enable row level security;
alter table public.qr_access_tokens enable row level security;
alter table public.reminder_preferences enable row level security;

create policy "Users can view own profile" on public.profiles for select using (auth.uid() = id);
create policy "Users can update own profile" on public.profiles for update using (auth.uid() = id);
create policy "Users can insert own profile" on public.profiles for insert with check (auth.uid() = id);

create policy "Users can manage own appointments" on public.appointments for all using (auth.uid() = user_id);
create policy "Users can manage own qr tokens" on public.qr_access_tokens for all using (auth.uid() = user_id);
create policy "Users can manage own reminders" on public.reminder_preferences for all using (auth.uid() = user_id);
