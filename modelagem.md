# 📊 Modelagem de Dados — Sistema de Denúncias Escolares

## 📝 Descrição Geral

Este documento apresenta a modelagem de dados do sistema de denúncias escolares, desenvolvido para permitir que professores registrem reclamações, alunos visualizem essas informações e o coordenador gerencie os usuários e permissões.

---

## 🧩 Modelo Entidade-Relacionamento (MER)

### 📌 Entidades

#### 👤 Usuário
Representa todos os usuários do sistema.

**Atributos:**
- id_usuario (PK)
- nome
- email
- senha
- tipo_usuario (aluno, professor, coordenador)

---

#### 📢 Reclamação
Representa as denúncias registradas pelos professores.

**Atributos:**
- id_reclamacao (PK)
- titulo
- descricao
- data_criacao
- status
- id_professor (FK)

---

### 🔗 Relacionamentos

#### Professor FAZ Reclamação
- Um professor pode registrar várias reclamações.
- Cada reclamação pertence a um único professor.

**Cardinalidade:**

Professor (1) -------- (N) Reclamação


---

## 🧱 Modelo Entidade-Relacionamento (DER)

### 🗄️ Tabela: usuarios
                +----------------------+
                |       USUARIOS       |
                +----------------------+
                | PK id_usuario        |
                | nome                |
                | email (UNIQUE)      |
                | senha               |
                | tipo_usuario        |
                | (aluno, professor, |
                |  coordenador)       |
                +----------------------+
                          |
                          | 1
                          |
                          | FAZ
                          |
                          | N
                +----------------------+
                |     RECLAMACOES      |
                +----------------------+
                | PK id_reclamacao     |
                | titulo              |
                | descricao           |
                | data_criacao        |
                | status              |
                | FK id_professor     |
                +----------------------+

## 🔗 Relacionamento no Banco


usuarios (1) -------- (N) reclamacoes


- A chave estrangeira `id_professor` em `reclamacoes` referencia `usuarios.id_usuario`
- Apenas usuários do tipo **professor** podem criar reclamações

---

## 📌 Regras de Negócio

- 👨‍🎓 Alunos:
  - Apenas visualizam reclamações
  - Não podem criar ou editar

- 👨‍🏫 Professores:
  - Podem criar, editar e excluir reclamações

- 🧑‍💼 Coordenador:
  - Gerencia usuários
  - Pode promover usuários a professores
  - Possui controle total do sistema

---

## 🛠️ Modelo Alternativo (Normalizado)

### 🗄️ Tabela: tipos_usuario

| Campo     | Tipo      | Descrição                  |
|----------|----------|----------------------------|
| id_tipo  | INT (PK) | Identificador do tipo      |
| nome     | VARCHAR  | aluno, professor, coord.   |

---

### 🗄️ Tabela: usuarios

| Campo       | Tipo      | Descrição                |
|------------|----------|--------------------------|
| id_usuario | INT (PK) | Identificador do usuário |
| nome       | VARCHAR  | Nome                     |
| email      | VARCHAR  | Email                    |
| senha      | VARCHAR  | Senha                    |
| id_tipo    | INT (FK) | Tipo de usuário          |

---

## 📊 Representação Geral


USUARIOS

id_usuario (PK)
nome
email
senha
tipo_usuario

RECLAMACOES

id_reclamacao (PK)
titulo
descricao
data_criacao
status
id_professor (FK)

Relacionamento:
USUARIOS (1) → (N) RECLAMACOES


---

## 🚀 Considerações Finais

Esta modelagem garante:

- Controle de acesso por tipo de usuário
- Organização das reclamações
- Facilidade de manutenção e expansão futura

---

## 📁 Arquivos Relacionados

- `database.sql` → Script do banco de dados  
- `/docs/der.png` → Diagrama visual do DER  

---
