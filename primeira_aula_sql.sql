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

CREATE TABLE func (
codfunc INTEGER,
nomefunc VARCHAR(20),
city VARCHAR(20),
cbo INTEGER,
uf CHAR(2),
codDepto INTEGER,
FOREIGN KEY (codDepto) REFERENCES departamento(codDepto)
);

 ALTER TABLE func RENAME COLUMN city TO cidade;
 ALTER TABLE func ADD COLUMN sexo CHAR(1);
 ALTER TABLE func MODIFY COLUMN nomefunc VARCHAR(30);
 ALTER TABLE func DROP COLUMN cbo;
 ALTER TABLE func ALTER COLUMN uf SET DEFAULT 'rj';
 ALTER TABLE func RENAME TO funcionario;
 ALTER TABLE funcionario MODIFY COLUMN nomefunc VARCHAR(30) NOT NULL;
 ALTER TABLE funcionario ADD PRIMARY KEY (codfunc);
 ALTER TABLE funcionario MODIFY COLUMN codfunc INTEGER AUTO_INCREMENT;
 
 CREATE TABLE telefone (
 codtel INTEGER AUTO_INCREMENT PRIMARY KEY,
 ddd INTEGER,
 numero varchar(13),
 codfunc INTEGER,
 FOREIGN KEY (codfunc) REFERENCES funcionario(codfunc)
 );
 
 DROP TABLE funcionario; -- NÃO FUNCIONA (VINCULADO COM OUTRA TABLE) --
 
 DROP TABLE telefone;
 
 INSERT INTO aluno (matricula, nomealuno, sexo, dtNascimento) VALUES (1, 'Ana', 'F', '1979-01-23');
 
 SELECT * FROM aluno
 