//
//  MainViewController.swift
//  MyMovieDatabase
//
//  Created by macbook pro on 22.12.2021.
//

import UIKit
import Alamofire
import Kingfisher

class MainViewController: UIViewController {

    @IBOutlet weak var moviesList: UITableView!
    
    var movieResponse: MovieResponse?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.moviesList.delegate = self
        self.moviesList.dataSource = self
    
            Network.getMovieData { response in
                self.movieResponse = response
                self.moviesList.reloadData()
           } errorHandler: { error in
               print (error)
           }
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
        
}
    
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return movieResponse?.results?.count ?? 0
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            var movie = movieResponse?.results?[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for:indexPath) as! MovieListCell
            
            if let backdropPath = movie?.backdropPath, let labels = movie {
                cell.imageBackdropPath.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath)"))
                cell.labelVote.text = "\(labels.voteAverage!)/10"
                cell.labelOriginalTitle.text = "\(labels.originalTitle!)"
                cell.labelReleaseDate.text = "\(labels.releaseDate!)"
            }
            cell.selectionStyle = .none
            return cell
            
        }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = movieResponse?.results?[indexPath.row]
        performSegue(withIdentifier: "goToDetailedViewController", sender: row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetailedViewController" {
            let destinationVC = segue.destination as! DetailedViewController
            destinationVC.movieDetailed = sender as? Result
        }
    
    }
    
    }

            
