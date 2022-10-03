FROM runatlantis/atlantis:v0.18.3
RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.38.12/terragrunt_linux_amd64
RUN wget https://github.com/transcend-io/terragrunt-atlantis-config/releases/download/v1.15.0/terragrunt-atlantis-config_1.15.0_linux_amd64.tar.gz
RUN tar xvzf terragrunt-atlantis-config_1.15.0_linux_amd64.tar.gz
RUN mv terragrunt_linux_amd64 /usr/local/bin/terragrunt && rm -rf terragrunt_linux_amd64
RUN mv terragrunt-atlantis-config_1.15.0_linux_amd64/terragrunt-atlantis-config_1.15.0_linux_amd64 /usr/local/bin/terragrunt-atlantis-config && rm -rf terragrunt-atlantis-config*
RUN mkdir /home/atlantis/.ssh && ssh-keyscan gitlab.n-t.io > /home/atlantis/.ssh/known_hosts 2>&1
RUN chown -R atlantis:atlantis /home/atlantis/.ssh
RUN chmod +x /usr/local/bin/terragrunt
RUN chmod +x /usr/local/bin/terragrunt-atlantis-config
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
