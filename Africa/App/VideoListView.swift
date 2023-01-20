//
//  VideoListView.swift
//  Africa
//
//  Created by Алина on 06.01.2023.
//

import SwiftUI

struct VideoListView: View {
     
    // MARK: - PROPERTIES
    
    @State var videos:[Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)) {
                        VideoListItem(video: video)
                            .padding(.vertical, 8)
                    }                    
                }//:LOOP
            }//: LIST
            .listStyle(.insetGrouped)
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // Shuffle videos
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
        }//: NAVIGATIOn
    }
}

    // MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
