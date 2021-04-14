//
//  FullReviewView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 14/04/21.
//

import SwiftUI

struct FullReviewView: View {
    var body: some View {
        ScrollView() {
            VStack(alignment: .leading, spacing: 10) {

                // Movie/TV Show Title
                Text("Kaho Naa...Pyaar Hai")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                // Written by
                Text("By Amazon Customer on Oct 4, 2016")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                // Average star rating
                HStack(spacing: 5) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.red)
                        .font(.body)
                    Text("4.9/5.0")
                        .font(.callout)
                        .foregroundColor(.black)
                }
                
                // Border
                Rectangle().frame(height: 0.5).foregroundColor(.gray)
                
                // Full review text
                Text("This film is one of Hrithik Roshan's early movies. He plays two different characters. One a nice simple poor man, who falls in love with the daughter of a wealthy business man. Unfortunately, the nice guy gets caught up in witnessing a murder and meets a tragic end. Grief stricken the daughter goes to New Zealand to forget him. But fate steps in and she meets a wealthy man (Rai) who looks just like the nice guy. Because she does not behave like all the other silly girls chasing after him, she catches his eye and his attentions. He returns with her to India and helps to bring justice to those who hurt her first love. This is one of those movies that makes you ask, which guy was her true love. Or are both her true love? The story is very original and well performed. This movie is rated R for violence and some of the dancing, but it is still tame compared to Hollywood movies. Overall its very entertaining.")
                    .font(.callout)
                    .foregroundColor(.black)
            }.padding(.leading, 20)
            .padding(.trailing, 20)
        }
    }
}

struct FullReviewView_Previews: PreviewProvider {
    static var previews: some View {
        FullReviewView()
    }
}
