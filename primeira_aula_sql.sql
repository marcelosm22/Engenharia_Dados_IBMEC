USE aulasql;

CREATE TABLE aluno (
matricula INTEGER PRIMARY KEY,
nomealuno VARCHAR(30) NOT NULL,
sexo CHAR(1),
dtNascimento DATE
);

CREATE TABLE departamento (
codDepto INTEGER PRIMARY KEY,
nomeDepto VARCHAR(30)
);

CREATE TABLE curso (
codCurso INTEGER PRIMARY KEY,
nomeCurso VARCHAR(30) NOT NULL,
ch INTEGER,
preco REAL,
codDepto INTEGER,
FOREIGN KEY (codDepto) REFERENCES departamento(codDepto)
);

-- MUITOS PRA MUITOS CRIA NOVA TABELA COM AS DUAS PRIMARYS, UMA DE CADA TABELA -- 
CREATE TABLE matricula (
matricula INTEGER,
codCurso INTEGER,
dtMatricula DATE,
PRIMARY KEY(matricula, codCurso),
FOREIGN KEY (matricula) REFERENCES aluno(matricula),
FOREIGN KEY (codCurso) REFERENCES curso(codCurso)
);