# sshd-server
A simple sshd server that can be used to expose volumes via ssh or sftp

# Notes
docker build -t my-sshd .
docker run --rm -ti --name my-sshd -p 2222:22 my-sshd
