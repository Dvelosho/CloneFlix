//
//  APICaller.swift
//  ClonFlix
//
//  Created by daniel veloso on 03-03-25.
//

import Foundation

struct Constants {
    
    static let YOUTUBE_API_KEY = "AIzaSyD4_Yjw-_e4YQX7YQX7YQX7YQX7YQX7YQ"
    static let YOUTUBEsearchURL = "https://www.googleapis.com/youtube/v3/search"
    
}

enum APIError: Error {
    case failedTogetData
    case failedToEncodeQuery
    case invalidURL
    case noResultsFound
    // ... otros casos que necesites
}

class APICaller {
    
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day") else {
            completion(.failure(APIError.failedTogetData))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNWM2ODJkMWYyMjllNjgxNzI2NjNhNThhNDYyOGEwZSIsIm5iZiI6MTc0MDk5ODg4NS4zMzMsInN1YiI6IjY3YzU4OGU1ODgxYzAxM2VkZTdhN2M1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cD7lMBKQoPeIiWcYhz6Q5eLQ7gnUcXcLh6K4Ah9jRZ0"
        ]
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? APIError.failedTogetData))
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/tv/day") else {
            completion(.failure(APIError.failedTogetData))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNWM2ODJkMWYyMjllNjgxNzI2NjNhNThhNDYyOGEwZSIsIm5iZiI6MTc0MDk5ODg4NS4zMzMsInN1YiI6IjY3YzU4OGU1ODgxYzAxM2VkZTdhN2M1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cD7lMBKQoPeIiWcYhz6Q5eLQ7gnUcXcLh6K4Ah9jRZ0"
        ]
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? APIError.failedTogetData))
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular") else {
            completion(.failure(APIError.failedTogetData))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNWM2ODJkMWYyMjllNjgxNzI2NjNhNThhNDYyOGEwZSIsIm5iZiI6MTc0MDk5ODg4NS4zMzMsInN1YiI6IjY3YzU4OGU1ODgxYzAxM2VkZTdhN2M1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cD7lMBKQoPeIiWcYhz6Q5eLQ7gnUcXcLh6K4Ah9jRZ0"
        ]
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? APIError.failedTogetData))
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
    func getUpcoming(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming") else {
            completion(.failure(APIError.failedTogetData))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNWM2ODJkMWYyMjllNjgxNzI2NjNhNThhNDYyOGEwZSIsIm5iZiI6MTc0MDk5ODg4NS4zMzMsInN1YiI6IjY3YzU4OGU1ODgxYzAxM2VkZTdhN2M1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cD7lMBKQoPeIiWcYhz6Q5eLQ7gnUcXcLh6K4Ah9jRZ0"
        ]
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? APIError.failedTogetData))
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated") else {
            completion(.failure(APIError.failedTogetData))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNWM2ODJkMWYyMjllNjgxNzI2NjNhNThhNDYyOGEwZSIsIm5iZiI6MTc0MDk5ODg4NS4zMzMsInN1YiI6IjY3YzU4OGU1ODgxYzAxM2VkZTdhN2M1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cD7lMBKQoPeIiWcYhz6Q5eLQ7gnUcXcLh6K4Ah9jRZ0"
        ]
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? APIError.failedTogetData))
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getSearchmovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/search/keyword") else {
            completion(.failure(APIError.failedTogetData))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNWM2ODJkMWYyMjllNjgxNzI2NjNhNThhNDYyOGEwZSIsIm5iZiI6MTc0MDk5ODg4NS4zMzMsInN1YiI6IjY3YzU4OGU1ODgxYzAxM2VkZTdhN2M1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cD7lMBKQoPeIiWcYhz6Q5eLQ7gnUcXcLh6K4Ah9jRZ0"
        ]
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? APIError.failedTogetData))
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        // Codifica el query para que sea seguro en una URL
        guard let queryEncoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            completion(.failure(APIError.failedTogetData))
            return
        }
        
        // Construye la URL correcta para la búsqueda
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?query=\(queryEncoded)") else {
            completion(.failure(APIError.failedTogetData))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNWM2ODJkMWYyMjllNjgxNzI2NjNhNThhNDYyOGEwZSIsIm5iZiI6MTc0MDk5ODg4NS4zMzMsInN1YiI6IjY3YzU4OGU1ODgxYzAxM2VkZTdhN2M1ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cD7lMBKQoPeIiWcYhz6Q5eLQ7gnUcXcLh6K4Ah9jRZ0"
        ]
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? APIError.failedTogetData))
                return
            }
            
            do {
                // Decodifica la respuesta
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func searchYouTubeTrailer(for query: String, completion: @escaping (Result<String, Error>) -> Void) {
        // Preparamos el query de búsqueda
        let searchQuery = "\(query) official trailer"
        guard let encodedQuery = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            completion(.failure(APIError.failedToEncodeQuery))
            return
        }
        
        // Construimos la URL
        let urlString = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=\(encodedQuery)&key=\(Constants.YOUTUBE_API_KEY)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        // Configuramos la solicitud
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? APIError.failedTogetData))
                return
            }
            
            do {
                // Parseamos la respuesta
                let result = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                
                // Obtenemos el primer video
                guard let firstItem = result.items.first else {
                    completion(.failure(APIError.noResultsFound))
                    return
                }
                
                // Devolvemos el ID del video
                let videoId = firstItem.id.videoId
                completion(.success(videoId))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
