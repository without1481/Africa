//
//  InsetFactView.swift
//  Africa
//
//  Created by Алина on 07.01.2023.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: PROPERTIES
    
    let animal:Animal
    
    // MARK: BODY
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id:\.self) { fact in
                    Text(fact)
                }
            }
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//: Box
    }
}
    // MARK: PREVIEW
struct InsetFactView_Previews: PreviewProvider {
    
    static let animals:[Animal] = Bundle.main.decode("animals.json")
 
    static var previews: some View {
        InsetFactView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
