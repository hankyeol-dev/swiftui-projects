//
//  Dummy.swift
//  SwiftUI-Crypto
//
//  Created by 강한결 on 9/6/24.
//

import Foundation

let dummyTrendings: TrendingOutputs = .init(
   coins: [
      .init(id: "moon-tropica", coin_id: 28470, name: "Moon Tropica", symbol: "CAH", marketRank: 530, small: "https://assets.coingecko.com/coins/images/28470/small/MTLOGO.png?1696527464", data: .init(price: 36.9717118016975, priceChangePercent: .init(usd: -4.04990008945853))),
      .init(id: "gala", coin_id: 12493, name: "GALA", symbol: "GALA", marketRank: 53, small: "https://assets.coingecko.com/coins/images/12493/small/GALA_token_image_-_200PNG.png?1709725869", data: .init(price: 0.0627306136161425, priceChangePercent: .init(usd: 9.60183117845317))),
      .init(id: "moon-tropica2", coin_id: 28470, name: "Moon Tropica", symbol: "CAH", marketRank: 530, small: "https://assets.coingecko.com/coins/images/28470/small/MTLOGO.png?1696527464", data: .init(price: 36.9717118016975, priceChangePercent: .init(usd: -4.04990008945853))),
      .init(id: "gala2", coin_id: 12493, name: "GALA", symbol: "GALA", marketRank: 53, small: "https://assets.coingecko.com/coins/images/12493/small/GALA_token_image_-_200PNG.png?1709725869", data: .init(price: 0.0627306136161425, priceChangePercent: .init(usd: 9.60183117845317))),.init(id: "moon-tropica", coin_id: 28470, name: "Moon Tropica", symbol: "CAH", marketRank: 530, small: "https://assets.coingecko.com/coins/images/28470/small/MTLOGO.png?1696527464", data: .init(price: 36.9717118016975, priceChangePercent: .init(usd: -4.04990008945853))),
      .init(id: "moon-tropica3", coin_id: 28470, name: "Moon Tropica", symbol: "CAH", marketRank: 530, small: "https://assets.coingecko.com/coins/images/28470/small/MTLOGO.png?1696527464", data: .init(price: 36.9717118016975, priceChangePercent: .init(usd: -4.04990008945853))),
      .init(id: "gala3", coin_id: 12493, name: "GALA", symbol: "GALA", marketRank: 53, small: "https://assets.coingecko.com/coins/images/12493/small/GALA_token_image_-_200PNG.png?1709725869", data: .init(price: 0.0627306136161425, priceChangePercent: .init(usd: 9.60183117845317)))
   ],
   nfts: [
      .init(id: "chameleon-travel-club", name: "ChameleonTravelClub", symbol: "CTC", thumb: "https://assets.coingecko.com/nft_contracts/images/3610/standard/chameleon-travel-club.png?1707290106", data: .init(floorPrice: "4.29 ETH", floorPriceChangePercent: "57.3120347225931")),
      .init(id: "natcats", name: "Natcats", symbol: "DMTNATCATS", thumb: "https://assets.coingecko.com/nft_contracts/images/4171/standard/natcats.png?1709517703", data: .init(floorPrice: "0.051 BTC", floorPriceChangePercent: "52.5917829733019")),
      .init(id: "chameleon-travel-club", name: "ChameleonTravelClub", symbol: "CTC", thumb: "https://assets.coingecko.com/nft_contracts/images/3610/standard/chameleon-travel-club.png?1707290106", data: .init(floorPrice: "4.29 ETH", floorPriceChangePercent: "57.3120347225931")),
      .init(id: "natcats", name: "Natcats", symbol: "DMTNATCATS", thumb: "https://assets.coingecko.com/nft_contracts/images/4171/standard/natcats.png?1709517703", data: .init(floorPrice: "0.051 BTC", floorPriceChangePercent: "52.5917829733019")),
      .init(id: "chameleon-travel-club", name: "ChameleonTravelClub", symbol: "CTC", thumb: "https://assets.coingecko.com/nft_contracts/images/3610/standard/chameleon-travel-club.png?1707290106", data: .init(floorPrice: "4.29 ETH", floorPriceChangePercent: "57.3120347225931")),
      .init(id: "natcats", name: "Natcats", symbol: "DMTNATCATS", thumb: "https://assets.coingecko.com/nft_contracts/images/4171/standard/natcats.png?1709517703", data: .init(floorPrice: "0.051 BTC", floorPriceChangePercent: "52.5917829733019"))
   ]
)

