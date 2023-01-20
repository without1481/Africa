//
//  InsetGalleyView.swift
//  Africa
//
//  Created by Алина on 07.01.2023.
//

import SwiftUI

struct InsetGalleyView: View {
    
    // MARK: - PROPERTIES
    
    let animal:Animal
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12 )
                } //: LOOP
            } //: HSTACK
        } //: SCROLL
    }
}

    // MARK: - PREVIEW
struct InsetGalleyView_Previews: PreviewProvider {
    static var animals:[Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetGalleyView(animal: animals[1])
    }
}
