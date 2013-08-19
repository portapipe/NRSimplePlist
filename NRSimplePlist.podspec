Pod::Spec.new do |s|
  s.name         = "NRSimplePlist"
  s.version      = "1.0"
  s.summary      = "Library that wraps Core Data for iOS for easier and more readable operations."
  s.homepage     = "https://github.com/portapipe/NRSimplePlist"
  s.license      = 'MIT'
  s.author       = { "Jesper Skrufve" => "jesper@neolo.gy" }
  s.source       = { 
					:git => "https://github.com/portapipe/NRSimplePlist.git", 
					:tag => s.version.to_s
					}
  s.platform     = :ios, '5.0'
  s.source_files = '*'
  s.framework    = 'Foundation'
  s.requires_arc = true
end
