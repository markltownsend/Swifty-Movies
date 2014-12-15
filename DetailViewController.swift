//
//  DetailViewController.swift
//  Swiftest
//
//  Created by Mark on 6/3/14.
//  Copyright (c) 2014 Mark. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var movie : Movie?

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var directorsLabel: UILabel!
    @IBOutlet var plotLabel: UILabel!
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupUI() {
        if let localMovie = movie {
            titleLabel.text = localMovie.title;
            title = localMovie.title
            plotLabel.text = localMovie.plot
            var error : NSError?
            let url = NSURL.URLWithString(localMovie.posterUrlString)
            var request : NSURLRequest = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                if !(error? != nil) {
                    self.imageView.image = UIImage(data:data)
                }
            })
        }
    }
}
