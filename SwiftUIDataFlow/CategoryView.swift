//
//  CategoryView.swift
//  SwiftUIDataFlow
//
//  Created by 조유진 on 4/22/24.
//

import SwiftUI

struct Category: Hashable {
    let id = UUID()
    let name: String
    let count: Int
}

struct CategoryView: View {
    private let category = ["스릴러", "액션", "로맨스", "SF", "애니메이션"]
    
    @State private var categoryList: [Category] = []
    
    @State private var query: String = ""
    var filterCategory: [Category] {
        return query.isEmpty ? categoryList : categoryList.filter { $0.name.contains(query) }
    }
    
    
    func setupRows(_ category: Category) -> some View {
        HStack {
            Image(systemName: "person.fill")
            Text("\(category.name), \(category.count)개")
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filterCategory, id: \.self) { value in
                    NavigationLink {
                        SearchDetailView(category: value)
                    } label: {
                        setupRows(value)
                    }
                }
            }
            .navigationTitle("영화 검색")
            .searchable(text: $query, placement: .navigationBarDrawer, prompt: "영화를 검색해보세요.")
            .onSubmit(of: .search) {
                print("asdf")
            }
            .navigationBar {
                Image(systemName: "chevron.left")
                    .wrapToButton {
                        print("뒤로가기")
                    }
            } trailing: {
                Text("추가")
                    .wrapToButton {
                        addCategory()
                    }
            }

        }
    }
    
    func addCategory() {
        let randomItem = Category(name: category.randomElement()!, count: .random(in: 1...100))
        categoryList.append(randomItem)
    }
}

struct SearchDetailView: View {
    let category: Category
    var body: some View {
        Text("\(category.name): \(category.count)")
    }
}

#Preview {
    CategoryView()
}
