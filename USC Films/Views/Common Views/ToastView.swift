//
//  ToastView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 27/04/21.
//

import SwiftUI

// Referred: https://prafullkumar77.medium.com/swiftui-how-to-make-toast-and-notification-banners-bc8aae313b33
struct ToastDataModel {
    var title:String
}

struct ToastView: View {
    
    let dataModel: ToastDataModel
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Text(dataModel.title)
                .foregroundColor(.white)
                .font(.subheadline)
                .padding([.top,.bottom],10)
                .padding([.leading,.trailing],20)
//                .background(Color.black.opacity(0.5))
                .background(Color.gray)
                .clipShape(Capsule())
                .multilineTextAlignment(.center)
        }
        .padding(.bottom)
        .frame(width: UIScreen.main.bounds.width / 1.25)
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.show = false
                }
            }
        })
    }
}

struct Overlay<T: View>: ViewModifier {
    
    @Binding var show: Bool
    let overlayView: T
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if show {
                overlayView
            }
        }
    }
}

extension View {
    func overlay<T: View>( overlayView: T, show: Binding<Bool>) -> some View {
        self.modifier(Overlay.init(show: show, overlayView: overlayView))
    }
}



struct ToastView_Previews: PreviewProvider {
    
    static var previews: some View {
        ToastView(dataModel: ToastDataModel(title: "Godzilla vs. Kong was added to Watchlist"), show: .constant(true))
    }
}

