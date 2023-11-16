//
//  Route.swift
//  Yummie
//
//  Created by Emmanuel Okwara on 30/04/2021.
//

import Foundation

enum Route {
    static let imageBaseUrl = "https://image.tmdb.org/t/p/w185"
    static let baseUrl = "https://api.themoviedb.org"
    case popularMoviesList
    case movieDetail(Int)
    
    var description: String {
        switch self {
        case .popularMoviesList:
            return "/3/movie/popular"
        case .movieDetail(let movieID):
            return "/3/movie/\(movieID)"
         }
    }
}
