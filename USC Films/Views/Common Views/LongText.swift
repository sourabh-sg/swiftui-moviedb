//
//  LongText.swift
//  USC Films
//
//  Created by Sourabh Gapate on 28/04/21.
//

import SwiftUI


// Referred link: https://stackoverflow.com/questions/59485532/swiftui-how-know-number-of-lines-in-text

// This return a view of type "Text"
// It only shows three lines on load, and shows "Show more..." button if the text has more lines.
// On clicking "Show more...", it shows the complete text, with "Show less" button
struct LongText: View {
    
    /* Indicates whether the user want to see all the text or not. */
    @State private var expanded: Bool = false
    /* Indicates whether the text has been truncated in its display. */
    @State private var truncated: Bool = false
    private var text: String
    var lineLimit = 3

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Render the real text (which might or might not be limited)
            Text(text)
                .lineLimit(expanded ? nil : lineLimit)
                .background(

                    // Render the limited text and measure its size
                    Text(text).lineLimit(lineLimit)
                        .background(GeometryReader { displayedGeometry in
                            // Create a ZStack with unbounded height to allow the inner Text as much
                            // height as it likes, but no extra width.
                            ZStack {
                                // Render the text without restrictions and measure its size
                                Text(self.text)
                                    .background(GeometryReader { fullGeometry in
                                        // And compare the two
                                        Color.clear.onAppear {
                                            self.truncated = fullGeometry.size.height > displayedGeometry.size.height
                                        }
                                    })
                            }
                            .frame(height: .greatestFiniteMagnitude)
                        })
                        .hidden() // Hide the background
            )

            // Show button only if the text is truncated
            if truncated { toggleButton }
        }
    }

    var toggleButton: some View {
        HStack {
            Spacer()
            Button(action: { self.expanded.toggle() }) {
                Text(self.expanded ? "Show less" : "Show more...")
                    .font(Font.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
        }
    }
}
