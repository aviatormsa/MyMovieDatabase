//
//  Network.swift
//  MyMovieDatabase
//
//  Created by macbook pro on 23.12.2021.
//

import Foundation
import Alamofire

class Network {
    
    static func getMovieData(completionHandler: @escaping (MovieResponse)->(), errorHandler: @escaping (String)->()){
        AF.request("https://api.themoviedb.org/3/movie/top_rated?api_key=0bb1276cb29f9859fafb3556afb048ce").responseDecodable { (response:AFDataResponse<MovieResponse>) in
            switch response.result{
                case .success(let movieResponse):
                completionHandler(movieResponse)
                case .failure(let error):
                errorHandler(error.localizedDescription)
                    print(error)
                break
            }
            
        }
      
    }
    
}

