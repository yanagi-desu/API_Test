//
//  MainView.swift
//  Wantedly_Test
//
//  Created by Bofan Yang on 2021/03/02.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var publisher = dataPublisher(url:"https://www.wantedly.com/api/v1/projects?q=swift&page=1")
    private let toolbarColor = UIColor(named:"TimelineThreadToolBarColor")
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(publisher.openJobs){each in
                    let imgCache = publisher.ImageCache[each.id]!
                    BlockView(job: each,
                              img: imgCache["i_255_70"]!,
                              imageCache: publisher.ImageCache,
                              companyAvatar: publisher.CompanyAvatar
                    )
                    .shadow(radius: 3.0)
                    .padding(.all,16)
//                    Text(each.title).padding(.leading,5)
//                    Image(uiImage: publisher.ImageCache[each.id]!)
                }
            } .navigationBarTitle("Wantedly")
        }
        .navigationBarColor(backgroundColor: toolbarColor!, tintColor:.white, scrollEdgeColor: toolbarColor!)
    }
}


struct BlockView: View{
    let job: jobData
    let img: UIImage
    let imageCache:[Int:[String:UIImage]]
    let companyAvatar:[Int:[String:UIImage]]
    
    var body: some View{
        NavigationLink(
            destination: CardDetailView(job:job, company: job.company, imageCache: imageCache,companyAvatar:companyAvatar)
        ){
            ZStack{
                RoundedRectangle(cornerRadius: 20,style: .continuous)
                    .fill(Color.white)
                HStack{
                    //First hald of the block, containing Title and intro image
                    VStack(alignment:.leading){
                        Text(job.title).font(.body)
                        Image(uiImage: img).cornerRadius(5.0)
                    }
                    //Second half of the block, containing company info
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "person.3")
                            Text(String(job.staffings_count))
                                .font(.footnote)
                                .truncationMode(.tail)
                        }.padding(.bottom,3)
                        HStack{
                            Image(systemName: "location")
                            Text(job.company.address_prefix)
                                .frame(width:70)
                                .font(.footnote)
                                .truncationMode(.tail)
                        }.padding(.bottom,3)
                        HStack{
                            Image(systemName: "building")
                            Text(job.company.founded_on)
                                .font(.footnote)
                                .truncationMode(.tail)
                        }
                    }
                }.padding(10)
            }
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
