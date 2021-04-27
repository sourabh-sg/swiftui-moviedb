//
//  LoadingView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 26/04/21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(alignment: .center) {
            Spinner(isAnimating: true, style: UIActivityIndicatorView.Style.medium, color: UIColor.gray)
            Text("Fetching Data...")
//                .font(.title2)
                .foregroundColor(.gray)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
