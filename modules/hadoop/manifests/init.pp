class hadoop {

exec { 
    "download_hadoop":
    command => "wget -O /vagrant/${hadoop_archive} ${hadoop_archive_url}",
    path => $path,
    user => $user,
    group => $user,
    unless => "ls /vagrant/${hadoop_archive}",
    require => Package["openjdk-6-jdk"]
}

exec { "unpack_hadoop" :
  command => "tar -zxf /vagrant/${hadoop_archive} -C ${install_dir}",
  path => $path,
  user => $user,
  group => $user,
  creates => "${hadoop_home}-1.2.1",
  require => Exec["download_hadoop"]
}
file {
  "${hadoop_home}-1.2.1/conf/slaves":
  content => template('hadoop/slaves'),
  mode => 644,
  owner => $user,
  group => $user,
  require => Exec["unpack_hadoop"]
 }
 
file {
  "${hadoop_home}-1.2.1/conf/masters":
  content => template('hadoop/masters'),
  mode => 644,
  owner => $user,
  group => $user,
  require => Exec["unpack_hadoop"]
 }

file {
  "${hadoop_home}-1.2.1/conf/core-site.xml":
  content => template('hadoop/core-site.xml'),
  mode => 644,
  owner => $user,
  group => $user,
  require => Exec["unpack_hadoop"]
 }
 
file {
  "${hadoop_home}-1.2.1/conf/mapred-site.xml":
  content => template('hadoop/mapred-site.xml'),
  mode => 644,
  owner => $user,
  group => $user,
  require => Exec["unpack_hadoop"]
 }
 
 file {
  "${hadoop_home}-1.2.1/conf/hdfs-site.xml":
  content => template('hadoop/hdfs-site.xml'),
  mode => 644,
  owner => $user,
  group => $user,
  require => Exec["unpack_hadoop"]
 }
 
  file {
  "${hadoop_home}-1.2.1/conf/hadoop-env.sh":
  content => template('hadoop/hadoop-env.sh'),
  mode => 644,
  owner => $user,
  group => $user,
  require => Exec["unpack_hadoop"]
 }
}
