FROM ubuntu:focal

ARG ADMIN_PASSWORD

RUN apt-get update && \
    apt-get install -y openssh-server sudo

RUN mkdir /var/run/sshd

RUN apt-get install -y pkg-config build-essential ninja-build automake autoconf libtool wget curl git gcc libssl-dev bc slib squashfs-tools android-sdk-libsparse-utils android-sdk-ext4-utils jq cmake python3-distutils tclsh scons parallel ssh-client tree python3-dev python3-pip device-tree-compiler libssl-dev ssh cpio squashfs-tools fakeroot libncurses5 flex bison

RUN groupadd wheel && \
    useradd -m admin && \
    echo "admin:${ADMIN_PASSWORD}" | chpasswd && \
    chown -R admin:admin /home/admin && \
    usermod -aG wheel admin

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
