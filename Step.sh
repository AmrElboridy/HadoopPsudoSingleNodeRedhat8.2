
#Installing Hadoop Psudo (Single node) on Redhat 8.2

#1. Installation modes (Standalone, Pseudo-distributed and Fully Distributed)
#2.Prerequisites
 #   a. Hadoop user
    useradd -md /home/hadoop hadoop
    chown -R hadoop:hadoop /home/hadoop
    passwd hadoop 
  #  b. JDK
         # Version 2.7 and later of Apache Hadoop requires Java 7 at least. 
         # It is built and tested on both Open JDK and Oracle (HotSpot)'s JDK/JRE
         # Download Oracle JDK source for Linux OS (64-bit) jdk-8u191-linux-x64.tar.gz 
         # and copy it to the hadoop user home directory (/home/hadoop).
    su - hadoop
    tar -zxvf jdk-8u191-linux-x64.tar.gz
        #To check the new java version:
    /home/hadoop/jdk1.8.0_191/bin/java -version
    
    vi ~/.bash_profile
        export JAVA_HOME=/home/hadoop/jdk1.8.0_191/
        export PATH=$PATH: JAVA_HOME/bin
        # Copy “/home/hadoop/jdk1.8.0_191” & “/home/hadoop/.bash_profile” to the other nodes

  #  C. SSH Server (Passwordless)
    su - hadoop
    ssh-key-gen -t rsa
    ssh-copy-id dnode1
    ssh-copy-id dnode2
    ssh-copy-id nnode1
    exit
#3.Hadoop Installation
#   a. Download Hadoop
            tar xzvf hadoop-3.3.1.tar.gz
            mv hadoop-3.3.1 hadoop
            chmod -R 777 /usr/local/hadoop
#   b. Path and Environment Variables
#
            echo "export HADOOP_HOME=/usr/local/hadoop" >> ~/.bashrc
            echo "export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop" >> ~/.bashrc
            echo "export HADOOP_MAPRED_HOME=/usr/local/hadoop" >> ~/.bashrc
            echo "export HADOOP_COMMON_HOME=/usr/local/hadoop" >> ~/.bashrc
            echo "export HADOOP_HDFS_HOME=/usr/local/hadoop" >> ~/.bashrc
            echo "export YARN_HOME=/usr/local/hadoop" >> ~/.bashrc
            echo "export PATH=$PATH:/usr/local/hadoop/bin"  >> ~/.bashrc
            echo "export PATH=$PATH:/usr/local/hadoop/sbin" >> ~/.bashrc
            echo "export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native" >> ~/.bashrc
            echo "export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib" >> ~/.bashrc
#"
#   C. Configure Hadoop
#   d. Stop IPv6 "Hadoop has some issues with IPv6"
            # Disable IPv6 System wide
                net.ipv6.conf.all.disab1e_ipv6=1
                net.ipv6.conf.default.disable_ipv6=I
                net.ipv6.conf.lo.disable_ipv6=1
            # Disable IPv6 Hadoop Scale
               sudo echo 'net.ipv6.conf.all.disable_ipv6=1' >> /etc/sysctl.conf
              sudo  echo 'net.ipv6.conf.default.disable_ipv6=1' >> /etc/sysctl.conf
              sudo  echo 'net.ipv6.conf.lo.disable_ipv6=1' >> /etc/sysctl.conf
#4.Start the cluster
#5.Access Namenode and YARN from web IJI
#useradd -md /home/hadoop hadoop
#chown -R hadoop:hadoop /home/hadoop
#passwd hadoop 
* Apply the above steps on all nodes
•	Allow password-less SSH access between cluster members
