Pod::Spec.new do |s|
s.name         = "FGHUD"
s.version      = "2.2"
s.summary      = "FGHUD is a simple andpretty siwft HUD"
s.homepage     = "https://github.com/Insfgg99x/FGHUD"
s.license      = "MIT"
s.authors      = { "CGPointZero" => "newbox0512@yahoo.com" }
s.source       = { :git => "https://github.com/Insfgg99x/FGHUD.git", :tag => "2.2"}
s.frameworks   = 'Foundation','UIKit'
s.ios.deployment_target = '8.0'
s.source_files = 'FGHUD/*.swift'
s.requires_arc = true
s.dependency     'SnapKit'
end

