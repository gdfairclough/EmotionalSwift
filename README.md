# EmotionalSwift
Swift Wrapper for Microsoft Congitve Services Emotion API

# Usage
This wrapper allows you to easily pull emotional data from the Micorosoft Cogntivie Services Emotion API. 

In order to use the API, you will need to sign up for a Micorsoft account and use your account to retrieve an API key. 

This API key will be used to create an `EmotionalDataRequester` object:

`let requester = EmotionalDataRequester(apiKey: key)`

Once the requester object is created, it will be used to make a request to Microsoft's servers. You must supply image data in 
the call, along with a closure that will allow you to handle the response. 

The requester call looks like this : 

    requester.requestEmotionalData(for : data) { (result) in
                switch result{
                case .success(let faces):
                   //work with faces returned by the API 
                case .failure(let error):
                    //network request failed with an error
                    break
                }
            }
        


The closure will be called with either a failure result, or a success result. The failure result includes information about 
the reason for the failure. The success results includes an array of `Face` objects that represent the faces in the image 
and the emotional values for each face that were determined by the API. 

Accessing information that was calculated by the API is done through the `Face` object. 

    face.scores
    face.faceRect

`scores` will provide the emotional values for the face. `faceRect` will provide the positional information for the current `Face` object. 


