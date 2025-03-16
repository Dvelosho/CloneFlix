//
//  APICaller.swift
//  ClonFlix
//
//  Created by daniel veloso on 03-03-25.
//

import Foundation

enum APIError: Error {
    case failedTogetData
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
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "https://api.themoviedb.org/3/search/\(query)") else {
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
}
