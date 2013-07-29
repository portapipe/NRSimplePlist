Pod::Spec.new do |s|
  s.name         = "NRSimplePlist"
  s.version      = "0.0.1"
  s.summary      = "Semplice script per recupero dati e modifica da plist."
  s.homepage     = "https://github.com/portapipe/NRSimplePlist"

  s.license      = { :type => 'Apache', :file => 'LICENSE' }
  s.author       = { "Norman Russo" => "portapipe@gmail.com" }
 s.source       = { :git => "https://github.com/portapipe/NRSimplePlist.git",  :commit => "9ba6fb1e6d230ff5c350c95c32beced2f2ec67aa" }
  
  s.platform     = :ios, '5.0'
  s.source_files = '*.{h,m}'
  s.requires_arc = true

end
