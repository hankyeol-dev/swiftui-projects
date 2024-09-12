//
//  SocketManager.swift
//  swiftui-transitionNetwork
//
//  Created by 강한결 on 9/12/24.
//

import Foundation
import Combine

final class SocketManager: NSObject {
   static let manager: SocketManager = .init()
   private var session: URLSession?
   private var webSocketSession: URLSessionWebSocketTask?
   private let urlString: String = "wss://api.upbit.com/websocket/v1"
   
   var orderbookSubject = PassthroughSubject<OrderBook, Never>()
   
   private override init() {
      super.init()
      session = .init(configuration: .default, delegate: self, delegateQueue: nil)
   }
   
   func open() {
      guard let session, let url = URL(string: urlString) else { return }
      webSocketSession = session.webSocketTask(with: url)
      webSocketSession?.resume()
   }
   
   func close() {
      webSocketSession?.cancel(with: .goingAway, reason: nil)
      webSocketSession = nil
   }
   
   func send() {
      let sendable = """
      [{"ticket":"test"},{"type":"orderbook","codes":["KRW-BTC"]}]
      """
      
      if let webSocketSession {
         webSocketSession.send(.string(sendable)) { error in
            guard error == nil else {
               dump(error)
               return
            }
         }
      }
   }
   
   func receive() {
      if let webSocketSession {
         webSocketSession.receive { [weak self] result in
            switch result {
            case let .success(success):
               switch success {
               case let .data(data):
                  self?.decodeData(data)
               default:
                  print("string~")
               }
            case let .failure(failure):
               dump(failure)
            }
            
            self?.receive()
         }
      }
   }
   
   private func decodeData(_ data: Data) {
      if let decoded = try? JSONDecoder().decode(OrderBook.self, from: data) {
         orderbookSubject.send(decoded)
      }
   }
}

extension SocketManager: URLSessionWebSocketDelegate {
   func urlSession(_ session: URLSession,
                   webSocketTask: URLSessionWebSocketTask,
                   didOpenWithProtocol protocol: String?) {
      print("socket open")
      receive()
   }
   
   func urlSession(_ session: URLSession,
                   webSocketTask: URLSessionWebSocketTask,
                   didCloseWith closeCode: URLSessionWebSocketTask.CloseCode,
                   reason: Data?) {
      print("socket close")
   }
}
