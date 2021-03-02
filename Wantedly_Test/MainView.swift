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
                    BlockView(title: each.title,
                              img: publisher.ImageCache[each.id]!,
                              companySize: each.company.payroll_number,
                              companyLocation: each.location,
                              foundDate: each.company.founded_on
                    )
                    .shadow(radius: 3.0)
                    .padding(20)
//                    Text(each.title).padding(.leading,5)
//                    Image(uiImage: publisher.ImageCache[each.id]!)
                }
            } .navigationBarTitle("Wantedly")
        }

        .navigationBarColor(backgroundColor: toolbarColor!, tintColor:.white, scrollEdgeColor: toolbarColor!)
    }
}


struct BlockView: View{
    let title:String
    let img: UIImage
    let companySize: Int
    let companyLocation: String
    let foundDate: String
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 20,style: .continuous)
                .fill(Color.white)
            HStack{
                Group{
                    VStack(alignment:.leading){
                        Text(title).font(.body)
                        Image(uiImage: img).cornerRadius(5.0)
                    }
                }
                Spacer().frame(width:15)
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "person.3").frame(width: 3, height: 3).padding(.trailing,6)
                        Text(String(companySize))
                            .font(.footnote)
                            .truncationMode(.tail)
                    }.padding(.bottom,3)
                    HStack{
                        Image(systemName: "building").frame(width: 6, height: 6).padding(.trailing,3)
                        Text(companyLocation)
                            .frame(width:70)
                            .font(.footnote)
                            .truncationMode(.tail)
                    }.padding(.bottom,3)
                    HStack{
                        Image(systemName: "location").frame(width: 6, height: 6).padding(.trailing,3)
                        Text(foundDate)
                            .font(.footnote)
                            .truncationMode(.tail)
                    }
                }
                
            }.padding(5)
            .frame(width: 410, height: 140,alignment: .leading)
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
