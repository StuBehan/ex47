# coding: utf-8
lib = File.expand_path('../lib' __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
    spec.name = "NAME"
    spec.version = "1.0"
    spec.authors = "Stu Behan"
    spec.email = "youremail@yourdomain.com"
    spec.summary = %q{Short summary of project}
    spec.description = %q{Longer description of project}
    spec.hompage = "https://yourprojectdomain.com/"
    spec.license = "MIT"

    spec.files = ['lib/NAME.rb']
    spec.executibles = ['bin/NAME']
    spec.test_files = ['tests/test_NAME.rb']
    spec.require_paths = ['lib']
end