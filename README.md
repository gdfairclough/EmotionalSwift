# EmotionalSwift
Swift Wrapper for Microsoft Congitve Services Emotion API

# Usage
This wrapper allows you to easily pull emotional data from the Micorosoft Cogntivie Services Emotion API. 

In order to use the API, you will need to <a href="https://www.microsoft.com/cognitive-services/en-us/emotion-api">sign up for a Micorsoft account</a> and use your account to retrieve an API key. 

This API key will be used to create an `EmotionalDataRequester` object:

```swift
let requester = EmotionalDataRequester(apiKey: key)
```

Once the requester object is created, it will be used to make a request to Microsoft's servers. You must supply image data in 
the call, along with a closure that will allow you to handle the response. 

The requester call looks like this : 

```swift
requester.requestEmotionalData(for : data) { (result) in
            switch result{
            case .success(let faces):
               //work with faces returned by the API 
            case .failure(let error):
               //network request failed with an error
               break
            }
       }
```
        
The array of `Face` structs returned in the success case are sorted by largest face to smallest face, in terms of height and width of the face as calucalted by the API. 

The closure will be called with either a failure result, or a success result. The failure result includes information about 
the reason for the failure. The success results includes an array of `Face` objects that represent the faces in the image 
and the emotional values for each face that were determined by the API. 

Accessing information that was calculated by the API is done through the `Face` struct. 

```swift
face.scores
face.faceRect
```

`scores` will provide the emotional values for the face. The API returns a value between 0.0 and 1.0 for 8 different emotions. 

<li> anger</li>
<li> contempt</li>
<li> disgust</li>
<li> fear</li>
<li> happiness</li>
<li> neutral</li>
<li> sadness</li>
<li> surprise</li>

Each face in the picture provided to the API will get a score for each of the 8 emotions, and these scores are accessed on the `Face` struct `scores` property. 

`faceRect` will provide the positional information for the current `Face` struct, represented by a `FaceRectangle` struct. You will receive 4 pieces of positional information for each face. 

<li> width</li>
<li> height</li>
<li> top</li>
<li> left</li>

You can use these items to determine where each face is located on the picture provided. 

For more information on Microsoft Cognitive Services' Emotion API, and for signing up for authentication keys, visit 
<a href="https://www.microsoft.com/cognitive-services/en-us/emotion-api">Microsoft's website</a>
