//
//  SearchablePage.swift
//  FEUtils
//
//  Created by Maciej on 24/02/2026.
//

import SwiftUI

@available(macOS 26, *)
public protocol SearchablePage: View {
 associatedtype Item: SearchableByName
 var searchQuery: String {get}
 var allItems: [Item] {get}
}

@available(macOS 26, *)
public extension SearchablePage {
 var searchResults: [Item] {
  if searchQuery.isEmpty {
   return allItems
  } else {
   return allItems.filter({ item in
    item.nameContains(searchQuery)
   })
  }
 }
}

public protocol SearchableByName {
 var name: String {get}
}

public extension SearchableByName {
 func nameContains(_ query: String) -> Bool {
  self.name.lowercased().contains(query.lowercased())
 }
}
