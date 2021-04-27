//
//  SearchBar.swift
//  USC Films
//
//  Created by Sourabh Gapate on 14/04/21.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    var searchManager: SearchResultsData
    
    var body: some View {
        HStack {
            TextField("Search Movies, TVs...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .disableAutocorrection(true)
                .overlay(
                    // Glass image and cross button
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
                // Call "getResults" method of searchManager onChange of "text"
                .onChange(of: text) { newValue in
                    // Only call search query when text has 3 or more characters
                    if text.count > 2 {
                        searchManager.getResults(for: text)
                    } else if text.count == 0 {
                        // If text is nil, empty the searchResults VM
                        searchManager.searchResults = [MovieViewModel]()
                    }
                }
            
            
            if isEditing {
                // Cancel button
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    // Dismiss the keyboard
                    UIApplication.shared.endEditing() // Added to UIApplication extensionn below
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""), searchManager: SearchResultsData())
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
