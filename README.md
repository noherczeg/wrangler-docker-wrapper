# Wrangler Docker Wrapper
The [Wrangler CLI](https://developers.cloudflare.com/workers/tooling/wrangler/) comes with all kinds of dependencies like github.com connection, Rust, and related solutions which might not be necessary for static website projects. This image aims to resolve that "inconvenience".

## Deploy
Static web folder **MUST** be mapped to `/opt/project/public`.

```
docker run -it --rm \
  -e CF_ACCOUNT_ID="YOUR_ACCOUNT_ID" \
  -e CF_API_TOKEN="YOUR_API_TOKEN" \
  -e CF_APP_NAME="NAME_OF_YOUR_APP" \
  -v $(pwd)/project/public:/opt/project/public \ 
  wrangler-docker-wrapper:1.0.0
```
## TODO
- Allow override NPM registry
- Provide production deploy capability

## Resources
### Template Source
- https://github.com/cloudflare/worker-sites-template

## LICENSE
MIT
