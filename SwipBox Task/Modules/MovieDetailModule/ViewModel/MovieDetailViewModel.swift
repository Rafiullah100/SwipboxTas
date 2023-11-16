//
//  MovieDetailViewModel.swift
//  SwipBox Task
//
//  Created by MacBook Pro on 11/16/23.
//

import Foundation

class MovieDetailViewModel {
    var bindMovieDetailToView: (() -> Void) = { }
    var movieID: Int?
    
    var movieDetail: MovieDetailModel?{
        didSet{
            bindMovieDetailToView()
        }
    }
    
    init(movieID: Int) {
        self.movieID = movieID
        getMovies()
    }
    
    private func getMovies(){
        _ = URLSession.shared.request(route: .movieDetail(movieID ?? 0), method: .get, parameters: ["api_key": Constants.apiKey], model: MovieDetailModel.self) { result in
            switch result {
            case .success(let detailModel):
                self.movieDetail = detailModel
            case .failure(_):
                self.movieDetail = nil
            }
        }
    }
    
    func getImage() -> URL? {
        guard let imageString = movieDetail?.posterPath else { return nil }
        return URL(string: Route.imageBaseUrl + imageString)
    }
    
    func getProductionName() -> String {
        return self.movieDetail?.productionCompanies?.first?.name ?? ""
    }
    
    func getLanguage() -> String {
        return self.movieDetail?.spokenLanguages?.first?.englishName ?? ""
    }
    
    func getStatus() -> String {
        return self.movieDetail?.status ?? ""
    }
    
    func getOverview() -> String {
        return self.movieDetail?.overview ?? ""
    }
    
    func getMovieName() -> String {
        return self.movieDetail?.title ?? ""
    }
}
