## What Flower
[![Swift 5](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://swift.org)

<img src="https://media.tenor.com/images/97185aa275e3171e27ac01eb0a5dc756/tenor.gif" width="30%" height="auto">

Application for flower classification with using Vision and CoreML frameworks. Can identify the flower from the photo taken by iPhone's camera. Also added a functionality that return the wikipedia info as well as the pic. 
The app allows to open the Wikipedia page with an article in a browser.


## Features
- Determining the type of flower from a photo
- Open the Wikipedia page in a browser.


## Model
This demo is based on [Caffe CNNs for the Oxford 102 flower dataset](https://github.com/jimgoo/caffe-oxford102), which was converted to CoreML model using coremltools python package. 


## Installation
1. Download the repository

`git clone https://github.com/Alina-Petrovskaya/WhatFlower.git`

2. Go to app's directory

`cd WhatFlower`

3. Install the CocoaPods dependencies

`pod install`

4. Open project

`open WhatFlower.xcworkspace/`

5. Download the [CoreMl model](https://drive.google.com/file/d/1zUyKD1__ukChKjm_EhXz_zPfjcSMH9QG/view?usp=sharing) and add the file to "Resourses" folder in the project's directory.

6. Build the project and run it on a simulator or a device.




## 3rd Party Libraries
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)
- [SDWebImage](https://github.com/SDWebImage/SDWebImage)


## References
- [Apple Machine Learning](https://developer.apple.com/machine-learning/)
- [Vision Framework](https://developer.apple.com/documentation/vision)
- [CoreML Framework](https://developer.apple.com/documentation/coreml)
- [Coremltools](https://pypi.org/project/coremltools/)
