## Setup host os enviroment on VM

```
vagrant up
```

## Require plugin

vagrant-vbguest

```
vagrant plugin install vagrant-vbguest
vagrant vbguest --status
vagrant vbguest
```

## Ready for provision your server

Execute "vagrant ssh" and login VM.

# Install chef to your server

Move the current directory to the chef of the repository .

```
$ cd /vagrant/chef-repo
```

If first, install chef to your server.

```
knife zero bootstrap {REMOTE IP} -x {SSH USER NAME}
```

# Rrovisioning your server

```
knife zero converge 'name:{HOSTNAME}' -x {SSH USER NAME}
```

## Is it easy to use the "git" on VM

The private key of the Host OS can be easy to use the VCS on Guest OS by registering on the SSH-AGENT

If windows,

```
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa
```
If mac or linux

```
ssh-add ~/.ssh/id_rsa
```
