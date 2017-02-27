Pod::Spec.new do |spec|
  spec.name = "EmotionalSwift"
  spec.version = "0.0.1"
  spec.summary = "Swift Wrapper for Microsoft Congitve Services Emotion API"
  spec.homepage = "https://github.com/gdfairclough/EmotionalSwift"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Dale Fairclough" => 'gdfairclough@gmail.com'}
  spec.social_media_url = "http://twitter.com/faircoder"

  spec.platform = :ios, "10.0"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/gdfairclough/EmotionalSwift.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "EmotionalSwift/**/*.{h,swift}"

end