# SignatureUIView
UIView for capturing signature.<br />
![](https://github.com/rajeshpremani/SignatureUIView/blob/main/Example/Assets/sign.gif)


# Installation
SignatureUIView is available through cocoapods. To install it add the following pod in podfile.<br />
```js
pod 'SingatureUIView'
```

# Usage
To see a quick demo, simply open Example project. Or set the custom class of view as SignatureView.
![](https://github.com/rajeshpremani/SignatureUIView/blob/main/Example/Assets/customClass.png)


# Customization
You can customize SignatureView <br />
### Line Color
```js
 self.signatureView.signatureColor(color: .blue)
```

### Line Width
```js
> self.signatureView.signatureLineWidth(lineWidth: 4)
```

### Background Color
```js
self.signatureView.backgroundColor(color: .cyan)
```js

### Corner Radius
> self.signatureView.cornerRadius(radius: 10)

### Border
> self.signatureView.setBorder(withColor: .black, withWidth: 3)

### Line Cap
> self.signatureView.signatureLineCap(lineCap: .round)

### Delete Signature
> self.signatureView.delete()

### Undo Signature
> self.signatureView.undo()

# Get Signature as an image
> self.signatureView.getSignature()

# Delegate
![](https://github.com/rajeshpremani/SignatureUIView/blob/main/Example/Assets/delegate.png)


