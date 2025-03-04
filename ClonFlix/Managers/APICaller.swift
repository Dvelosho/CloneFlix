//
//  APICaller.swift
//  ClonFlix
//
//  Created by daniel veloso on 03-03-25.
//

import Foundation

class APICaller {
    
    static let shared = APICaller()
    
    func getTrendingMovies() async throws -> [Movie] {

        let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNWM2ODJkMWYyMjllNjgxNzI2NjNhNThhNDYyOGEwZSIsIm5iZiI6MTc0MDk5ODg4NS4zMzMsInN1YiI6IjY3YzU4OGU1ODgxYzAxM2VkZTdhN2M1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cD7lMBKQoPeIiWcYhz6Q5eLQ7gnUcXcLh6K4Ah9jRZ0"
        ]
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Verifica el código de estado HTTP
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw NSError(domain: "APIError", code: httpResponse.statusCode, userInfo: nil)
        }
        
        // Decodifica la respuesta JSON en un objeto TrendingMoviesResponse
        let decoder = JSONDecoder()
        let moviesResponse = try decoder.decode(TrendingMoviesResponse.self, from: data)
        
        // Retorna el array de películas
        return moviesResponse.results
    }
    
    func getTrendingTVs() async throws -> [Tv]  {

        let url = URL(string: "https://api.themoviedb.org/3/trending/tv/day")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNWM2ODJkMWYyMjllNjgxNzI2NjNhNThhNDYyOGEwZSIsIm5iZiI6MTc0MDk5ODg4NS4zMzMsInN1YiI6IjY3YzU4OGU1ODgxYzAxM2VkZTdhN2M1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cD7lMBKQoPeIiWcYhz6Q5eLQ7gnUcXcLh6K4Ah9jRZ0"
        ]
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Verifica el código de estado HTTP
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw NSError(domain: "APIError", code: httpResponse.statusCode, userInfo: nil)
        }
        
        // Decodifica la respuesta JSON en un objeto TrendingMoviesResponse
        let decoder = JSONDecoder()
        let tvResponse = try decoder.decode(TrendingTvResponse.self, from: data)
        
        // Retorna el array de películas
        return tvResponse.results
    }
    
    func getPopularMovies() async throws -> [Movie]  {

        let url = URL(string: "https://api.themoviedb.org/3/trending/tv/day")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNWM2ODJkMWYyMjllNjgxNzI2NjNhNThhNDYyOGEwZSIsIm5iZiI6MTc0MDk5ODg4NS4zMzMsInN1YiI6IjY3YzU4OGU1ODgxYzAxM2VkZTdhN2M1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cD7lMBKQoPeIiWcYhz6Q5eLQ7gnUcXcLh6K4Ah9jRZ0"
        ]
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Verifica el código de estado HTTP
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw NSError(domain: "APIError", code: httpResponse.statusCode, userInfo: nil)
        }
        
        // Decodifica la respuesta JSON en un objeto TrendingMoviesResponse
        let decoder = JSONDecoder()
        let popularResponse = try decoder.decode(popularMoviesResponse.self, from: data)
        
        // Retorna el array de películas
        return popularResponse.results
    }
}

