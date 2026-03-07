//
//  SearchablePage.swift
//  FEUtils
//
//  Created by Maciej on 24/02/2026.
//

import SwiftUI

@available(macOS 26, *)
public protocol Searchable: View {
 associatedtype SearchItem: SearchableByName
 var searchQuery: String {get}
 var searchItems: [SearchItem] {get}
}

@available(macOS 26, *)
public extension Searchable {
 var searchResults: [SearchItem] {
  if searchQuery.isEmpty {
   return searchItems
  } else {
   return searchItems.filter({ item in
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
