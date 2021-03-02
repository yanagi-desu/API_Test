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
        for each in openJobs {
            //loop to get all avatars
            var companyImageDir = [String:UIImage]()
            for eachAvatarUrl in each.company.avatar{
                if  let url = URL(string: (eachAvatarUrl.value)){
                    var image: UIImage? = nil
                    do {
                        let data = try Data(contentsOf: url, options: [])
                        image = UIImage(data: data)
                        companyImageDir[eachAvatarUrl.key] = image
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
            CompanyAvatar[each.company.id] = companyImageDir
            //loop to get all the job images
            var imageDir = [String:UIImage]()
            for eachImageUrl in each.image{
                if let temp_url = eachImageUrl.value{
                    if let url = URL(string: temp_url){
                        var image: UIImage? = nil
                        do {
                            let data = try Data(contentsOf: url, options: [])
                            image = UIImage(data: data)
                            imageDir[eachImageUrl.key] = image
                        }
                        catch {
                            print(error.localizedDescription)
                            continue
                        }
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
