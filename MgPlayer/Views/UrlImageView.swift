//
//  UrlImageView.swift
//  CupcakeCorner
//
//  Created by Michel Garlandat on 26/08/2020.
//

import SwiftUI

struct UrlImageView: View {
    @ObservedObject var urlImageModel: UrlImageModel
    
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
            .resizable()
            .scaledToFit()
//            .frame(width: 100, height: 100)
        
    }
    
    static var defaultImage = UIImage(systemName: "photo")
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: "https://is2-ssl.mzstatic.com/image/thumb/Music123/v4/6e/db/f5/6edbf5a8-b990-8f89-af12-8cc464f03da1/source/30x30bb.jpg")
    }
}
