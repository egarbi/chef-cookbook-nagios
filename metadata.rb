maintainer        "Opscode, Inc., customized by garbi"
maintainer_email  "quique@enriquegarbi.com.ar"
license           "Apache 2.0"
description       "Installs and configures nagios"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.16.1"

recipe "nagios", "Includes the client recipe."
recipe "nagios::client", "Installs and configures a nagios client with nrpe"
recipe "nagios::server", "Installs and configures a nagios server"

#%w{ apache2 build-essential php }.each do |cb|
#  depends cb
#end

%w{ debian ubuntu redhat centos fedora scientific}.each do |os|
  supports os
end
