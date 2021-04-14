//
//  ReviewCard.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI

struct ReviewCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            VStack(alignment: .leading, spacing: 5) {
                Text("A review by Amazon Customer")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text("Written by Amazon Customer on Oct 4, 2016")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 5) {
                Image(systemName: "star.fill")
                    .foregroundColor(.red)
                    .font(.system(size: 20))
                Text("5.0/5.0")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
            
            // Description
            Text("This film is one of Hrithik Roshan's early movies. He plays two different characters. One a nice simple poor man, who falls in love with the daughter of a wealthy business man. Unfortunately, the nice guy gets caught up in witnessing a murder and meets a tragic end. Grief stricken the daughter goes to New Zealand to forget him. But fate steps in and she meets a wealthy man (Rai) who looks just like the nice guy. Because she does not behave like all the other silly girls chasing after him, she catches his eye and his attentions. He returns with her to India and helps to bring justice to those who hurt her first love. This is one of those movies that makes you ask, which guy was her true love. Or are both her true love? The story is very original and well performed. This movie is rated R for violence and some of the dancing, but it is still tame compared to Hollywood movies. Overall its very entertaining")
                .lineLimit(3)
                .foregroundColor(.black)
            
        }
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1).padding(-5))

    }
}

struct ReviewCard_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCard()
    }
}
