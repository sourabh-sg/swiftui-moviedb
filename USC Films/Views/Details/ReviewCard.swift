//
//  ReviewCard.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI

struct ReviewCard: View {
    
    var review: ReviewViewModel
    
    init(review: ReviewViewModel) {
        self.review = review
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            VStack(alignment: .leading, spacing: 5) {
                Text("A review by \(review.author)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text("Written by \(review.author) on \(review.reviewDate)")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 5) {
                Image(systemName: "star.fill")
                    .foregroundColor(.red)
                    .font(.system(size: 20))
                Text("\(review.rating)/5.0")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
            
            // Description
            Text(review.reviewText)
                .lineLimit(3)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
            
        }
        .padding(5)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1).padding(-5))

    }
}

/*
struct ReviewCard_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCard()
    }
}
*/
