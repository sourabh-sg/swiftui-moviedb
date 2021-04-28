//
//  FullReviewView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 14/04/21.
//

import SwiftUI

struct FullReviewView: View {
    
    var review: ReviewViewModel
    var movie: String
    
    init(review: ReviewViewModel, movie: String) {
        self.review = review
        self.movie = movie
    }
    
    var body: some View {
        ScrollView() {
            VStack(alignment: .leading, spacing: 10) {

                // Movie/TV Show Title
                Text(movie)
                    .font(Font.system(size: 26, weight: .bold))
                    .multilineTextAlignment(.leading)
                // Written by
                Text("By \(review.author) on \(review.reviewDate)")
                    .font(Font.system(size: 18, weight: .medium))
                    .foregroundColor(.gray)
                // Average star rating
                HStack(alignment: .center, spacing: 5) {
                    Image(systemName: "star.fill")
                        .font(Font.system(size: 18))
                        .foregroundColor(.red)
                    Text("\(review.rating)/5.0")
                        .font(Font.system(size: 18))
                }
                
                // Line
                Rectangle().frame(height: 0.25).foregroundColor(Color.gray)
                
                // Full review text
                Text(review.reviewText)
                    .font(Font.system(size: 18))
                    .multilineTextAlignment(.leading)
            }
            .padding(.leading, 15)
            .padding(.trailing, 15)
        }
    }
}

/*
struct FullReviewView_Previews: PreviewProvider {
    static var previews: some View {
        FullReviewView()
    }
}
*/
