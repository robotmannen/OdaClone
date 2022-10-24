//
//  ImageLoader.swift
//  OdaClone
//
//  Created by Thomas Korsnes on 17/10/2022.
//

import Foundation

//Not working, but is only necsessary if iOS 14.0 or earlier is required for app


/*
class ImageLoader: ObservableObject {
    //TODO fix passthroughsubject
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
*/
