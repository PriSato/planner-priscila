# Planner Digital — Priscila Sato

Planner pessoal e profissional em um único arquivo (`index.html`), identidade **Elegant Rose Gold**, em português e responsivo (computador, tablet e celular).

## Como usar

- Abra `index.html` por um endereço web (GitHub Pages ou qualquer servidor estático). Os dados ficam salvos automaticamente no navegador (IndexedDB).
- Para usar o mesmo planner em outros dispositivos, entre na sua conta em **Configurações › Sincronização entre dispositivos**.

## Sincronização (Supabase)

1. No projeto Supabase já usado pelos outros apps, abra **SQL Editor** e rode `supabase_planner_schema.sql` (cria a tabela `planner_store` com RLS: cada pessoa só lê e grava os próprios dados).
2. No planner, entre com e-mail e senha de uma conta existente nesse projeto.

Sem login, tudo continua funcionando e fica salvo apenas naquele navegador. Use **Exportar backup** de vez em quando.

## Módulos

Início (dashboard) · Minha Agenda (dia/semana/mês/ano, recorrência, conflitos, arrastar e soltar) · Tarefas (lista, Kanban, calendário, agrupamentos, histórico) · Planejamento Semanal · Planejamento Mensal · Projetos (cards, Kanban, lista, linha do tempo) · Metas e Objetivos · Anotações · Listas e Pendências (+ lembretes) · Relatórios (PDF/Excel) · Configurações.
