//
//  ReviewViewModel.swift
//  USC Films
//
//  Created by Sourabh Gapate on 25/04/21.
//

import Foundation

struct ReviewViewModel {
    var author : String
    var reviewDate: String
    var reviewText: String
    var rating: String
        
    init(review: Review) {
        self.author = review.author
        self.reviewText = review.reviewText
        self.rating  = "\(round(review.rating * 0.5 * 10)/10)" // Convert to out of 5, round up and show only first decimal digit
        
        // Convert dateString to targetted format
        // First convert given string to Swift's date format
        // Then convert that date to desired string format
        
        // Formatter for given string to date
        let dateFormatterSource = DateFormatter()
        dateFormatterSource.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        // Formatter for converting date to desired format
        let dateFormatterDestination = DateFormatter()
        dateFormatterDestination.dateFormat = "MMM dd,yyyy"

        // Date formatter may return an optional value, use if let to catch optional
        if let date = dateFormatterSource.date(from: review.reviewDate) {
            // Convert date to desired format string
            self.reviewDate = (dateFormatterDestination.string(from: date))
        } else {
            // Else assign original date string
            self.reviewDate = review.reviewDate
        }
    }
    
}
