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
            
            VStack(alignment: .leading) {
                Text("A review by \(review.author)")
                    .font(Font.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
                
                Text("Written by \(review.author) on \(review.reviewDate)")
                    .font(Font.system(size: 18))
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 5) {
                Image(systemName: "star.fill")
                    .foregroundColor(.red)
                    .font(.system(size: 19))
                Text("\(review.rating)/5.0")
                    .font(.system(size: 19))
                    .foregroundColor(.black)
            }
            
            // Description
            Text(review.reviewText)
                .font(.system(size: 16))
                .foregroundColor(.black)
                .lineLimit(3)
                .frame(width: 340, alignment: .leading)
            
        }
        .frame(width: 340)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1).padding(-9))

    }
}

/*
struct ReviewCard_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCard()
    }
}
*/
