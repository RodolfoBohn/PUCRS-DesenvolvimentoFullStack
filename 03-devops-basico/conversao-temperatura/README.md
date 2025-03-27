# Projeto conversão de temperatura

### Sobre o projeto
O projeto conversão de temperatura é um projeto desenvolvido em NodeJS. O projeto tem como objetivo ser um exemplo para a criação de ambiente com containers usando NodeJS.

### Observações do projeto
A aplicação é exposta usando a porta 8080

### Comandos úteis

Comando para buildar uma imagem:
```
  docker build -t (para criar tag) hostname/imagename:tag
  docker build -t rodolfobohn/aula-conversao-temperatura:v1 .
```

Comando para criar um container com a imagem:
```
  docker container run -d (modo deamon) -p (bind de portas) nomeDaImagemBase
  docker container run -d -p 8080:8080 rodolfobohn/aula-conversao-temperatura:v1
  
```

Comando para subir a imagem no repositório docker
```
  docker push nomeDaImagem
  docker push rodolfobohn/aula-conversao-temperatura:v1
  docker push rodolfobohn/aula-conversao-temperatura:latest
  
```

.dockerignore: arquivo para dizer quais aquivos/diretórios o Dockerfile deve ignorar na criação da imagem no comando copy