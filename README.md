# Wrangler Docker Wrapper

## Build
```
docker build -t wrangler-wrapper:latest .
```

## Deploy
Static web folder **MUST** be mapped to `/opt/project/public`.

```
docker run -it --rm \
  -e CF_ACCOUNT_ID="YOUR_ACCOUNT_ID" \
  -e CF_API_TOKEN="YOUR_API_TOKEN" \
  -e CF_APP_NAME="NAME_OF_YOUR_APP" \
  -v $(pwd)/project/public:/opt/project/public \ 
  wrangler-wrapper:latest
```

## Resources
### Template Source
- https://github.com/cloudflare/worker-sites-template
