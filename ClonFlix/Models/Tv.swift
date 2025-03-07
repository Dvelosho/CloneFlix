//
//  Tv.swift
//  ClonFlix
//
//  Created by daniel veloso on 03-03-25.
//

import Foundation

struct TrendingTvResponse: Codable {
    let results: [Tv]
}

struct Tv: Codable {
    
    let id: Int
    let media_type: String?
    let name: String?
    let original_name: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let first_air_date: String?
    let vote_average: Double
    
}

//"backdrop_path": "/qVBIAcZkK5j6WRq7JehJcOMbdgb.jpg",
//"id": 111803,
//"name": "The White Lotus",
//"original_name": "The White Lotus",
//"overview": "Follow the exploits of various guests and employees at an exclusive tropical resort over the span of a week as with each passing day, a darker complexity emerges in these picture-perfect travelers, the hotel’s cheerful employees and the idyllic locale itself.",
//"poster_path": "/aVhCMD65Q9YNsVDfJaoFQLQ5wrR.jpg",
//"media_type": "tv",
//"adult": false,
//"original_language": "en",
//"genre_ids": [
//  35,
//  18,
//  9648
//],
//"popularity": 673.362,
//"first_air_date": "2021-07-11",
//"vote_average": 7.607,
//"vote_count": 909,
//"origin_country": [
//  "US"
//]
//}


