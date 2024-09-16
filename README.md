# BeautyTech API

Este repositório contém a API da aplicação BeautyTech, desenvolvida em [Java/Kotlin]. A API permite gerenciar operações CRUD relacionadas a [funcionalidade principal da aplicação].

## Tecnologias Utilizadas
- Java 11 / Kotlin
- Spring Boot
- Maven / Gradle
- Banco de Dados (Oracle)
- Docker (para deploy)
  
## Pré-requisitos
Antes de iniciar, certifique-se de ter instalado:
- código fonte front-end https://github.com/Duh0127/BeautyTech_Kotlin.git
- código fonte JAVA https://github.com/CarlosEduardo7700/BeautyTech_API.git
- [Java 11](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html) ou superior
- [Maven](https://maven.apache.org/) ou [Gradle](https://gradle.org/)
- [Docker](https://www.docker.com/) (opcional, para deploy)
- Banco de dados MySQL/PostgreSQL (ou outro configurado no projeto)

## Como Configurar o Ambiente

1. Clone o repositório:

```bash
git clone https://github.com/usuario/BeautyTech_API.git
cd BeautyTech_API

2.
Instale as dependências:

Para Maven:
mvn clean install

Instale as dependências:

Para Gradle:

3.Configure o banco de dados:

Crie um banco de dados no MySQL/PostgreSQL.
spring.datasource.url=jdbc:mysql://localhost:3306/beautytech_db
spring.datasource.username=usuario
spring.datasource.password=senha
spring.jpa.hibernate.ddl-auto=update


Como Executar a API
Para rodar a API localmente:

Execute a aplicação:

Para Maven:
mvn spring-boot:run

Para Gradle:
gradle bootRun

Acesse a documentação dos endpoints via Swagger:

http://localhost:8080/swagger-ui.html


Endpoints da API
Criar Recurso (POST)
POST /api/recurso
{
  "nome": "Exemplo",
  "descricao": "Descrição do recurso"
}


Ler Recurso (GET)

GET /api/recurso/{id}


Atualizar Recurso (PUT)

PUT /api/recurso/{id}
{
  "nome": "Exemplo Atualizado",
  "descricao": "Nova descrição"
}


Deletar Recurso (DELETE)

DELETE /api/recurso/{id}


Deploy da Aplicação
Build a imagem Docker:

docker build -t beautytech-api .


Execute a aplicação usando Docker:

docker run -p 8080:8080 beautytech-api


Testes
Para executar os testes automatizados:

Para Maven:
mvn test

Para Gradle:
gradle test



