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
    
    var body: some View {
        ScrollView{
            VStack{
                let image_dic = companyAvatar[company.id]
                if let image = image_dic?["original"]{
                    CompanyOverView(company: company,avatar: image)
                }else{
                    Text("Avatar Retriever failed")
                }
                Divider()
                JobOverView(content:job.description)
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
            HStack{
                Image(uiImage: avatar)
                    .frame(width: 30, height: 30, alignment: .leading)
                    
                Text("Name:\(company.name)")
            }
        }.cornerRadius(5.0)
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

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let demoString = "20歳で役者を目指し専門学校に入学。\nもともと極度の人見知りだった為苦労するが、卒業舞台の主演を務めるまでに成長でき、友人からも性格が明るくなったと言われるように。"
        JobOverView(content: demoString)
    }
}
