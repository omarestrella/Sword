//
//  Gateway.swift
//  Sword
//
//  Created by Alejandro Alonso
//  Copyright © 2017 Alejandro Alonso. All rights reserved.
//

import Dispatch
import Foundation

import Starscream

protocol Gateway: AnyObject, WebSocketDelegate {
  var acksMissed: Int { get set }

  var gatewayUrl: String { get set }

  var heartbeatPayload: Payload { get }

  var heartbeatQueue: DispatchQueue! { get }

  var isConnected: Bool { get set }

  var session: WebSocket? { get set }

  func handleDisconnect(for code: Int)

  func handlePayload(_ payload: Payload)

  func heartbeat(at interval: Int)

  func reconnect()

  func send(_ text: String, presence: Bool)

  func start()

  func stop()
}

extension Gateway {
  /// Starts the gateway connection
  func start() {
    if session == nil {
      session = WebSocket(request: URLRequest(url: URL(string: gatewayUrl)!))
      session?.delegate = self
    }

    acksMissed = 0
    session?.connect()
  }
  
  func didReceive(event: WebSocketEvent, client: WebSocket) {
    switch event {
    case .connected:
      self.isConnected = true
    case .text(let text):
      self.handlePayload(Payload(with: text))
    case .disconnected(let reason, let code):
      self.isConnected = false
      self.handleDisconnect(for: Int(code))
    default:
      return
    }
  }
}
