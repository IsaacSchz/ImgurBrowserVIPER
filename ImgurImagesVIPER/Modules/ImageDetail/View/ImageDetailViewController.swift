//
//  ImageDetailViewController.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import Foundation
import UIKit

class ImageDetailViewController: UIViewController {
    
    // MARK: - IBOUTLETS
    
    @IBOutlet weak var detailedImageView: UIImageView?
    @IBOutlet weak var commentsTableView: UITableView?
    @IBOutlet weak var noCommentsView: UIView?
    
    
    // MARK: - VARIABLES
    var presenter: ImageDetailPresenterProtocol?
    
    var comments: [ImgurCommentCellPresenter]? {
        didSet {
            commentsTableView?.reloadData()
        }
    }
    
    var postId: String = ""
    var postImageData: Data?
    
    
    // MARK: - VIEW CONTROLLER
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        presenter?.updateComments(with: postId)
        
        guard let data = postImageData else { return }
        detailedImageView?.image = UIImage(data: data)
    }
    
    func setupTableView() {
        commentsTableView?.tableFooterView = UIView()
        commentsTableView?.dataSource = self
        commentsTableView?.delegate = self
        commentsTableView?.register(UINib(nibName: "ImgurCommentCell", bundle: nil), forCellReuseIdentifier: "ImgurCommentCell")
        
    }
    
}

extension ImageDetailViewController: ImageDetailViewProtocol {
    
    func showNoCommentsView() {
        commentsTableView?.isHidden = true
        noCommentsView?.isHidden = false
    }

    func showNetworkingError() {
        let alertController = UIAlertController(title: "Network Error", message: "Check your internet connection", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ImageDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImgurCommentCell", for: indexPath) as? ImgurCommentCell else { return UITableViewCell() }
        
        guard let commentInfo = comments?[indexPath.row] else { return UITableViewCell() }
        commentInfo.setView(cell)
        commentInfo.updateComment()
        
        return cell
    }

}

extension ImageDetailViewController: UITableViewDelegate {
    
}
