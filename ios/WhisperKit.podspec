Pod::Spec.new do |s|
  s.name         = 'WhisperKit'
  s.version      = '0.9.0'
  s.summary      = "On-device Speech Recognition for Apple Silicon"
  s.homepage     = "https://github.com/argmaxinc/WhisperKit"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = 'Argmax Inc.'
  s.source       = { :git => "https://github.com/argmaxinc/WhisperKit.git" }
  
  s.ios.deployment_target = '16.0'
  s.osx.deployment_target = '13.0'
  
  s.source_files = "Sources/WhisperKit/**/*.swift"
  s.swift_version = '5.9'
  
  # Dependencies nếu có
  s.frameworks = 'Foundation', 'Accelerate'
end
