//
//  AlertManager.swift
//  FEUtils
//
//  Created by Maciej on 23/02/2026.
//

import Combine

@available(macOS 26, *)
public class AlertManager: ObservableObject {
 @Published public var isPresented = false
}
