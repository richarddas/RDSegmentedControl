Pod::Spec.new do |s|
  s.name         = 'RDSegmentedControl'
  s.version      = '0.0.1'
  s.authors      = { 'Richard Das' => 'richard@richarddas.com' }
  s.license 	 = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage     = 'https://github.com/richarddas/RDSegmentedControl'
  s.summary      = 'A custom UIControl for handling a series of UIControls separated by a UIImage separator.'
  s.source       = { :git => 'https://github.com/richarddas/RDSegmentedControl.git', :commit => "4900b06e8f70b3b412d016d5eea5fe458edd61f3" }
  s.source_files = "RDSegmentedControl/Classes/*.*"
  s.platform     = :ios
end

#, :tag => "#{s.version}"