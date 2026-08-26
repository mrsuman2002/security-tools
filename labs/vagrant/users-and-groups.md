# Users and Group

# To see total number of users use following command

      [vagrant@localhost ~]$ ls -l /home/
      total 0
      drwx------. 4 vagrant vagrant 154 Oct 15 17:45 vagrant

# To add user use useradd command

      [vagrant@localhost ~]$ useradd suman
      -bash: /usr/sbin/useradd: Permission denied
      [vagrant@localhost ~]$ sudo useradd suman
      [vagrant@localhost ~]$ ls -l /home/
      total 0
      drwx------. 2 suman   suman    62 Oct 15 18:43 suman
      drwx------. 4 vagrant vagrant 154 Oct 15 17:45 vagrant
      [vagrant@localhost ~]$ sudo useradd tom
      [vagrant@localhost ~]$ ls -l /home/
      total 0
      drwx------. 2 suman   suman    62 Oct 15 18:43 suman
      drwx------. 2 tom     tom      62 Oct 15 18:43 tom
      drwx------. 4 vagrant vagrant 154 Oct 15 17:45 vagrant

# Also to see all the users open passwd

    [vagrant@localhost ~]$ vi /etc/passwd
    [vagrant@localhost ~]$ groupadd users
    -bash: /usr/sbin/groupadd: Permission denied]
    
# To create a group use groupadd command
      [vagrant@localhost ~]$ sudo groupadd Allusers
      [vagrant@localhost ~]$ vi /etc/group

# To add users to the seconadary group use usermod -G command and to add in primary group use usermod -g command
      [vagrant@localhost ~]$ usermod -G Allusers suman
      -bash: /usr/sbin/usermod: Permission denied
      [vagrant@localhost ~]$ sudo usermod -G Allusers suman
      [vagrant@localhost ~]$ vi /etc/group
      
# To give a password to the user use passwd command 
      [vagrant@localhost ~]$ sudo passwd suman
      Changing password for user suman.
      New password:
      BAD PASSWORD: The password is shorter than 8 characters
      Retype new password:
      passwd: all authentication tokens updated successfully.
# To switch into the user use su command and just make sure you are in suman directory not in vagrant
      [vagrant@localhost ~]$ su suman
      Password:
      [suman@localhost vagrant]$ pwd
      /home/vagrant
      [suman@localhost vagrant]$ exit
      exit
# To switch into the user directory use su and - suman command
      [vagrant@localhost ~]$ su - suman
      Password:
      Last login: Tue Oct 15 18:57:23 UTC 2019 on pts/0
      [suman@localhost ~]$ ls
      [suman@localhost ~]$ pwd
      /home/suman
      [suman@localhost ~]$

# To change the ownership of the directory use chown command
      [vagrant@localhost ~]$ sudo chown vagrant:root dir1
      [vagrant@localhost ~]$ ls -l
      total 12
      drwxrwxr-x. 2 vagrant root     6 Oct 15 17:43 dir1
      -rw-rw-r--. 1 vagrant vagrant 90 Oct 15 17:10 file1.txt
      -rw-rw-r--. 1 vagrant vagrant 25 Oct 15 17:42 file2.txt
      -rw-rw-r--. 1 vagrant vagrant 43 Oct 15 17:49 file3.txt
      -rw-rw-r--. 1 vagrant vagrant  0 Oct 15 17:45 file4.txt
      [vagrant@localhost ~]$ sudo chown root:root dir1

      [vagrant@localhost ~]$ ls -l
      total 12
      drwxrwxr-x. 2 root    root     6 Oct 15 17:43 dir1
      -rw-rw-r--. 1 vagrant vagrant 90 Oct 15 17:10 file1.txt
      -rw-rw-r--. 1 vagrant vagrant 25 Oct 15 17:42 file2.txt
      -rw-rw-r--. 1 vagrant vagrant 43 Oct 15 17:49 file3.txt
      -rw-rw-r--. 1 vagrant vagrant  0 Oct 15 17:45 file4.txt
      [vagrant@localhost dir1]$ cd dir1/
      [vagrant@localhost dir1]$
      
# To change permision use +(add) and -(negative) sign with chmod command 
      [vagrant@localhost ~]$ touch firstshell.sh
      [vagrant@localhost ~]$ ls -l
      total 12
      drwxrwxr-x. 2 vagrant vagrant  6 Oct 15 17:43 dir1
      -rw-rw-r--. 1 vagrant vagrant  0 Oct 15 19:36 firstshell.sh
      
### To remove permission use negative - sign
      [vagrant@localhost ~]$ chmod o-r firstshell.sh
      [vagrant@localhost ~]$ ls -l
      total 12
      drwxrwxr-x. 2 vagrant vagrant  6 Oct 15 17:43 dir1
      -rw-rw----. 1 vagrant vagrant  0 Oct 15 19:36 firstshell.sh
      [vagrant@localhost ~]$
      
### To add permission use pluse + sign
      [vagrant@localhost ~]$ chmod o+r firstshell.sh
      [vagrant@localhost ~]$ ls -l
      total 12
      drwxrwxr-x. 2 vagrant vagrant  6 Oct 15 17:43 dir1
      -rw-rw-r--. 1 vagrant vagrant  0 Oct 15 19:36 firstshell.sh
