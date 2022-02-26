//
//  MovieGridViewController.swift
//  flix
//
//  Created by Ken Ling on 2/23/22.
//

import UIKit

class MovieGridViewController: UIViewController {

        var movies = [[String:Any]]()
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            let url = URL(string: "https://api.themoviedb.org/3/movie/634649/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
            let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            let task = session.dataTask(with: request) { [self] (data, response, error) in
                 // This will run when the network request returns
                 if let error = error {
                        print(error.localizedDescription)
                 } else if let data = data {
                        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                     
                        self.movies = dataDictionary["results"] as! [[String:Any]]
                     
                     print(self.movies)
                
                    

                 }
            }
            task.resume()
            // Initialization code
        }
}
   
