vagrant-hadoop-cluster
======================

Deploying hadoop in a virtualized cluster in simple steps

These are the files that support the blogpost http://cscarioni.blogspot.co.uk/2012/09/setting-up-hadoop-virtual-cluster-with.html

For using them.

Simply clone the repository, then

`gem install vagrant `

Maybe generate your own ssh-keygen pair of keys.. and replace them in the files id_rsa and id_rsa.pub in the modules/hadoop/files directory. Or for testing copy the provided `id_rsa` and `id_rsa.pub` into your `.ssh` directory.


`vagrant up`

then 

`vagrant ssh master`

'cd /home/vagrant/hadoop-2.7.1'

'bin/hdfs namenode –format'

'sbin/start-dfs.sh'

'sbin/start-yarn.sh'
