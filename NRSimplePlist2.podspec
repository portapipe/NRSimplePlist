Pod::Spec.new do |s|
  s.name         = "NRSimplePlist"
  s.version      = "1.0"
  s.summary      = "Easy library to fetch and edit data from and to plists on the fly (XCode)"
  s.homepage     = "https://github.com/portapipe/NRSimplePlist"
  s.license      = { :type => 'Apache', :file => 'LICENSE' }
  s.author       = { "Norman Russo" => "portapipe@gmail.com" }
  s.source       = { :git => "https://github.com/portapipe/NRSimplePlist.git"}
  s.platform     = :ios, '5.0'
  s.source_files = 'NRSimplePlist'
  s.requires_arc = true

end
