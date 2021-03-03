//
//  gerData.swift
//  Wantedly_Test
//
//  Created by Bofan Yang on 2021/02/27.
//

import Foundation
import Combine
import SwiftUI




class dataPublisher: ObservableObject {
    
//    let urlString = "https://www.wantedly.com/api/v1/projects?q=swift&page=1"
    var urlString:String
    @Published var openJobs = [jobData]()
    @Published var ImageCache = [Int:[String:UIImage]]()
    @Published var CompanyAvatar = [Int:[String:UIImage]]()
    
    
    init(url: String) {
        urlString = url
        getJobs()
        getImages()
    }
    
    func getJobs(){
        if let url = URL(string: urlString){
            if let data = try? Data(contentsOf: url){
                print("Data package retrived")
                decode(json: data)
            }
        }
    }
    
    func getImages(){
        let toGetAvatars = ["s_30","s_60","s_100"]
        let toGetImages = ["i_320_131","i_320_131_x2","i_105_130","i_255_70"]
        for each in openJobs {
            //loop to get all avatars
            var companyImageDir = [String:UIImage]()
            for eachKey in toGetAvatars{
                if  let url = URL(string: (each.company.avatar[eachKey]!)){
                    var image: UIImage? = nil
                    do {
                        let data = try Data(contentsOf: url, options: [])
                        image = UIImage(data: data)
                        companyImageDir[eachKey] = image
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
            CompanyAvatar[each.company.id] = companyImageDir
            
            //loop to get all the job images
            var imageDir = [String:UIImage]()
            for eachKey in toGetImages{
                if let url = URL(string: each.image[eachKey]!!){
                     var image: UIImage? = nil
                     do {
                         let data = try Data(contentsOf: url, options: [])
                         image = UIImage(data: data)
                         imageDir[eachKey] = image
                     }
                     catch {
                         print(error.localizedDescription)
                         continue
                     }
                }
            }
            ImageCache[each.id] = imageDir
        }
    }
    
    func decode(json: Data){
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(Results.self, from: json)
            openJobs = decoded.data
            print(openJobs[0].description)
        } catch {
            print("Error happened: \(error)")
        }
    }
}








//            if  let url = URL(string: (each.image["i_255_70"] ?? "None")!){
//                var image: UIImage? = nil
//                do {
//                    let data = try Data(contentsOf: url, options: [])
//                    image = UIImage(data: data)
//                    ImageCache[each.id] = image
//                }
//                catch {
//                    print(error.localizedDescription)
//                }
//            }
