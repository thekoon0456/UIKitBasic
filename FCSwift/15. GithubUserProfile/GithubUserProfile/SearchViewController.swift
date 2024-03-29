//
//  SearchViewController.swift
//  GithubUserSearch
//
//  Created by Deokhun KIM on 2023/03/14.
//

import UIKit
import Combine
import Kingfisher //오픈소스 import

class UserProfileViewController: UIViewController {
    
    let network = NetworkService(configuration: .default)
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    @Published private(set) var user: UserProfile?
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        embedSearchControl()
        bind()
    }
    
    private func setupUI() {
        thumbnail.layer.cornerRadius = 80
    }
    
    //Search bar
    private func embedSearchControl() {
        self.navigationItem.title = "Search"
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "cafielo"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    //유저 업데이트시 UI변경
    private func bind() {
        $user
            .receive(on: RunLoop.main) //메인스레드에서
            .sink { [unowned self] result in //변경된 내용 받기
                self.update(result)
            }.store(in: &subscriptions) //var subscriptions에 저장
    }
    
    //updateUI
    private func update(_ user: UserProfile?) {
        guard let user = user else {
            self.nameLabel.text = "n/a" //유저정보가 nil일때
            self.loginLabel.text = "n/a"
            self.followerLabel.text = ""
            self.followingLabel.text = ""
            self.thumbnail.image = nil 
            return
        }
        
        self.nameLabel.text = user.name
        self.loginLabel.text = user.login
        self.followerLabel.text = "follower: \(user.followers)"
        self.followingLabel.text = "following: \(user.following)"
        //imageURL
        //url -> image
        //kingfisher 오픈소스 사용
        self.thumbnail.kf.setImage(with: user.avatarUrl)
    }
}

//서치바 텍스트 변경될때마다 호출됨
extension UserProfileViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text
        print("search: \(keyword)")
    }
}


extension UserProfileViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("button clicked: \(searchBar.text)")
        
        guard let keyword = searchBar.text, !keyword.isEmpty else { return }
        
//        //Resource
//        let base = "https://api.github.com/"
//        let path = "users/\(keyword)"
//        let params: [String: String] = [:]
//        let header: [String: String] = ["Content-Type": "application/json"]
//
//        var urlComponents = URLComponents(string: base + path)!
//        let queryItems = params.map { (key: String, value: String) in
//            URLQueryItem(name: key, value: value)
//        }
//        urlComponents.queryItems = queryItems
//
//        var request = URLRequest(url: urlComponents.url!)
//        header.forEach { (key: String, value: String) in
//            request.addValue(value, forHTTPHeaderField: key)
//        }
        let resource = Resource<UserProfile>(
            base: "https://api.github.com/",
            path: "users/\(keyword)",
            params: [:],
            header: ["Content-Type": "application/json"])
        
//        //NetworkService
        network.load(resource)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                self.user = nil
                print("error: \(error)")
                case .finished: break
                               }
            } receiveValue: { user in
                self.user = user
            }.store(in: &subscriptions)

//        URLSession.shared.dataTaskPublisher(for: request)
//            .tryMap { result -> Data in
//                guard let response = result.response as? HTTPURLResponse,
//                      (200..<300).contains(response.statusCode)
//                else {
//                    let response = result.response as? HTTPURLResponse
//                    let statusCode = response?.statusCode ?? -1
//                    throw NetworkError.responseError(statusCode: statusCode)
//                }
//                return result.data
//            }
//            .decode(type: UserProfile.self, decoder: JSONDecoder())
//            .receive(on: RunLoop.main)
//            .sink(receiveCompletion: { completion in
//                print("completion: \(completion)")
//                switch completion {
//                case .failure(let error):
//                    self.user = nil
//                    print("error: \(error)")
//                case .finished: break
//                }
//            }, receiveValue: { user in
//                self.user = user
//            })
//            .store(in: &subscriptions)
    }
}








