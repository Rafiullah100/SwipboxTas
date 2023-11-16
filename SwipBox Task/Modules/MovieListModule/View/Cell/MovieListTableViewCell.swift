//
//  MovieListTableViewCell.swift
//  SwipBox Task
//
//  Created by MacBook Pro on 11/15/23.
//

import UIKit
import SDWebImage

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    static let nibName = "MovieListTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var movieData: MovieResult?{
        didSet{
            print(Route.baseUrl + (movieData?.posterPath ?? ""))
            movieNameLabel.text = movieData?.originalTitle
            thumbnailImageView.sd_setImage(with: URL(string: Route.imageBaseUrl + (movieData?.posterPath ?? "")), placeholderImage: UIImage(named: "placeholder"))
        }
    }
}
