[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/lif1BbOG)
# Micro-Imersão SQL

## Objetivo

O objetivo desta micro-imersão é proporcionar uma experiência prática e intensiva com SQL, focando em inserir, formatar e transformar dados para realizar análises simples. Você aprenderá a trabalhar com bancos de dados, ganhará proficiência em SQL e entenderá como funciona uma pipeline de dados na prática.

## Instruções

Vamos analisar dados da folha de pagamento de algumas prefeituras da região metropolitana de São Paulo. Normalmente, esses dados estão disponíveis nos sites de transparência de cada prefeitura e podem ser acessados publicamente. No entanto, os dados não estão na mesma estrutura e geralmente estão desorganizados. Nosso objetivo é organizar esses dados de forma estruturada para realizar análises posteriores.

Portanto, temos duas tarefas principais:
1. Estruturar os dados
2. Responder perguntas sobre os dados

### 1. Estruturação dos dados

Para estruturar os dados, vamos armazenar as informações em um banco de dados SQL e, em seguida, gerar algumas análises.

#### 1.1 Banco de dados: Clickhouse

O Clickhouse será o nosso banco de dados. Temos um Clickhouse instalado e disponível para vocês na seguinte URL: `10.51.200.204`. Para testar a conexão, vá até o seu terminal e execute:

```sh
curl -u bocal:do35r3wzJp2rEd "http://10.51.200.204:8123/?query=SELECT%20%27Connection%20successful%20for%20bocal%27%20AS%20message"
```

Se você viu a mensagem `Connection successful for bocal`, está tudo certo. Se não, chame alguém do Bocal para ajudá-lo.

Você terá seu próprio usuário e senha, que estarão disponíveis neste repositório no arquivo `users.txt`. Cada usuário tem um banco de dados próprio, onde há permissão para criação de tabelas e outras operações, mas é impedido ver as informações dos outros usuários. Os usuários separados servem apenas para evitar acidentes.

#### 1.2 Como interagir com o Clickhouse

Neste repositório, há um script que utiliza Docker para permitir que você use o `clickhouse-client`. Não se preocupe com os detalhes de funcionamento do script, o principal é facilitar seu trabalho e permitir que você interaja com o Clickhouse. Por exemplo, para ver todos os bancos de dados disponíveis, você pode executar:

```sh
./clickhouse-client.sh --query="SHOW DATABASES;"
```

Se você encontrou um banco de dados, está tudo certo e você pode prosseguir.

Lembre-se de atualizar o user e password correspondente para o seu usuário dentro do script.

É importante consultar a [documentação do `clickhouse-client`](https://clickhouse.com/docs/en/interfaces/cli) CLI para entender como trabalhar com ele adequadamente.

#### 1.3 Os dados

Os dados estão na pasta `dados` neste repositório e foram retirados dos sites de transparência de cada prefeitura:

- [Prefeitura de São Paulo](http://dados.prefeitura.sp.gov.br/pt_PT/dataset)
- [Prefeitura de São Bernardo do Campo](https://www.saobernardo.sp.gov.br/web/transparencia)
- [Prefeitura de Guarulhos](https://www.guarulhos.sp.gov.br/transparencia)

### 2. Perguntas sobre os dados

Boa! Agora, sabendo que os dados estão no banco de dados, precisamos escrever queries que respondam às seguintes perguntas:

1. **Quais os servidores que possuem um cargo em comissão na cidade de São Paulo?**  
   Resposta: `1.sql`

2. **Qual é a remuneração média dos servidores da cidade de São Bernardo do Campo por secretaria?**  
   Resposta: `2.sql`

3. **Quais são os três servidores com maior remuneração bruta na cidade de Guarulhos?**  
   Resposta: `3.sql`

4. **Qual é a média da remuneração bruta dos servidores ao longo do tempo para todas as cidades?**  
   Resposta: `4.sql`

5. **Qual é a remuneração líquida média dos servidores por cargo em todas as cidades e ordenado por cargo?**  
   Resposta: `5.sql`

## Submissão

Ao finalizar o projeto, faça um dump da estrutura do banco de dados em um arquivo `db.sql` e adicione ao repositório junto com as respostas das perguntas nos respectivos arquivos `{1,2,3,4,5}.sql`.