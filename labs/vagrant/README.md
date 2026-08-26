# Vagrant

# Run vagrant up to start virtualization from the directory where there is vagrantfile  

    PS C:\Users\suman\Desktop\Bacloudsystems\Vagrant> vagrant up

    Bringing machine 'linux' up with 'virtualbox' provider...

    Bringing machine 'sshmachine' up with 'virtualbox' provider...

    ==> linux: Checking if box 'centos/7' version '1905.1' is up to date...

    ==> linux: Machine already provisioned. Run `vagrant provision` or use the `--provision`

    ==> linux: flag to force provisioning. Provisioners marked to run always will still run.

    ==> sshmachine: Checking if box 'centos/7' version '1905.1' is up to date...

    ==> sshmachine: Clearing any previously set forwarded ports...

    ==> sshmachine: Fixed port collision for 22 => 2222. Now on port 2200.

    ==> sshmachine: Clearing any previously set network interfaces...

    ==> sshmachine: Preparing network interfaces based on configuration...

        sshmachine: Adapter 1: nat

        sshmachine: Adapter 2: hostonly

    ==> sshmachine: Forwarding ports...

        sshmachine: 22 (guest) => 2200 (host) (adapter 1)

    ==> sshmachine: Running 'pre-boot' VM customizations...

    ==> sshmachine: Booting VM...

    There was an error while executing `VBoxManage`, a CLI used by Vagrant

    for controlling VirtualBox. The command and stderr is shown below.


    Command: ["startvm", "7c03535a-a17f-49dc-9874-87aff30ef059", "--type", "headless"]


    Stderr: VBoxManage.exe: error: Failed to open/create the internal network 'HostInterfaceNetworking-VirtualBox Host-Only Ethernet Adapter 

    #2' (VERR_INTNET_FLT_IF_NOT_FOUND).

    VBoxManage.exe: error: Failed to attach the network LUN (VERR_INTNET_FLT_IF_NOT_FOUND)

    VBoxManage.exe: error: Details: code E_FAIL (0x80004005), component ConsoleWrap, interface IConsole

# To fix the above error  #2' (VERR_INTNET_FLT_IF_NOT_FOUND) go to your virtual box and then settings. Under setting go to netwok disable network adaptor of adaptor2

PS C:\Users\suman\Desktop\Bacloudsystems\Vagrant>

# To see the status of the Vms use vagrant status

PS C:\Users\suman\Desktop\Bacloudsystems\Vagrant> vagrant status

    Current machine states:


    linux                     running (virtualbox)

    sshmachine                poweroff (virtualbox)


    This environment represents multiple VMs. The VMs are all listed

    above with their current state. For more information about a specific

        VM, run `vagrant status NAME`.

# To Login to linux machine

    PS C:\Users\suman\Desktop\Bacloudsystems\Vagrant> vagrant ssh linux

# Create a file and edit file using vi editor

### To write in vi editor press i and start writing. To Save and exit the editor press ESC and :wq.

    [vagrant@localhost ~]$ vi file1.txt

#To see the content of the file use cat command

    [vagrant@localhost ~]$ cat file1.txt

    This is my first file in linux machine created through machine.

    This is the second line

# To create a file without opening use touch command

    [vagrant@localhost ~]$ touch file2.txt

# To view the current directory use pwd command

    [vagrant@localhost ~]$ pwd

    /home/vagrant

# To view the list of files and the directory use ls command

    [vagrant@localhost ~]$ ls

    file1.txt  file2.txt

# To view the the list of files and the directory with permissions use ls-l command

    [vagrant@localhost ~]$ ls -l

    total 4

    -rw-rw-r--. 1 vagrant vagrant 90 Oct 15 17:10 file1.txt

    -rw-rw-r--. 1 vagrant vagrant  0 Oct 15 17:11 file2.txt
 
    [vagrant@localhost ~]$ vi file2.txt

    [vagrant@localhost ~]$ cat file2.txt

    This is the second file

# To make a directory use mkdir command
    [vagrant@localhost ~]$ mkdir dir1

    [vagrant@localhost ~]$ ls -l

    total 8

    drwxrwxr-x. 2 vagrant vagrant  6 Oct 15 17:43 dir1

    -rw-rw-r--. 1 vagrant vagrant 90 Oct 15 17:10 file1.txt

    -rw-rw-r--. 1 vagrant vagrant 25 Oct 15 17:42 file2.txt

    [vagrant@localhost ~]$ mkdir dir2

# To remove directory use rmdir

    [vagrant@localhost ~]$ rmdir dir2

# Touch commands also can be used to create multiple files at the same time

    [vagrant@localhost ~]$ touch file3.txt file4.txt

    [vagrant@localhost ~]$ ls

    dir1  file1.txt  file2.txt  file3.txt  file4.txt

    [vagrant@localhost ~]$ cat file3.txt

# To write inside the file without opening the file use echo command and to specify the file use single > sign

    [vagrant@localhost ~]$ echo "this is file3" >file3.txt

    [vagrant@localhost ~]$ cat file3.txt

    this is file3

# To write in second line without opening the file use echo command and two >> sign

    [vagrant@localhost ~]$ echo "this is second line in file3">>file3.txt

    [vagrant@localhost ~]$ cat file3.txt

    this is file3

    this is second line in file3
