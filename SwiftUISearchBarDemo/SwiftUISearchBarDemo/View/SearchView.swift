//
//  SearchView.swift
//  SearchBar
//
//  Created by Mikiya Abe on 2019/12/16.
//  Copyright © 2019 Mikiya Abe. All rights reserved.
//

import SwiftUI
import SwiftUISearchBar

struct SearchView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var searchTerm: String = ""

    let people = [
        "Rudra Donald",
        "Duane Jackson",
        "Miranda Randall",
        "Zi Potts",
        "Alan Whyte",
        "Idris Ochoa",
        "Lucian Pitt",
        "Aeryn Sutherland",
        "King Paterson",
        "Traci Roman"
    ]

    var body: some View {
        VStack {
            SwiftUISearchBar(
                text: $searchTerm,
                placeholder: "Search for people",
                onCancel: {
                    // do nothing
                }
            )

            if searchTerm.isEmpty {
                Text("Type some")
                Spacer()
            } else if people.contains { $0.localizedStandardContains(self.searchTerm) } {
                List {
                    ForEach(
                        people.filter { $0.localizedStandardContains(self.searchTerm) },
                        id: \.self
                    ) { person in
                        Text(person)
                    }
                }
            } else {
                Spacer()
                Text("Not found")
                Spacer()
            }
        }
    }
}
