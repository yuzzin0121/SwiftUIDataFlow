//
//  MyRandomImageView.swift
//  SwiftUIDataFlow
//
//  Created by 조유진 on 4/20/24.
//

import SwiftUI

struct MyRandomImageView: View {
    let layout = [
        GridItem(.flexible())
    ]
    let randomImageURL: String = "https://picsum.photos/200/300?random="
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0..<10) { value in
                        Section(header: Text("\(value+1)번째 섹션")) {
                            ScrollView(.horizontal) {
                                LazyHGrid(rows: layout, spacing: 12) {
                                    ForEach(0..<20) { _ in
                                        let url = randomImageURL + "\(value)"
                                        NavigationLink {
                                            DetailImageView(urlString: url, content: "\(value+1)번째 섹션")
                                        } label: {
                                            ImageView(urlString: url)
                                        }

                                    }
                                }
                            }                       
                        }
                    }
                    
                }
            }
            .listStyle(.inset)
            .navigationTitle("My Random Image")
        }
        
    }
}

struct ImageView: View {
    var urlString: String
    var url: URL? {
        URL(string: urlString) ?? nil
    }
    var body: some View {
        AsyncImage(url: url) { image in
            image.image?.resizable()
        }
        .frame(width: 100, height: 150)
        .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview {
    MyRandomImageView()
}
