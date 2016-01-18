Pod::Spec.new do |s|
  s.name = 'PPParticleButton'
  s.version = '0.0.2'
  s.summary = 'PPParticleButton can particle effect when tapped.'
  s.homepage = 'https://github.com/HIkaruSato/PPParticleButton'
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'HIkaruSato' => 'sato.hikaru.dev@gmail.com' }
  s.platform = :ios, '8.0'
  s.source = { :git => 'https://github.com/HIkaruSato/PPParticleButton.git', :tag => s.version }
  s.source_files  = 'PPParticleButton/*.swift'
  s.framework = 'SpriteKit'
  s.requires_arc = true
end
