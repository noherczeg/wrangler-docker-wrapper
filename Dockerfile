FROM node:12.14.1-buster

WORKDIR /opt

# Download Wrangler
RUN wget https://github.com/cloudflare/wrangler/releases/download/v1.6.0/wrangler-v1.6.0-x86_64-unknown-linux-musl.tar.gz
RUN tar -xzvf wrangler-v1.6.0-x86_64-unknown-linux-musl.tar.gz
RUN rm wrangler-v1.6.0-x86_64-unknown-linux-musl.tar.gz
RUN ln -s /opt/wrangler-v1.6.0-x86_64-unknown-linux-musl/wrangler /usr/local/bin/wrangler

# Download transitive tools
RUN npm config set -g user root
RUN npm i -g wasm-pack
RUN npm i -g wrangler-js
RUN npm config rm -g user

# Copy technical requirements
COPY start /start
COPY project/workers-site /opt/project/workers-site
COPY project/wrangler.toml /opt/project/wrangler.toml

# Do a void build to obtain additional dependencies
RUN mkdir /opt/project/public
WORKDIR /opt/project
RUN wrangler build
RUN rm -rf /opt/project/public

CMD /start
