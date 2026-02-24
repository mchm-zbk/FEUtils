//
//  AlertManager.swift
//  FEUtils
//
//  Created by Maciej on 23/02/2026.
//

import Combine
import SwiftUI

@available(macOS 26, *)
public class AlertManager: ObservableObject {
 @Published public var isShown: Bool
 @Published public var title: String
 @Published public var message: String
 @Published public var buttons: [Button<Text>]
 
 public init(isShown: Bool = false, title: String = "", message: String = "", buttons: [Button<Text>] = []) {
  self.isShown = isShown
  self.title = title
  self.message = message
  self.buttons = buttons
 }
 
 public func issueAlert(type: AlertType, entityName: String, buttons: @escaping () -> any View) {
  if type == .save {
   title = "Issue occured when saving data"
   message = "Issue occured when trying to save \(entityName)"
  }
  
  if type == .fetch {
   title = "Issue occured when downloading data"
   message = "Issue occured when trying to download \(entityName)"
  }
  
  self.buttons = buttons
  self.isShown = true
 }
 
 public func dismissAlert() {
  self.isShown = false
  self.title = ""
  self.message = ""
  self.buttons = nil
 }
}

public enum AlertType {
 case save
 case fetch
}
