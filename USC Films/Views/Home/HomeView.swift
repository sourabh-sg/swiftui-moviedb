//
//  HomeView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 12/04/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var tvselected: Bool = false
    @State var carouselTitle = "Now Playing"
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        CarouselHeader(title: carouselTitle)
                        ImageContentView()
                    }
                    
                    MovieCardContainerView(heading: "Top Rated")
                    MovieCardContainerView(heading: "Popular")
                    
                        
                    Link("Powered by TMDB\nDeveloped by Sourabh Shamrao Gapate", destination: URL(string: "https://www.themoviedb.org/")!)
                        .font(.headline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 10)
                }
            }
            .frame(width: 335)
            .navigationBarTitle("USC Films")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        //Action
                                        tvselected.toggle()
                                        
                                        if tvselected {
                                            carouselTitle = "Trending"
                                        } else {
                                            carouselTitle = "Now Playing"
                                        }
                                        
                                    }, label: {
                                        if tvselected {
                                            Text("TV shows")
                                                .foregroundColor(.blue)
                                        } else {
                                            Text("Movies")
                                                .foregroundColor(.blue)
                                        }
                                    }
                )
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct CarouselHeader: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .padding(.bottom)
    }
}
