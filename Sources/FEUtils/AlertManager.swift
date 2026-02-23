//
//  AlertManager.swift
//  FEUtils
//
//  Created by Maciej on 23/02/2026.
//

import Combine

@available(macOS 10.15, *)
public class AlertManager: ObservableObject {
 @Published public var showAlert: Bool
 @Published public var alertTitle: String
 @Published public var alertMessage: String
 @Published public var retryAction: () -> Void
 
 public init(showAlert: Bool = false, alertTitle: String = "", alertMessage: String = "", retryAction: @escaping () -> Void = {}) {
  self.showAlert = showAlert
  self.alertTitle = alertTitle
  self.alertMessage = alertMessage
  self.retryAction = retryAction
 }
 
 public func issueAlert(type: AlertType, entityName: String, retryAction: @escaping  () -> Void) {
  if type == .save {
   alertTitle = "Issue occured when saving data"
   alertMessage = "Issue occured when trying to save \(entityName)"
  }
  
  if type == .fetch {
   alertTitle = "Issue occured when downloading data"
   alertMessage = "Issue occured when trying to download \(entityName)"
  }
  
  self.retryAction = retryAction
  self.showAlert = true
 }
 
 public func dismissAlert() {
  self.showAlert = false
  self.alertTitle = ""
  self.alertMessage = ""
  self.retryAction = {}
 }
}

public enum AlertType {
 case save
 case fetch
}
