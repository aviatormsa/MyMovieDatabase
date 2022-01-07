//
//  MoviesCell.swift
//  MyMovieDatabase
//
//  Created by macbook pro on 23.12.2021.
//

import UIKit

class MovieListCell: UITableViewCell {

    @IBOutlet weak var imageBackdropPath: UIImageView!
    @IBOutlet weak var labelOriginalTitle: UILabel!
    @IBOutlet weak var labelReleaseDate: UILabel!
    @IBOutlet weak var labelVote: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

