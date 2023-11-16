//
//  MovieListViewModel.swift
//  SwipBox Task
//
//  Created by MacBook Pro on 11/15/23.
//

import Foundation

class MovieListViewModel {
    var bindMoviesResultToView: (() -> Void) = { }
    
    var popularMovies: [MovieResult]?{
        didSet{
            bindMoviesResultToView()
        }
    }
    
    init() {
        getMovies()
    }
    
    private func getMovies(){
        _ = URLSession.shared.request(route: .popularMoviesList, method: .get, parameters: ["api_key": Constants.apiKey], model: MovieModel.self) { result in
            switch result {
            case .success(let popularMovies):
                self.popularMovies = popularMovies.results
            case .failure(_):
                self.popularMovies = []
            }
        }
    }
    
    func getMoviesCount() -> Int {
        return self.popularMovies?.count ?? 0
    }
    
    func getMovieResult(_ index: Int) -> MovieResult? {
        guard let movie = self.popularMovies?[index] else { return nil }
        return movie
    }
    
    func getMovieID(at index: Int) -> Int? {
        let movieID = self.popularMovies?[index].id
        print(self.popularMovies?[index])
        return movieID
    }
}
