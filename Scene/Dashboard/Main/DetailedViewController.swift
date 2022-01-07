//
//  DetailedViewController.swift
//  MyMovieDatabase
//
//  Created by macbook pro on 24.12.2021.
//

import UIKit
import Kingfisher

class DetailedViewController: UIViewController {

    @IBOutlet weak var imgPosterPath: UIImageView!
    @IBOutlet weak var lblOriginalTitle: UILabel!
    @IBOutlet weak var lblVote: UILabel!
    @IBOutlet weak var lblVoteCount: UILabel!
    @IBOutlet weak var lblPopularity: UILabel!
    @IBOutlet weak var txtOverview: UITextView!
    
    var movieDetailed: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let posterPath = movieDetailed?.posterPath, let labels = movieDetailed {
            imgPosterPath.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)"))
            lblOriginalTitle.text = "\(labels.originalTitle!)"
            lblVote.text = "\(labels.voteAverage!)/10"
            lblVoteCount.text = "\(labels.voteCount!)"
            lblPopularity.text = "\(labels.popularity!)"
            txtOverview.text = "\(labels.overview!)"
    }
    
}
    
}

