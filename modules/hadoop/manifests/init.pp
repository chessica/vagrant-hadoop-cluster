class hadoop {

exec { 
    "download_hadoop":
    command => "wget -O /vagrant/${hadoop_archive} ${hadoop_archive_url}",
    path => $path,
    user => $user,
    group => $user,
    unless => "ls /vagrant/${hadoop_archive}",
    require => Package["openjdk-7-jdk"]
 }

exec { "unpack_hadoop" :
  command => "tar -zxf /vagrant/${hadoop_archive} -C ${install_dir}",
  path => $path,
  user => $user,
  group => $user,
  creates => "${hadoop_home}-2.7.1",
  require => Exec["download_hadoop"]
}

 
file {
  "${hadoop_home}-2.7.1/etc/hadoop/slaves":
  content => template('hadoop/slaves'),
  mode => 644,
  owner => $user,
  group => $user,
  require => Exec["unpack_hadoop"]
 }

file {
  "${hadoop_home}-2.7.1/etc/hadoop/core-site.xml":
  content => template('hadoop/core-site.xml'),
  mode => 644,
  owner => $user,
  group => $user,
  require => Exec["unpack_hadoop"]
 }
 file {
  "${hadoop_home}-2.7.1/etc/hadoop/yarn-site.xml":
  content => template('hadoop/yarn-site.xml'),
  mode => 644,
  owner => $user,
  group => $user,
  require => Exec["unpack_hadoop"]
 }
 
file {
  "${hadoop_home}-2.7.1/etc/hadoop/mapred-site.xml":
  content => template('hadoop/mapred-site.xml'),
  mode => 644,
  owner => $user,
  group => $user,
  require => Exec["unpack_hadoop"]
 }
 
 file {
  "${hadoop_home}-2.7.1/etc/hadoop/hdfs-site.xml":
  content => template('hadoop/hdfs-site.xml'),
  mode => 644,
  owner => $user,
  group => $user,
  require => Exec["unpack_hadoop"]
 }
 
  file {
  "${hadoop_home}-2.7.1/etc/hadoop/hadoop-env.sh":
  content => template('hadoop/hadoop-env.sh'),
  mode => 644,
  owner => $user,
  group => $user,
  require => Exec["unpack_hadoop"]
 }
}
