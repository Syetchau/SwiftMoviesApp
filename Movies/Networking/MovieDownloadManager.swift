//
//  MovieDownloadManager.swift
//  Movies
//
//  Created by LiewSyetChau on 2/3/22.
//

import SwiftUI

final class MovieDownloadManager: ObservableObject {
    
    @Published var movies = [Movie]()
    @Published var cast = [Cast]()
    
    static var baseURL = "https://api.themoviedb.org/3/movie/"
    
    func getNowPlaying() {
        getMovies(movieURL: .nowPlaying)
    }
    
    func getPopular() {
        getMovies(movieURL: .popular)
    }
    
    func getUpcoming() {
        getMovies(movieURL: .upcoming)
    }
    
    func getCast(for movie: Movie) {
        let urlString = "\(Self.baseURL)\(movie.id ?? 100)/credits?api_key=\(API.key)&language=en-US"
        
        NetworkManager<CastResponse>.fetch(from: urlString) { (result) in
            switch result {
            case .success(let castResponse):
                self.cast = castResponse.cast
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getMovies(movieURL: MovieURL) {
        NetworkManager<MovieResponse>.fetch(from: movieURL.urlString) { (result) in
            switch result {
            case .success(let movieResponse):
                self.movies = movieResponse.results
            case .failure(let error):
                print(error)
            }
        }
    }
}
