-- ============================================================
-- Planner Digital — sincronização na nuvem (Supabase)
-- Reaproveita o MESMO projeto Supabase dos outros apps, em uma
-- tabela própria (planner_store), isolada das auditorias.
--
-- Cada usuário autenticado tem UMA linha com todo o seu planner
-- (compromissos, tarefas, projetos, metas, anotações, listas,
-- categorias, planejamentos e preferências) em JSON.
-- Ninguém além do próprio dono consegue ler ou gravar a linha (RLS).
--
-- Como rodar: painel do Supabase > SQL Editor > New query >
-- cole tudo > Run. Pode rodar novamente sem problema (idempotente).
-- ============================================================

create table if not exists public.planner_store (
  user_id    uuid primary key references auth.users (id) on delete cascade,
  data       jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.planner_store enable row level security;

drop policy if exists "planner_select_own" on public.planner_store;
create policy "planner_select_own" on public.planner_store
  for select using (auth.uid() = user_id);

drop policy if exists "planner_insert_own" on public.planner_store;
create policy "planner_insert_own" on public.planner_store
  for insert with check (auth.uid() = user_id);

drop policy if exists "planner_update_own" on public.planner_store;
create policy "planner_update_own" on public.planner_store
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

drop policy if exists "planner_delete_own" on public.planner_store;
create policy "planner_delete_own" on public.planner_store
  for delete using (auth.uid() = user_id);

-- Observação: o app grava updated_at com o horário da última alteração
-- feita no dispositivo; por isso NÃO há trigger alterando essa coluna.
