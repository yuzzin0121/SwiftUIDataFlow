//
//  DetailImageView.swift
//  SwiftUIDataFlow
//
//  Created by 조유진 on 4/22/24.
//

import SwiftUI

struct DetailImageView: View {
    var urlString: String = ""
//    @Binding var content: String
    @State var content: String = ""
    
    var url: URL? {
        URL(string: urlString) ?? nil
    }
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: url) { image in
                image.image?.resizable()
            }
            .frame(width: 150, height: 200)
            TextField("", text: $content)
                .frame(width: 200)
                
        }
    }
}

#Preview {
    DetailImageView()
}
