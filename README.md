# docker-vault
Run vault.io in a docker container without sacrificing security. TLS and mlock is enabled in all builds.
However for the moment it uses the file backend for storage. As such the data directory should be given the appropriate SELinux context.

# Instructions
Run the container by mounting the certs and data folder, and adding the IPC_LOCK capability for mlock.

```
sudo docker run --name vault --rm -it -p 8200:8200 --cap-add IPC_LOCK -v <certs_dir>:/certs -v <data_dir>:/data:Z vault
```

Then go about initialising the vault store.
If you've used a self signed certificate remember to use the `VAULT_SKIP_VERIFY=1` environment variable.
