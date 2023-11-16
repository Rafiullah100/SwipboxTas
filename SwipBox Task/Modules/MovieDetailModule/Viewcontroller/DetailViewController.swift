//
//  DetailViewController.swift
//  SwipBox Task
//
//  Created by MacBook Pro on 11/16/23.
//

import UIKit
import SDWebImage
class DetailViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collapsableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var viewModel: MovieDetailViewModel!
    var movieID: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MovieDetailViewModel(movieID: movieID)
        bindDetail()
    }
    
    private func bindDetail(){
        viewModel.bindMovieDetailToView = { [unowned self] in
            self.updateUI()
        }
    }
    
    private func updateUI(){
        headerLabel.text = viewModel.getMovieName()
        coverImageView.sd_setImage(with: viewModel.getImage(), placeholderImage: UIImage(named: "placeholder"))
        companyLabel.text = viewModel.getProductionName()
        languageLabel.text = viewModel.getLanguage()
        statusLabel.text = viewModel.getStatus()
        textView.text = viewModel.getOverview()
    }
}
