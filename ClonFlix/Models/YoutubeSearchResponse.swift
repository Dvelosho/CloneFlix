//
//  YoutubeSearchResponse.swift
//  ClonFlix
//
//  Created by daniel veloso on 24-03-25.
//

import Foundation


struct YoutubeSearchResponse: Codable {
    let items: [VideoItem]
}

struct VideoItem: Codable {
    let id: VideoId
}

struct VideoId: Codable {
    let videoId: String
    let kind: String
}


