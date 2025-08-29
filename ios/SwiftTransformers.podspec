Pod::Spec.new do |s|
  s.name         = 'Transformers'
  s.version      = '0.1.17'
  s.summary      = "State-of-the-art Transformer models for Swift"
  s.homepage     = "https://github.com/huggingface/swift-transformers"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = 'Argmax Inc.'
  s.source       = { :git => "https://github.com/huggingface/swift-transformers.git" }

  s.ios.deployment_target = '16.0'
  s.osx.deployment_target = '13.0'

  s.source_files = "Sources/Transformers/**/*.swift"
  s.swift_version = '5.9'

  # Dependencies nếu có
  s.frameworks = 'Foundation', 'Accelerate'
end
