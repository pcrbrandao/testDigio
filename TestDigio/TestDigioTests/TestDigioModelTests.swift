//
//  TestDigioModelTests.swift
//  TestDigioModelTests
//
//  Created by Pedro Brandão on 13/10/24.
//

@testable import TestDigio
import XCTest

final class TestDigioModelTests: XCTestCase {

    func testParseMustBeValidWhenDataIsValid() throws {
        // swiftlint:disable all
        let stringData = """
{
  "spotlight": [
    {
      "name": "Recarga",
      "bannerURL": "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png",
      "description": "Agora ficou mais fÃ¡cil colocar crÃ©ditos no seu celular! A digio Store traz a facilidade de fazer recargas... direto pelo seu aplicativo, com toda seguranÃ§a e praticidade que vocÃª procura."
    },
    {
      "name": "Uber",
      "bannerURL": "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
      "description": "DÃª um vale presente Uber para amigos e familiares, ou use os vales para adicionar crÃ©ditos Ã  sua conta. O app Uber conecta vocÃª a uma viagem confiÃ¡vel em apenas alguns minutos. VocÃª pode escolher entre as opÃ§Ãµes econÃ´micas ou Premium para viajar do seu jeito. O pagamento Ã© fÃ¡cil e sem complicaÃ§Ãµes!"
    }
  ],
  "products": [
    {
      "name": "XBOX",
      "imageURL": "https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png",
      "description": "Com o e-Gift Card Xbox vocÃª adquire crÃ©ditos para comprar games, mÃºsica, filmes, programas de TV e muito mais!"
    },
    {
      "name": "Google Play",
      "imageURL": "https://s3-sa-east-1.amazonaws.com/digio-exame/google_play_icon.png",
      "description": "O e-gift Google Play dÃ¡ acesso a um mundo de entretenimento. Ã‰ muito fÃ¡cil encontrar algo que vocÃª goste, seja vocÃª um fÃ£ de mÃºsica ou de filmes, livros, revistas, apps ou jogos. Com o e-gift Google Play, vocÃª nÃ£o precisa de cartÃ£o de crÃ©dito e pode aproveitar o melhor do cinema, suas mÃºsicas favoritas e muito mais em smartphones e tablets Android, iOS e tambÃ©m no computador."
    },
    {
      "name": "Level up",
      "imageURL": "https://s3-sa-east-1.amazonaws.com/digio-exame/level_up_icon.png",
      "description": "Com o e-Gift Card Level Up vocÃª adquire crÃ©ditos para jogar diversas opÃ§Ãµes de games, de MMORPGs a jogos de Tiro e Mobas! Para ver a lista de jogos e a quantia de crÃ©ditos que pode resgatar em cada um deles, acesse: http://levelupgames.uol.com.br/levelup/seuegiftcard.lhtml"
    }
  ],
  "cash": {
    "title": "digio Cash",
    "bannerURL": "https://s3-sa-east-1.amazonaws.com/digio-exame/cash_banner.png",
    "description": "Dinheiro na conta sem complicaÃ§Ã£o. Transfira parte do limite do seu cartÃ£o para sua conta."
  }
}
"""
        // swiftlint:enable all
        let expected = "digio Cash"
        
        if let data = stringData.data(using: .utf8), let model = TestDigioModel.parse(data) {
            let result = model.cash.title
            XCTAssert(expected == result, "expected: \(expected), but: \(result)")
        }
    }
}
