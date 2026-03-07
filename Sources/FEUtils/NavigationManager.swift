//
//  NavigationManager.swift
//  FEUtils
//
//  Created by Maciej on 07/03/2026.
//

import Foundation
import SwiftUI

@available(macOS 26, *)
public class NavigationManager: ObservableObject {
 @Published public var path = NavigationPath()
 
 public init(path: NavigationPath = NavigationPath()) {
  self.path = path
 }
}
