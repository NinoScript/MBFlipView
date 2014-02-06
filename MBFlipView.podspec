Pod::Spec.new do |s|
  s.name         = 'MBFlipView'
  s.version      = '1.0.1'
  s.license      = 'MIT'
  s.summary      = 'Storyboard-friendly flip view.'
  # s.homepage     = 'https://github.com/NinoScript/MBFlipView'
  s.author       = 'Cristián Arenas'
  # s.source       = {:git => s.homepage, :tag => s.version.to_s}
  s.platform     = :ios, '6.1'
  s.source_files = 'MBFlipView/*'
  s.requires_arc = true
end
