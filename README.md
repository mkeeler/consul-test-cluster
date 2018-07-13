# consul-test-cluster
Create a Consul cluster of servers and clients for testing on a docker host.

## Usage

### Default

Creates the default cluster of  3 servers and 2 clients

```bash
> terraform plan -out consul-cluster.plan
...
> terraform apply consul-cluster.plan
```

### Overriding Variables

Variables are defined in variables.tf. The main ones you may want to overwrite are:

* num_servers: The number of server nodes to run. Defaults to 3
* num_clients: Then number of client nodes to run. Defaults to 2
* docker_net_name: Name of the docker network to create or attach to. Defaults to "consul-net"
* docker_net_create: Boolean whether to create the docker network or just attach to one. Defaults to 1 = create.

## Notes

This currently relies on Docker DNS for coordination and cluster initialization. When the servers and clients start they 
will retry-join all of the server nodes using the docker hostname for each instance. This does not work with the default 
docker bridge due to name resolution not being provided for the default docker bridge. That is why the default action here
is to create a secondary docker bridge network (named consul-net) and use it for the cluster.
