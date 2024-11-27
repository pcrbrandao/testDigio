#  Teste Digio

## Sobre o App

Possui com duas telas, uma que exibe uma lista de produtos da Digio Store e outra que exibe o detalhe do produto.
Utilizando pod(s):
- https://github.com/SDWebImage/SDWebImage
    Permite download e atualização imagens da web de maneira acíncrona.

Ambiente de desenvolvimento:
- XCode 16
- MacOs Sonoma 14.16.1
- Ruby 3.3.5

Bugs resolvidos:
- Incompatibilidade do SwiftLint com XCode 16
- Imcompatibilidade do CocoaPods com XCode 16

### Foi utilizado o Interface Builder para a criação e navegação das telas por questão de praticidade. O mesmo pode ser feito com View Coded caso seja requisito.
O SwiftUI não pode ser utilizado devido ao requisito técnico do target mínimo do app, iOS 12.

![Captura de Tela 2024-10-11 às 16 09 18](https://github.com/user-attachments/assets/1bffa957-f10e-498d-b52c-a557e39470bb)


## Serviço
URL: https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products

## Requisitos técnicos

* Swift 4.2
* Deployment Target iOS 12
* SwiftLint
* Testes unitários
* Arquitetura MVVM
* URLSession + Codable
* Tratamento de erros
* Fastlane

## Evidência
https://github.com/user-attachments/assets/4678fc8a-15c6-4e75-b41f-da0c06405b9d

