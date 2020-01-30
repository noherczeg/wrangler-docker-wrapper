FROM node:12.14.1-buster

WORKDIR /opt

RUN wget https://github.com/cloudflare/wrangler/releases/download/v1.6.0/wrangler-v1.6.0-x86_64-unknown-linux-musl.tar.gz
RUN tar -xzvf wrangler-v1.6.0-x86_64-unknown-linux-musl.tar.gz
RUN rm wrangler-v1.6.0-x86_64-unknown-linux-musl.tar.gz
RUN ln -s /opt/wrangler-v1.6.0-x86_64-unknown-linux-musl/wrangler /usr/local/bin/wrangler

RUN npm config set -g user root
RUN npm i -g wasm-pack
RUN npm i -g wrangler-js
RUN npm config rm -g user

COPY start /start
COPY project/workers-site /opt/project/workers-site
COPY project/wrangler.toml /opt/project/wrangler.toml

CMD /start
