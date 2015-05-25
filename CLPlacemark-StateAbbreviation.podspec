Pod::Spec.new do |s|
  s.name         = 'CLPlacemark-StateAbbreviation'
  s.version      = '0.1.0'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage     = "https://github.com/jweyrich/#{s.name}"
  s.author       = { 'Jardel Weyrich' => 'jweyrich@gmail.com' }
  s.summary      = '...'
  s.source       = { :git => "https://github.com/jweyrich/#{s.name}.git",
                     :tag => "v#{s.version}" }
  s.source_files = 'Classes/**/*.{h,m}'
  s.public_header_files = 'Classes/**/*.h'
  s.resource     = "#{s.name}.plist"
  s.platform     = :ios, '5.0'
  s.framework    = 'CoreLocation'
  s.ios.deployment_target = '5.0'
  s.requires_arc = true
end
