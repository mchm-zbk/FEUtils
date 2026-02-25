//
//  AlertManager.swift
//  FEUtils
//
//  Created by Maciej on 23/02/2026.
//

import Combine

@available(macOS 26, *)
public class AlertManager: ObservableObject {
 @Published public var isPresented: Bool
 @Published public var title: String
 @Published public var message: String
 @Published public var retryAction: () async -> Void
 
 public init(isPresented: Bool = false, title: String = "", message: String = "", retryAction: @escaping () async -> Void = {}) {
  self.isPresented = isPresented
  self.title = title
  self.message = message
  self.retryAction = retryAction
 }
 
 public func issueAlert(type: AlertType, entityName: String, retryAction: @escaping  () -> Void) {
  title = "Issue occured when "
  message = "Issue occured when trying to "
  
  if type == .save {
   title += "saving data"
   message += "save \(entityName)"
  }
  
  if type == .fetch {
   title += "downloading data"
   message += "download \(entityName)"
  }
  
  self.retryAction = retryAction
  isPresented = true
 }
 
 public func dismissAlert() {
  isPresented = false
  title = ""
  message = ""
  retryAction = {}
 }
}

public enum AlertType {
 case save
 case fetch
}
