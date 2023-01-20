//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Алина on 09.01.2023.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    // MARK: - PROPERTIES
    
    let animal:Animal
    
    // MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string:"https://wikipedia.org"))!)
                }
            } //: HSTACK
        } //: BOX
    }
}
    // MARK: - PREVIEW
struct ExternalWebLinkView_Previews: PreviewProvider {
    
    static let animals:[Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        
        ExternalWebLinkView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
