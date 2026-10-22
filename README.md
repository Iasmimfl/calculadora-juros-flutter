# Calculadora de Juros Compostos: Simulador e Comparador de Investimentos

**Autora:** Iasmim Ferreira de Lima

## Visão Geral

O Simulador de Investimentos é um aplicativo móvel desenvolvido em Flutter para a atividade da disciplina de Programação para Dispositivos Móveis (PDM).

O objetivo do projeto é permitir que o usuário compare dois cenários de investimentos diferentes, utilizando o cálculo de juros compostos com aportes mensais. A aplicação apresenta os resultados de forma organizada, facilitando a visualização do crescimento do capital investido, do rendimento acumulado e do montante final de cada investimento.

## Funcionalidades

- **Comparação de investimentos:** permite simular e comparar dois investimentos distintos.
- **Entrada de dados:** possibilita informar o capital inicial, o aporte mensal e a taxa de juros de cada investimento.
- **Prazo compartilhado:** define um período único, em meses, para os dois investimentos.
- **Cálculo de juros compostos:** calcula o montante final e o rendimento obtido ao longo do período.
- **Resumo comparativo:** apresenta os resultados dos dois investimentos lado a lado.
- **Evolução mensal:** exibe uma lista com o crescimento do capital de cada investimento mês a mês.
- **Reiniciar simulação:** permite limpar os dados e realizar uma nova comparação.

## Tecnologias Utilizadas

- **Linguagem de programação:** Dart
- **Framework:** Flutter
- **Plataforma-alvo:** Android
- **Gerenciamento de estado:** `setState`
- **Interface:** widgets do Flutter

## Critérios do Desafio Atendidos

O projeto contempla os seguintes requisitos técnicos:

1. **Formulários:** utilização de `TextFormField` com validação dos dados informados pelo usuário.
2. **Navegação entre telas:** utilização de `Navigator.push` e `Navigator.pop` para navegar entre a tela de entrada de dados e a tela de resultados.
3. **Exibição de listas:** utilização de `ListView.separated` para apresentar a evolução dos investimentos ao longo dos meses.
4. **Gerenciamento de estado:** utilização de `StatefulWidget` e `setState` para atualizar a interface conforme os dados e resultados da simulação.
5. **Organização do código:** criação de métodos auxiliares, como `_buildTextField` e `_buildResumoCard`, para facilitar a leitura, a manutenção e a reutilização de partes da interface.

## Como Executar o Projeto

### Pré-requisitos

Antes de executar o aplicativo, é necessário ter:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e configurado.
- [Android Studio](https://developer.android.com/studio) instalado, caso opte por utilizar um emulador Android.
- Um dispositivo Android físico com a depuração USB ativada ou um emulador Android configurado no Android Studio.
- [Git](https://git-scm.com/downloads) instalado para clonar o repositório.

### Passo a Passo

**1. Clonar o repositório**

Abra o terminal e execute o comando:

```bash
git clone https://github.com/Iasmimfl/calculadora-juros-flutter.git
```

**2. Acessar a pasta do projeto**

```bash
cd calculadora-juros-flutter
```

**3. Instalar as dependências**

Execute o comando abaixo para baixar as dependências necessárias:

```bash
flutter pub get
```

**4. Escolher o dispositivo de execução**

O aplicativo pode ser executado de duas maneiras:

- **Dispositivo Android físico:** conecte o celular ao notebook por meio de um cabo USB, ative a depuração USB nas opções de desenvolvedor e autorize a conexão quando solicitado.
- **Emulador Android:** abra o Android Studio, acesse o Device Manager, crie ou selecione um dispositivo virtual Android e inicie o emulador.

Para verificar se o dispositivo físico ou o emulador foi reconhecido pelo Flutter, execute:

```bash
flutter devices
```

**5. Executar o aplicativo**

Com o celular conectado ou o emulador iniciado, execute:

```bash
flutter run
```

O Flutter identificará os dispositivos disponíveis para executar o aplicativo. Caso exista mais de um dispositivo conectado, será possível selecionar aquele em que deseja iniciar a aplicação.

## Repositório

O código-fonte deste projeto está disponível no GitHub:

[https://github.com/Iasmimfl/calculadora-juros-flutter](https://github.com/Iasmimfl/calculadora-juros-flutter)

## Considerações Finais

O projeto foi desenvolvido com o propósito de aplicar os conhecimentos adquiridos na disciplina de Programação para Dispositivos Móveis, explorando a criação de formulários, a validação de dados, a navegação entre telas, a utilização de listas dinâmicas e o gerenciamento de estado no Flutter.

Além de atender aos requisitos técnicos propostos, o aplicativo oferece uma maneira prática de visualizar e comparar diferentes cenários de investimentos com juros compostos.