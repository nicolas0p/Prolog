%orientou(Professor, Aluno, modalidade). modalidade = ic | tcc | mestrado | doutorado
%publicou(Professor, NomeDoArtigo, Ano).

%Jerusa Marchi
orientou('Jerusa Marchi', 'Jhonatan Alves', mestrado).
orientou('Jerusa Marchi', 'Eduardo Burgel', mestrado).
orientou('Jerusa Marchi', 'Darlan Anschau', mestrado).
orientou('Jerusa Marchi', 'Joao Rogerio Vieira Neto', tcc).
orientou('Jerusa Marchi', 'Leo Vieira Peres', tcc).
orientou('Jerusa Marchi', 'Diego Gomes Couto', tcc).
orientou('Jerusa Marchi', 'Mathias Antonio Mortari', tcc).
orientou('Jerusa Marchi', 'Thiago Berti Thomaz', tcc).
orientou('Jerusa Marchi', 'Mariana Tuma de Athayde', tcc).
orientou('Jerusa Marchi', 'Augusto Fredigo Hack', tcc).
orientou('Jerusa Marchi', 'Joao Guilherme Zeni', tcc).
orientou('Jerusa Marchi', 'Bianca Seemann', tcc).
orientou('Jerusa Marchi', 'Guilherme Klein Bitencourt', mestrado).
orientou('Jerusa Marchi', 'Jhonatan Alves', tcc).
orientou('Jerusa Marchi', 'Thiago Royer', ic).


publicou('Jerusa Marchi', 'TrustE - An Emotional Trust Model for Agents', 2013).
publicou('Jerusa Marchi', 'Relevant Minimal Change in Belief Update', 2013).


%Luiz Claudio Villar dos Santos
orientou('Luiz Claudio Villar dos Santos', 'Olav Philipp Henschel').
orientou('Luiz Claudio Villar dos Santos', 'Vinicius dos Santos Livramento').
orientou('Luiz Claudio Villar dos Santos', 'Emilio Wuerges').
orientou('Luiz Claudio Villar dos Santos', 'Rafael Westphal').


publicou('Luiz Claudio Villar dos Santos', 'On-the-fly Verification of Memory Consistency with Concurrent Relaxed Scoreboards').
publicou('Luiz Claudio Villar dos Santos', 'Reconciling real-time guarantees and energy efficiency through unlocked-cache prefetching').
publicou('Luiz Claudio Villar dos Santos', 'Pre-silicon verification of multiprocessor SoCs: The case for on-the-fly coherence/consistency checking').


%Mario Antonio Ribeiro Dantas
orientou('Mario Antonio Ribeiro Dantas', 'Eduardo Camilo Inácio').
orientou('Mario Antonio Ribeiro Dantas', 'Izaias de Faria').
orientou('Mario Antonio Ribeiro Dantas', 'Madalena Pereira da Silva').
orientou('Mario Antonio Ribeiro Dantas', 'André Luiz Tinassi D\'Amato').
orientou('Mario Antonio Ribeiro Dantas', 'Ramon Hugo de Souza').
orientou('Mario Antonio Ribeiro Dantas', 'Eliza Helena Areias Gomes').
orientou('Mario Antonio Ribeiro Dantas', 'Caio César de Melo e Silva').
orientou('Mario Antonio Ribeiro Dantas', 'Douglas Dyllon Jeronimo de Macedo').
orientou('Mario Antonio Ribeiro Dantas', 'João Carlos de Lima').
orientou('Mario Antonio Ribeiro Dantas', 'Cristhian Pablo Machado').
orientou('Mario Antonio Ribeiro Dantas', 'Eduardo Camilo Inácio').
orientou('Mario Antonio Ribeiro Dantas', 'Richard Pereira e Silva').
orientou('Mario Antonio Ribeiro Dantas', 'Matheus Rosado Vill').


publicou('Mario Antonio Ribeiro Dantas', 'A Survey into Performance and Energy Efficiency in HPC, Cloud and Big Data Environments').
publicou('Mario Antonio Ribeiro Dantas', 'Optimization of PACS Data Persistency Using Indexed Hierarchical Data').
publicou('Mario Antonio Ribeiro Dantas', 'UBUNTU: A escola necessária para o futuro').
publicou('Mario Antonio Ribeiro Dantas', 'A case-comparison study of automatic document classification utilizing both serial and parallel approaches').
publicou('Mario Antonio Ribeiro Dantas', 'Modeling a distributed environment for a petroleum reservoir engineering application with software product line').
publicou('Mario Antonio Ribeiro Dantas', 'Towards a Resource Reservation Approach for an Opportunistic Computing Environment').
publicou('Mario Antonio Ribeiro Dantas', 'Green Cloud Computing: An Experimental Validation').
publicou('Mario Antonio Ribeiro Dantas', 'A Data Management Study in a Private Cloud Storage').



