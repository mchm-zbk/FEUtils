//
//  AlertManager.swift
//  FEUtils
//
//  Created by Maciej on 23/02/2026.
//

import SwiftUI
import Combine

@available(macOS 10.15, *)
public class AlertManager: ObservableObject {
 @Published var showAlert = false
 @Published var alertTitle = ""
 @Published var alertMessage = ""
 @Published var retryAction: () -> Void = {}
 
 func issueAlert(type: AlertType, entityName: String, retryAction: @escaping  () -> Void) {
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
 
 func dismissAlert() {
  self.showAlert = false
  self.alertTitle = ""
  self.alertMessage = ""
  self.retryAction = {}
 }
}

enum AlertType {
 case save
 case fetch
}
