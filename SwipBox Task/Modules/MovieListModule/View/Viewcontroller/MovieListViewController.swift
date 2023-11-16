//
//  MovieListViewController.swift
//  SwipBox Task
//
//  Created by MacBook Pro on 11/15/23.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!{
        didSet{
            self.movieTableView.delegate = self
            self.movieTableView.dataSource = self
            self.movieTableView.register(UINib(nibName: MovieListTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: MovieListTableViewCell.cellReuseIdentifier())
        }
    }
   
    var viewModel: MovieListViewModel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MovieListViewModel()
        bindMovieResult()
    }
    
    private func bindMovieResult(){
        viewModel.bindMoviesResultToView = { [unowned self] in
            viewModel.getMoviesCount() == 0 ? nil : movieTableView.reloadData()
        }
    }
}


extension MovieListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getMoviesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieListTableViewCell = tableView.dequeueReusableCell(withIdentifier: MovieListTableViewCell.cellReuseIdentifier()) as! MovieListTableViewCell
        cell.movieData = viewModel.getMovieResult(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: DetailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.movieID = viewModel.getMovieID(at: indexPath.row)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
