# Projeto de conclusão de disciplina (Levantamento de requisitos)

## Descrição geral

Aplicativo desenvolvido coom proposta de conclusão de disciplina, Introdução a Administração.  
Aplicativo desenvolvido utilizando o framework Flutter.

## Descrição do aplicativo

Aplicativo android desenvolvido utilizando a IDE Android Studio juntamento com o framework Flutter e Dart como a linguagem de programação.
O desenvolvimento do aplicativo está sendo realizado para uma pessoa específica, por esse motivo os requisitos também serão bem específicos.
O objetivo principal do aplicativo é facilitar o controle de clientes e ordem de serviços que são solicitados para profissinal da área de estética.

## Modelagem do projeto

<img src="" alt="Modelagem da aplicação" width="100%" />

A modelagem do aplicativo consiste em 4 classes, são elas:
 - Cliente (client)
 - Funcionário (employee)
 - Serviço (Servico)
 - Pedido (Demand)

**Cliente**: Controla os dados dos clientes, como o cadastro simples de dados.

**funcionário**: Controla os dados dos ajudantes, conforme informações passadas em sala de aula, a pessoa para qual esse aplicativo está sendo desenvolvido trabalha só. O nome da **funcionario** refere-se as pessoas que eventualmente venham a ajudar em algum serviço, nesse caso fica registrado a ajuda.

**Serviço**: São os serviços prestados, como exemplo maquiagem.

**Pedido**: Registra todos os pedidos (pendentes e realizados), o cadastro dos serviços é realizado com base nos dados de **cliente** e **serviços**.


## Mapa da aplicação
Há 3 (três) atividades principais que servem de base para o acesso ás demais, são elas:

***Home***: Página inicial, por onde o aplicativo inicia.

***Registros***: Listagem das solicitações pendentes.

***Configurações***: Responsável pelo cadastro e modificação dos dados da aplicação, isso inclui o cadastro de clientes, funcionários e serviços.

<img src="" alt="Modelagem da aplicação" width="100%" />

Outras atividades estão listadas na modelagem apresentada, são atividades específicas, realizam apenas uma ação, que pode ser o CRUD de uma entidade por exemplo.


## Tecnologias utilizadas

### Android Studio

A IDE escolhida para o desenvolvimento da aplicação, por ser completa e oferecer uma maior produtividade.

<img src="" alt="Modelagem da aplicação" width="100%" />

### Flutter

Framework desenvolvido em dart para facilitar o desenvolvimento de aplicativos multiplataforma.

<img src="" alt="Modelagem da aplicação" width="100%" />


## Documentação do Flutter

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,****
samples, guidance on mobile development, and a full API reference.
