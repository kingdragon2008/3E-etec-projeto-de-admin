-- =========================================
-- Banco de Dados: Sistema de Denúncias
-- =========================================

CREATE DATABASE IF NOT EXISTS sistema_denuncias;
USE sistema_denuncias;

-- =========================================
-- Tabela: usuarios
-- =========================================
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tipo_usuario ENUM('aluno', 'professor', 'coordenador') NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================================
-- Tabela: reclamacoes
-- =========================================
CREATE TABLE reclamacoes (
    id_reclamacao INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'aberta',
    id_professor INT NOT NULL,

    CONSTRAINT fk_professor
        FOREIGN KEY (id_professor)
        REFERENCES usuarios(id_usuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =========================================
-- Índices (melhor performance)
-- =========================================
CREATE INDEX idx_email ON usuarios(email);
CREATE INDEX idx_professor ON reclamacoes(id_professor);

-- =========================================
-- Inserção de dados iniciais (opcional)
-- =========================================

-- Coordenador padrão
INSERT INTO usuarios (nome, email, senha, tipo_usuario)
VALUES ('Coordenador Geral', 'coord@escola.com', '123456', 'coordenador');

-- Professor exemplo
INSERT INTO usuarios (nome, email, senha, tipo_usuario)
VALUES ('Professor Exemplo', 'prof@escola.com', '123456', 'professor');

-- Aluno exemplo
INSERT INTO usuarios (nome, email, senha, tipo_usuario)
VALUES ('Aluno Exemplo', 'aluno@escola.com', '123456', 'aluno');

-- Reclamação exemplo
INSERT INTO reclamacoes (titulo, descricao, id_professor)
VALUES ('Problema em sala', 'Alunos estão fazendo muito barulho', 2);

-- =========================================
-- Fim do Script
-- =========================================
