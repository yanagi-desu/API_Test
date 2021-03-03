//
//  CardDetailView.swift
//  Wantedly_Test
//
//  Created by Bofan Yang on 2021/03/02.
//

import SwiftUI

struct CardDetailView: View {
    
    let job: jobData
    //Company info
    let company: Company
    
    let imageCache:[Int:[String:UIImage]]
    let companyAvatar:[Int:[String:UIImage]]
    
    @State var expandCompanyOverView = false
    var body: some View {
        ScrollView{
            VStack{
                JobOverView(content:job.description)
                    .cornerRadius(10.0)
                    .padding()
                let company_image_dic = companyAvatar[company.id]
                let normal_image_dic = imageCache[job.id]
                if expandCompanyOverView{
                    if let image = normal_image_dic?["i_320_131_x2"]{
                        companyExpandView(company: company, avatar: image)
                            .cornerRadius(10.0)
                            .padding()
                            .onTapGesture {
                                withAnimation {expandCompanyOverView.toggle()}
                            }
                    }else{
                        Text("Avatar Retriever failed")
                    }
                }else{
                    if let image = company_image_dic?["s_100"]{
                        CompanyOverView(company: company,avatar: image)
                            .frame(width:400,height:160)
                            .cornerRadius(10.0)
                            .padding()
                            .onTapGesture {
                                withAnimation {expandCompanyOverView.toggle()}
                            }
                    }else{
                        Text("Avatar Retriever failed")
                    }
                }
                Button("Apply"){
                    print("Dummy button")
                }
                .frame(width: 400, height: 80, alignment: .center)
                .background(Color("TimelineThreadToolBarColor"))
                .foregroundColor(.white)
                .font(.largeTitle)
                .cornerRadius(10.0)
            }
        }
    }
}



struct CompanyOverView: View{
    let company:Company
    let avatar: UIImage
    var body: some View{
        ZStack{
            Color(.gray)
            HStack(alignment:.center){
                Image(uiImage: avatar)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .cornerRadius(20.0)
                
                VStack(alignment: .leading, spacing: 8){
                    HStack{
                        Image(systemName: "location")
                        Text("Name:\(company.name)")
                            .lineLimit(1)
                            .font(.footnote)
                    }
                    HStack{
                        Image(systemName: "location")
                        Text("Size: \(company.payroll_number)")
                            .lineLimit(1)
                            .font(.footnote)
                    }
                    HStack{
                        Image(systemName: "location")
                        Text("Url: \(company.url)")
                            .lineLimit(2)
                            .font(.footnote)
                    }
                }
                
                VStack(alignment: .leading, spacing: 8){
                    HStack{
                        Image(systemName: "location")
                        Text("Founder:\(company.founder)")
                            .lineLimit(1)
                            .font(.footnote)
                    }
                    HStack{
                        Image(systemName: "location")
                        Text("Found on: \(company.founded_on)")
                            .lineLimit(1)
                            .font(.footnote)
                    }
                    HStack{
                        Image(systemName: "location")
                        Text("Location: \(company.address_prefix)")
                            .lineLimit(2)
                            .font(.footnote)
                    }
                }
            }
        }.cornerRadius(5.0)
    }
}


struct companyExpandView: View{
    let company:Company
    let avatar: UIImage
    var body: some View{
        ZStack{
            Color(.gray)
            VStack(alignment:.leading, spacing: 12){
                Image(uiImage: avatar)
                    .resizable()
                    .scaledToFill()
                    .padding(.bottom,8)
                    .frame(width: 390, height: 131)
                
                HStack{
                    Image(systemName: "location")
                    Text("Company name:\(company.name)")
                        .lineLimit(1)
                        .font(.footnote)
                }
                
                expandRowElement(
                    first_iconName: "location",
                    second_iconName: "location",
                    firstText: "Company size: \(company.payroll_number)",
                    secondText: "Founded on: \(company.founded_on)"
                )
            
                
                VStack(alignment: .leading, spacing: 12){
                    HStack{
                        Image(systemName: "location")
                        Text("Location:\(company.address_prefix)")
                            .lineLimit(1)
                            .font(.footnote)
                    }
                    HStack{
                        Image(systemName: "location")
                        Text("Url: \(company.url)")
                            .lineLimit(1)
                            .font(.footnote)
                    }
                }
            }
        }
    }

    struct expandRowElement:View{
    let first_iconName, second_iconName:String
    let firstText, secondText: String
    var body: some View{
        HStack{
            Image(systemName: first_iconName)
            Text(firstText)
                .lineLimit(1)
                .font(.footnote)
                .frame(width:160,alignment: .leading)
            Image(systemName: second_iconName)
            Text(secondText)
                .lineLimit(1)
                .font(.footnote)
                .frame(width:160,alignment: .leading)
        }
    }
}

}

struct JobOverView:View{
    let content: String
    @State var expandText: Bool = false
    var body: some View{
        VStack(alignment:.leading, spacing:10){
            Text("Overview:").font(.title2)
            Text(content)
                .font(.body)
                .padding(.horizontal,5)
                .lineLimit(expandText ? nil:3)
                .onTapGesture {
                    withAnimation {expandText.toggle()}
                }
            Button(action:{
                withAnimation{
                    expandText.toggle()
                        }},
                   label: {
                    Text(expandText ? "Shrink":"Expand")
                        .lineLimit(1)
                        .foregroundColor(.blue)
                   })
            }.padding()
        }
    }

//struct CardDetailView_Previews: PreviewProvider {
//    static var previews: some View {
////        let demoString = "20歳で役者を目指し専門学校に入学。\nもともと極度の人見知りだった為苦労するが、卒業舞台の主演を務めるまでに成長でき、友人からも性格が明るくなったと言われるように。"
////        JobOverView(content: demoString)
////        CompanyOverView()
////        companyExpandView()
//
//    }
//}
