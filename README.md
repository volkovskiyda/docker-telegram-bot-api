## Telegram Bot API Docker Image

### Based on [Telegram Bot API](https://github.com/tdlib/telegram-bot-api)

### **Pull image:**
```bash
docker pull ghcr.io/volkovskiyda/telegram-bot-api
```
### **Container configuration:**
- Mandatory options are: `api_id` and `api_hash`. Specify them using the `--api-id` and `--api-hash` options or the `TELEGRAM_API_ID` and `TELEGRAM_API_HASH` environment variables.
- Telegram Bot API server is launched on the port `8081` by default. To change the default port, use the option `--http-port`. To make a port available to services outside of Docker, use the: `-p 8081:8081` to publish port.


### **Run container (detached mode):**
Change `<api_id>` and `<api_hash>`
```bash
docker run -dit --rm -e TELEGRAM_API_ID=<api_id> -e TELEGRAM_API_HASH=<api_hash> -p 8081:8081 ghcr.io/volkovskiyda/telegram-bot-api
```
```bash
docker run -dit --rm -p 8081:8081 ghcr.io/volkovskiyda/telegram-bot-api --api-id=<api_id> --api-hash=<api_hash>
```