%1. Qual e o orientador de um dado aluno? 
aluno(X) :- orientou(_, X, _).
professor(X) :- orientou(X, _, _).

%2. Quais os alunos orientados por um um dado professor?
todosOsAlunos(Prof, Alunos) :- findall(Orientando, orientou(Prof, Orientando, _), Alunos).

%3. Quantos alunos (orientandos) um dado professor orienta? 
quantosAlunos(Prof, Quantidade) :- todosOsAlunos(Prof, Lista), length(Lista, Quantidade).

%4/5. Quais os artigos cientificos publicados por um dado professor/aluno?
publicacoes(Pessoa, Publicacoes) :- findall(Artigo, publicou(Pessoa, Artigo, _), Publicacoes).

%6. Qual o professor (entre os k) com maior numero de orientacoes?
professorComMaisOrientacoes(Maior) :- todosOsProfessores(Lista), maiorAlunosProfDaLista(Lista, Maior).
maiorAlunosProfDaLista([Head|Lista], Prof) :- maiorProfessor(Head, Prof, Maior), maiorAlunosProfDaLista(Lista, Maior).

%7. Quantas publicacoes de artigos cientificos um dado aluno (orientando) possui?
quantasPublicacoes(Aluno, Quantidade) :- aluno(Aluno), publicacoes(Aluno, Lista), length(Lista, Quantidade).

%8. Qual o aluno mais produtivo sob orientacao de um dado professor? Considere apenas coautorias nos artigos cientificos.


%9. Quantos professores nao orientam alunos de graduacao (trabalhos de conclusaao ou iniciacao cientifica)?
naoOrientamGraduacao(NaoOrientam) :- length()
naoOrientamGraduacao(NaoOrientam) :- todosOsProfessores(Todos), 

%10. Qual a media de orientacooes por professor (entre os k)?
mediaDeOrientacoes(Media) :- todosOsProfessores(Todos), somaDasOrientacoes(Todos, Soma), length(Todos, Tamanho), Media is Soma / Tamanho.

%11.  Quantos estudantes tem chance de finalizar, em 2014, suas dissertac̃oes de mestrado? Suponha que um trabalho de mestrado leva, no mınimo, um ano e meio para ser concluıdo


retirarNaoMestrandos(Todos, []) :- length(Todos, 0).
retirarNaoMestrandos([Aluno|Resto], Mestrandos) :- 

%12. Há algum artigo científico no qual dois ou mais professores(entre os k) são coautores? Quais?
coautores(Professores, Artigo) :- false.

%13. Qual a média de artigos científicos publicados por professor em um dado ano?
artigosNoAnoProfessor(Professor, Ano, Quantidade) :- findall(Artigo , publicou(Professor, Artigo, Ano), TodosOsArtigos), length(TodosOsArtigos, Quantidade).

%Soma da orientação de todos os professores da lista
somaDasOrientacoes(Lista, 0) :- length(Lista,0).
somaDasOrientacoes([Prof|Resto], Resultado) :- somaDasOrientacoes(Resto, Soma), quantosAlunos(Prof, Numero), Resultado is Soma + Numero.

%Lista contém todos os professores
todosOsProfessores(Final) :- findall(Prof, professor(Prof), Lista), removeDuplicados(Lista, Final).

%Remove os duplicados da Lista e guarda em SemDuplicados
removeDuplicados(Lista, SemDuplicados) :- sort(Lista, SemDuplicados).

%Maior é o professor, entre Um e Dois, que tem maior numero de alunos
maiorProfessor(Um, Dois, Um) :- quantosAlunos(Um, QuantUm), quantosAlunos(Dois, QuantDois), QuantUm >= QuantDois.
maiorProfessor(Um, Dois, Dois) :- quantosAlunos(Um, QuantUm), quantosAlunos(Dois, QuantDois), QuantUm < QuantDois.
