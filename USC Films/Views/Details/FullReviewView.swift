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
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                // Written by
                Text("By \(review.author) on \(review.reviewDate)")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                // Average star rating
                HStack(spacing: 5) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.red)
                        .font(.body)
                    Text("\(review.rating)/5.0")
                        .font(.callout)
                        .foregroundColor(.black)
                }
                
                // Border
                Rectangle().frame(height: 0.5).foregroundColor(.gray)
                
                // Full review text
                Text(review.reviewText)
                    .font(.callout)
                    .foregroundColor(.black)
            }.padding(.leading, 20)
            .padding(.trailing, 20)
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