/**
 "coins": [
     {
       "item": {
         "id": "moon-tropica",
         "coin_id": 28470,
         "name": "Moon Tropica",
         "symbol": "CAH",
         "market_cap_rank": 530,
         "thumb": "https://assets.coingecko.com/coins/images/28470/standard/MTLOGO.png?1696527464",
         "small": "https://assets.coingecko.com/coins/images/28470/small/MTLOGO.png?1696527464",
         "large": "https://assets.coingecko.com/coins/images/28470/large/MTLOGO.png?1696527464",
         "slug": "moon-tropica",
         "price_btc": 0.000530163474333298,
         "score": 0,
         "data": {
           "price": 36.9717118016975,
           "price_btc": "0.000530163474333299",
           "price_change_percentage_24h": {
             "aed": -4.04467447608756,
             "ars": -4.04990008945855,
             "aud": -4.04990008945802,
             "bch": -2.37567962487489,
             "bdt": -4.0499000894585,
             "bhd": -4.16927013396437,
             "bmd": -4.04990008945853,
             "bnb": -3.4734695990217,
             "brl": -4.04990008945847,
             "btc": -5.98585375059246,
             "cad": -4.04990008945848,
             "chf": -4.04990008945855,
             "clp": -5.02567556756719,
             "cny": -4.0499000894584,
             "czk": -4.04990008945864,
             "dkk": -4.04990008945864,
             "dot": -5.98238779521245,
             "eos": -5.74405098071799,
             "eth": -5.05689445119971,
             "eur": -4.09661619752604,
             "gbp": -4.04990008945847,
             "gel": -4.04990008945897,
             "hkd": -4.04990008945852,
             "huf": -4.05387716450818,
             "idr": -4.04990008945821,
             "ils": -4.40922021210977,
             "inr": -4.04990008945856,
             "jpy": -4.04990008945905,
             "krw": -4.04990008945847,
             "kwd": -4.12041469685036,
             "lkr": -4.0499000894589,
             "ltc": -5.29341338838337,
             "mmk": -4.04990008945877,
             "mxn": -4.0499000894592,
             "myr": -4.04990008945872,
             "ngn": -4.04990008945849,
             "nok": -4.04990008945854,
             "nzd": -4.0499000894586,
             "php": -4.04990008945844,
             "pkr": -4.04990008945845,
             "pln": -4.04990008945856,
             "rub": -4.04990008945847,
             "sar": -4.04990008945841,
             "sek": -4.04990008945854,
             "sgd": -4.04990008945858,
             "thb": -4.04105687070854,
             "try": -4.04990008945837,
             "twd": -4.04990008945847,
             "uah": -4.17945939929411,
             "usd": -4.04990008945853,
             "vef": -4.0499000894584,
             "vnd": -4.04990008945868,
             "xag": -4.06208301025163,
             "xau": -4.04990008945842,
             "xdr": -4.04990008945852,
             "xlm": -4.12493924900392,
             "xrp": -4.48127069993476,
             "yfi": -4.04427366181248,
             "zar": -4.0499000894588,
             "bits": -5.98585375059245,
             "link": -5.12005806599531,
             "sats": -5.98585375059245
           },
           "market_cap": "$99,703,583",
           "market_cap_btc": "1428.83459310001",
           "total_volume": "$282,142",
           "total_volume_btc": "4.04583894742915",
           "sparkline": "https://www.coingecko.com/coins/28470/sparkline.svg",
           "content": null
         }
       }
     },
     {
       "item": {
         "id": "gala",
         "coin_id": 12493,
         "name": "GALA",
         "symbol": "GALA",
         "market_cap_rank": 53,
         "thumb": "https://assets.coingecko.com/coins/images/12493/standard/GALA_token_image_-_200PNG.png?1709725869",
         "small": "https://assets.coingecko.com/coins/images/12493/small/GALA_token_image_-_200PNG.png?1709725869",
         "large": "https://assets.coingecko.com/coins/images/12493/large/GALA_token_image_-_200PNG.png?1709725869",
         "slug": "gala",
         "price_btc": 8.99538550992028e-7,
         "score": 1,
         "data": {
           "price": 0.0627306136161425,
           "price_btc": "0.000000899538550992028",
           "price_change_percentage_24h": {
             "aed": 9.60780028942887,
             "ars": 9.60183117845321,
             "aud": 9.60183117845384,
             "bch": 11.4674219663065,
             "bdt": 9.60183117845328,
             "bhd": 9.4654772249098,
             "bmd": 9.60183117845317,
             "bnb": 10.2234284851282,
             "brl": 9.60183117845336,
             "btc": 7.38745825724124,
             "cad": 9.60183117845328,
             "chf": 9.60183117845322,
             "clp": 8.48722286309518,
             "cny": 9.60183117845327,
             "czk": 9.60183117845312,
             "dkk": 9.60183117845326,
             "dot": 7.37688026427037,
             "eos": 7.62858932956233,
             "eth": 8.45108220753484,
             "eur": 9.54846832636144,
             "gbp": 9.60183117845332,
             "gel": 9.60183117845289,
             "hkd": 9.60183117845327,
             "huf": 9.59728824719456,
             "idr": 9.60183117845271,
             "ils": 9.19138717205251,
             "inr": 9.60183117845323,
             "jpy": 9.60183117845302,
             "krw": 9.60183117845328,
             "kwd": 9.52128378869318,
             "lkr": 9.60183117845326,
             "ltc": 8.06524825045215,
             "mmk": 9.60183117845293,
             "mxn": 9.60183117845321,
             "myr": 9.60183117845329,
             "ngn": 9.60183117845327,
             "nok": 9.6018311784532,
             "nzd": 9.60183117845338,
             "php": 9.60183117845333,
             "pkr": 9.60183117845299,
             "pln": 9.6018311784534,
             "rub": 9.60183117845327,
             "sar": 9.6018311784533,
             "sek": 9.60183117845319,
             "sgd": 9.60183117845319,
             "thb": 9.61193260585552,
             "try": 9.60183117845312,
             "twd": 9.601831178453,
             "uah": 9.45383823610663,
             "usd": 9.60183117845317,
             "vef": 9.60183117845337,
             "vnd": 9.60183117845306,
             "xag": 9.58791487790447,
             "xau": 9.60183117845332,
             "xdr": 9.60183117845335,
             "xlm": 9.4911259696921,
             "xrp": 8.99767343610987,
             "yfi": 9.54409111376635,
             "zar": 9.6018311784527,
             "bits": 7.38745825724125,
             "link": 8.37662653267695,
             "sats": 7.38745825724125
           },
           "market_cap": "$2,365,621,969",
           "market_cap_btc": "33901.3141933559",
           "total_volume": "$212,777,204",
           "total_volume_btc": "3051.16253202022",
           "sparkline": "https://www.coingecko.com/coins/12493/sparkline.svg",
           "content": {
             "title": "What is GALA?",
             "description": "Gala is a blockchain gaming ecosystem. Gamers can explore different type of games and have their experiences interact across each other on the Gala platform. The GALA token is the utility token and primary medium of exchange of the ecosystem. Game items are represented as NFTs on the Ethereum blockchain and users can trade them on all marketplaces."
           }
         }
       }
     }
   ],
   "nfts": [
     {
       "id": "chameleon-travel-club",
       "name": "ChameleonTravelClub",
       "symbol": "CTC",
       "thumb": "https://assets.coingecko.com/nft_contracts/images/3610/standard/chameleon-travel-club.png?1707290106",
       "nft_contract_id": 3610,
       "native_currency_symbol": "eth",
       "floor_price_in_native_currency": 4.29,
       "floor_price_24h_percentage_change": 57.3120347225931,
       "data": {
         "floor_price": "4.29 ETH",
         "floor_price_in_usd_24h_percentage_change": "57.3120347225931",
         "h24_volume": "11.26 ETH",
         "h24_average_sale_price": "2.82 ETH",
         "sparkline": "https://www.coingecko.com/nft/3610/sparkline.svg",
         "content": null
       }
     },
     {
       "id": "natcats",
       "name": "Natcats",
       "symbol": "DMTNATCATS",
       "thumb": "https://assets.coingecko.com/nft_contracts/images/4171/standard/natcats.png?1709517703",
       "nft_contract_id": 4171,
       "native_currency_symbol": "btc",
       "floor_price_in_native_currency": 0.05139,
       "floor_price_24h_percentage_change": 52.5917829733019,
       "data": {
         "floor_price": "0.051 BTC",
         "floor_price_in_usd_24h_percentage_change": "52.5917829733019",
         "h24_volume": "3.93 BTC",
         "h24_average_sale_price": "0.049 BTC",
         "sparkline": "https://www.coingecko.com/nft/4171/sparkline.svg",
         "content": null
       }
     }
   ],
 
 */
