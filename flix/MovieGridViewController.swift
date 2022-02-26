//
//  MovieGridViewController.swift
//  flix
//
//  Created by Ken Ling on 2/23/22.
//

import UIKit
import AlamofireImage
class MovieGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    

    @IBOutlet weak var collectionView: UICollectionView!
    var movies = [[String:Any]]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            collectionView.delegate = self
            collectionView.dataSource = self
            
            let layout = collectionView.collectionViewLayout as!
                        UICollectionViewFlowLayout
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            let padding: CGFloat =  4
            let collectionViewSize = collectionView.frame.size.width - padding
            layout.itemSize = CGSize(width: collectionViewSize/2, height: collectionViewSize)
//            let width = (view.frame.size.width) / 2
//            layout.itemSize = CGSize(width: width, height: width*1.5)
            
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
                     
                     self.collectionView.reloadData()
                     
                     print(self.movies)
                
                    

                 }
            }
            task.resume()
            // Initialization code
        }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section:Int) -> Int{
        return movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
            "MovieGridCell", for: indexPath) as! MovieGridCell
        
        let movie  = movies[indexPath.item]
        
        let baseUrl = "http://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        
        cell.posterView.af.setImage(withURL: posterUrl!)
        
        return cell
    }
}
   
