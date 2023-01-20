//
//  AnimalGridView.swift
//  Africa
//
//  Created by Алина on 19.01.2023.
//

import SwiftUI

struct AnimalGridView: View {
    // MARK: PROPERTIES
    
    let animal:Animal
    
    // MARK: BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

// MARK: PREVIEWS
struct AnimalGridView_Previews: PreviewProvider {
    
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        
        AnimalGridView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
