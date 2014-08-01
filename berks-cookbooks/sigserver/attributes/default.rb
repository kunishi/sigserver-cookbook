default['sigserver']['version'] = '2.2.2'
default['sigserver']['tgz_checksum'] = '4b10af5c08f4f70582f5ee7d9db6a1f7bb8ab876b1b814588007b58033764e09'
default['sigserver']['install_prefix'] = '/usr/local'
default['sigserver']['jdk_include_path'] = '/usr/lib/jvm/java-6-openjdk-i386/include'
default['sigserver']['libjvm_path'] = '/usr/lib/jvm/java-6-openjdk-i386/jre/lib/i386/server'
default['sigserver']['julius_path'] = '/usr/bin/julius'
default['sigserver']['dictkit_path'] = "/usr/local/share/dictation-kit-v#{node['julius']['dictkit_version']}"
