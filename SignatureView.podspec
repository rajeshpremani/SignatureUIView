
Pod::Spec.new do |spec|

  spec.name         = "SignatureView"
  spec.version      = "1.0.0"
  spec.summary      = "This is best framework for capturing signature."
  spec.description  = "SignatureView is a lightweight, fast and customizable option for capturing signatures within your application. You can retrieve the signature as a UIImage."
  spec.homepage     = "https://github.com/rajeshpremani/SignatureView"
  spec.license      = "MIT"
  spec.author             = { "Rajesh Kumar" => "rajeshpremani68@gmail.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/rajeshpremani/SignatureView.git", :tag => spec.version.to_s }
  spec.source_files  = "SignatureView/**/*.{swift}"
  spec.swift_versions = "5.0"
end
