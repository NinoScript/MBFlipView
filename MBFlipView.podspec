Pod::Spec.new do |s|
  s.name         = 'MBFlipView'
  s.version      = '1.0'
  s.summary      = 'Storyboard-friendly flip view.'
  s.homepage     = 'https://github.com/NinoScript/MBFlipView'
  s.license      = { 
    :type => 'MIT', 
    :file => 'LICENSE' 
  }
  s.author       = 'Cristián Arenas'
  s.source       = { 
        :git => 'https://github.com/NinoScript/MBFlipView',
      :tag => s.version.to_s
  }
  s.platform     = :ios, '7.0'
  s.source_files = 'MBFlipView.*'
  s.frameworks = 'UIKit'
  s.requires_arc = true
end
