//
//  MovieDetailsViewController.swift
//  flix
//
//  Created by Ken Ling on 2/22/22.
//

import UIKit
import AlamofireImage
class MovieDetailsViewController: UIViewController {

    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var synopsisLable: UILabel!
    var movie: [String:Any]!
    
    override func viewDidLoad() {
        
            super.viewDidLoad()
        print(movie["title"])
        
        titleLable.text = movie["title"] as? String
        titleLable.sizeToFit()
        synopsisLable.text = movie["overview"] as? String
        synopsisLable.sizeToFit()
        
        
        let baseUrl = "http://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        
        posterView.af.setImage(withURL: posterUrl!)
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "http://image.tmdb.org/t/p/w1280" + backdropPath)
        
        
        backdropView.af.setImage(withURL: backdropUrl!)
    }
    }


