# vagrant up

installing docker

so, execute "vagrant ssh" and login VM.

next, install knife-zero

```
sudo /opt/chef/embedded/bin/gem i knife-zero
```

if first add node, next command.
```
knife zero bootstrap {REMOTE IP} -x {USER NAME}
```

provisioning remote node.
```
knife zero converge 'name:{}' -x {USER NAME}
```

