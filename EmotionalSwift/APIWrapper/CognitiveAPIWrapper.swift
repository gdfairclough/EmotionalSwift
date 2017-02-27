//
//  CognitiveAPIWrapper.swift
//  EmotionalSwift
//
//  Created by Gerald Fairclough, Jr on 2/26/17.
//  Copyright © 2017 Faircoder. All rights reserved.
//

import Foundation

///Wrapper for creating network request to communicate with Microsoft Cognitive Services
class CognitiveAPIWrapper : NSObject, URLSessionDelegate, URLSessionTaskDelegate, URLSessionDataDelegate {
    private let microsoftEmotionURL = "https://westus.api.cognitive.microsoft.com/emotion/v1.0/recognize"
    private var responseData = Data()
    private var apiKey : String
    private var imageData : Data?
    private var closure : ((Result<[Face]?>) -> Void)?
    
    init(apiKey: String){
        self.apiKey = apiKey
    }
    
    /**
     Create the url session using the provided image data and set the closure that will be used for network success/failure callbacks
     - Parameter imageData: image data to send to Microsoft Cognitive Services 
     - Parameter closure: provides callback for success/failure of network request
    */
    func requestEmotionalData(for imageData: Data, closure : @escaping (Result<[Face]?>) -> Void){
        self.imageData = imageData
        self.closure = closure
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        let task = session.uploadTask(with: request, from: data) //session.uploadTask(withStreamedRequest: request)
        
        task.resume()
        
    }
    
    /**
     Form the request for communicating with cognitive services
    */
    private var request : URLRequest {
        
        guard let emotionServicesURL = URL(string: microsoftEmotionURL) else {
            fatalError("could not create url")
        }
        
        var request = URLRequest(url: emotionServicesURL)
        request.httpMethod = HTTPmethod.POST.rawValue
        request.setValue(ContentType.octetStream.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        request.setValue(Connection.keepAlive.rawValue, forHTTPHeaderField: HTTPHeaderField.connection.rawValue)
        request.setValue(self.apiKey, forHTTPHeaderField: HTTPHeaderField.subscriptionKey.rawValue)
        request.setValue(String(data.count), forHTTPHeaderField: HTTPHeaderField.contentLength.rawValue)
        
        return request
    }
    
    /**
     Perform nil check on image data
    */
    private var data : Data {
        
        guard let imageData = self.imageData else {
            fatalError("unable to create image from UIImage")
        }
        return imageData
    }
    
    /**
     Set the inputStream for the session using the completion handler provided
    */
    func urlSession(_ session: URLSession, task: URLSessionTask, needNewBodyStream completionHandler: @escaping (InputStream?) -> Void) {
        completionHandler(InputStream(data: data))
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if error != nil {
            print()
            self.closure?(.failure(NetworkError.requestFailed(reason: "upload completed with error - \(error). Response data - \(self.responseData))")))
        }else {
            print("upload completed successfully - \(String(data: responseData, encoding: String.Encoding.utf8))")
            //parse response for emotional scores
            let faces = JSONParser.parse(data: responseData)
            self.closure?(.success(faces))
        }
    }
    
    /**
     Chunk of data was sent, this method provides updates on the progress of the task
    */
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        let uploadProgress = Double(totalBytesSent) / Double(totalBytesExpectedToSend)
        print("upload progress ---->  \(uploadProgress * 100)%")
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        print("url session response \(response)")
        completionHandler(URLSession.ResponseDisposition.allow)
    }
    /**
     data was received from the server, so append it the the response data being maintained
    */
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        responseData.append(data)
    }
    
}
