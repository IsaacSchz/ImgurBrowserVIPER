//
//  ImagesBrowserViewController.swift
//  ImgurImagesVIPER
//
//  Created by Isaac Sanchez on 04/08/20.
//  Copyright © 2020 Isaac Sanchez. All rights reserved.
//

import UIKit

class ImagesBrowserViewController: UIViewController {

    // MARK: - IBOUTLETS
    @IBOutlet weak var emptyStateView: UIView?
    @IBOutlet weak var searchBar: UISearchBar?
    @IBOutlet weak var postsTableView: UITableView?
    
    // MARK: - VARIABLES
    var presenter: ImagesBrowserPresenterProtocol?
    var posts: [ImgurPostCellPresenter]? {
        didSet {
            postsTableView?.reloadData()
        }
    }

    // MARK: - VIEW CONTROLLER
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar?.delegate = self
        presenter?.updatePosts(with: "")
        setupTableView()

    }
    
    
    // MARK: - FUNCTIONS
    
    func setupTableView() {
        postsTableView?.tableFooterView = UIView()
        postsTableView?.dataSource = self
        postsTableView?.delegate = self
        postsTableView?.register(UINib(nibName: "ImgurPostCell", bundle: nil), forCellReuseIdentifier: "ImgurPostCell")

    }

}

extension ImagesBrowserViewController: ImagesBrowserViewProtocol {

    func showNetworkingError() {
        let alertController = UIAlertController(title: "Network Error", message: "Check your internet connection", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}


// MARK: - SEARCH BAR DELEGATE

extension ImagesBrowserViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText.isEmpty else { return }
        presenter?.updatePosts(with: "")
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        presenter?.updatePosts(with: searchBar.text ?? "")
    }
    
}


// MARK: - TABLE VIEW

extension ImagesBrowserViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImgurPostCell", for: indexPath) as? ImgurPostCell else { return UITableViewCell() }
        
        guard let postInfo = posts?[indexPath.row] else { return UITableViewCell() }
        postInfo.setView(cell)
        postInfo.downloadImageData()
    
        let tableViewWidth = Float(tableView.bounds.size.width)
        let cellHeight = postInfo.getCellHeight(for: tableViewWidth)
        cell.hConstraint.constant = CGFloat(cellHeight)
        cell.layoutIfNeeded()
        
        return cell
    }
  
}

extension ImagesBrowserViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let post = posts?[indexPath.row] else { return }
        let postId = post.postId
        let postImageData = post.imageData
        let imageDetailView = ImageDetailWireframe(postId, postImageData)
        
        self.navigationController?.pushWireframe(imageDetailView, animated: true)
        
    }
    
}
