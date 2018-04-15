//
//  ServicesImpl.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-05.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import Foundation
import UIKit
class ServicesImpl {
    static let Instance = ServicesImpl()
    let baseURL = "http://192.168.1.4:8000/"
    fileprivate init() {
    }
    
    func getHomeAsync(completed: @escaping (Home) -> ()){
        var h : Home = Home()
        //m = HTTP Get All Movies
        let urlString = baseURL + "v1/home.php"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            do{
                h = try JSONDecoder().decode(Home.self, from: data)
                DispatchQueue.main.async {
                    completed(h)
                }
            }catch let jsonErr{
                print("getAllMoviesAsync Error serializing json: ", jsonErr)
            }
            
            }.resume()
    }
    func getAllMoviesAsync(completed: @escaping ([Movie]) -> ()){
        var m : [Movie] = []
        //m = HTTP Get All Movies
        let urlString = baseURL + "v1/movies.php"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            do{
                m = try JSONDecoder().decode([Movie].self, from: data)
                DispatchQueue.main.async {
                    completed(m)
                }
            }catch let jsonErr{
                print("getAllMoviesAsync Error serializing json: ", jsonErr)
            }
            
            }.resume()
    }
    func getAllSeriesAsync(completed: @escaping ([Serie]) -> ()){
        var s : [Serie] = []
        //m = HTTP Get All Movies
        let urlString = baseURL + "v1/series.php"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            do{
                s = try JSONDecoder().decode([Serie].self, from: data)
                DispatchQueue.main.async {
                    completed(s)
                }
            }catch let jsonErr{
                print("getAllSeriesAsync Error serializing json: ", jsonErr)
            }
            
            }.resume()
    }
    func getAllAnimesAsync(completed: @escaping ([Anime]) -> ()){
        var a : [Anime] = []
        //m = HTTP Get All Movies
        let urlString = baseURL + "v1/animes.php"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            do{
                a = try JSONDecoder().decode([Anime].self, from: data)
                DispatchQueue.main.async {
                    completed(a)
                }
            }catch let jsonErr{
                print("getAllAnimesAsync Error serializing json: ", jsonErr)
            }
            
            }.resume()
    }
    func getAllMovies() -> ([Movie]) {
        var m : [Movie] = []
        //m = HTTP Get All Movies
        let urlString = "http://192.168.1.4:8000/v1/movies.php"
        guard let url = URL(string: urlString) else {return m}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
            do{
                m = try JSONDecoder().decode([Movie].self, from: data)
            }catch let jsonErr{
                print("Error serializing json: ", jsonErr)
            }
            
            }.resume()
        return m
    }
    
    func getAllAnimes() -> [Item] {
        var a : [Item] = []
        //m = HTTP Get All Animes
        a.append(Item(itemId: Int64(1), itemTitle: "Naruto Shippidden", itemDesc: "Naruto Shippidde", itemRating: 10, itemImage: "http://www.icekwatch.com/film/Mickeys Chritmas Carol 1983/Mickeys Chritmas Carol 1983IMG.jpg", itemMediaURL: "http://www.icekwatch.com/film/Mickeys Chritmas Carol 1983/Mickeys Chritmas Carol 1983.m3u8", itemType: "Test"))
        return a
        
    }
    
    func getAllSeries() -> [Item] {
        var s : [Item] = []
        //m = HTTP Get All Series
        s.append(Item(itemId: Int64(1), itemTitle: "Silicon Valley", itemDesc: "Silicon Valley", itemRating: 3, itemImage: "Test", itemMediaURL: "http://www.icekwatch.com/film/Mickeys Chritmas Carol 1983/Mickeys Chritmas Carol 1983.m3u8", itemType: "Test"))
        return s
    }
    
}
