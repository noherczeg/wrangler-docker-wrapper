# Wrangler Docker Wrapper
The [Wrangler CLI](https://developers.cloudflare.com/workers/tooling/wrangler/) comes with all kinds of dependencies like github.com connection, Rust, and related solutions which might not be necessary for static website projects.

This image contains everything necessary to publish with `wrangler`, no additional steps will be involved.

## Deploy
Static web folder **MUST** be mapped to `/opt/project/public`.

### Dev
Will deploy to _*.workers.dev_.

```
docker run -it --rm \
  -e CF_ACCOUNT_ID="YOUR_ACCOUNT_ID" \
  -e CF_API_TOKEN="YOUR_API_TOKEN" \
  -e CF_APP_NAME="NAME_OF_YOUR_APP" \
  -v $(pwd)/project/public:/opt/project/public \ 
  noherczeg/wrangler-docker-wrapper:1.0.2
```

### Production
Specifying the _CF_ROUTE_ ENV variable turns off workders.dev deployment.

```
docker run -it --rm \
  -e CF_ACCOUNT_ID="YOUR_ACCOUNT_ID" \
  -e CF_API_TOKEN="YOUR_API_TOKEN" \
  -e CF_APP_NAME="NAME_OF_YOUR_APP" \
  -e CF_ZONE_ID="YOUR_ZONE_ID" \
  -e CF_ROUTE="ROUTE_TO_WORKER" \
  -v $(pwd)/project/public:/opt/project/public \
  noherczeg/wrangler-docker-wrapper:1.0.2
```

## Additional ENV variables
- NPM_REGISTRY
- NPM_HTTP_PROXY
- NPM_HTTPS_PROXY

> You are not expected to rely on these.

## TODO
- Provide production deploy capability

## Resources

#### Template Source
- https://github.com/cloudflare/worker-sites-template

## LICENSE
MIT
