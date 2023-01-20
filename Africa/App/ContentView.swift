//
//  ContentView.swift
//  Africa
//
//  Created by Алина on 06.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    let animals:[Animal] = Bundle.main.decode("animals.json")
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive:Bool = false
    @State private var gridLayout:[GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn:Int = 1
    @State private var toolBarIcon:String = "square.grid.2x2"
    
    // MARK: FUNCTIONS
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        switch gridColumn {
        case 1:
            toolBarIcon = "rectangle.grid.1x2"
        case 2:
            toolBarIcon = "square.grid.2x2"
        case 3:
            toolBarIcon = "square.grid.3x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
        
        print("Grid number \(gridColumn)")
    }

    // MARK: - BODY

    var body: some View {
        NavigationView {
            
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }//: LINK
                        }//: LOOP
                        
                        CreditsView()
                            .modifier(CenterModifier())
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal), label: {
                                    AnimalGridView(animal: animal)
                                })//: NAVIGATION
                            }//: LOOP
                        }//: GRID
                        .padding(10)
                        .animation(.easeOut)
                    }//: SCROOL
                    
                }//: LIST
            }//: GROUP
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        // LIST
                        Button(action: {
                            print("List view is activated")
                            isGridViewActive = false
                            haptic.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary  : .accentColor)
                        }
                        
                        // GRID
                        Button(action: {
                            print("Grid view is activated")
                            isGridViewActive = true
                            haptic.impactOccurred()
                            gridSwitch()
                        }) {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }//: BUTTONS
            }//: TOOLBAR
        }// NAVIGATION
    }
}

    // MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
