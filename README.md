# Docker Image for Selenium Grid on Debian
This repo contains docker file for building an image with Selenium Grid on Debian OS. It also exposes VNC server and noVNC web client for debugging.
By default it contains only Chrome driver.
Tested on [ODROID XU4](https://www.hardkernel.com/shop/odroid-xu4-special-price/) ARMv7 platform.

## Prerequsites
- Docker, could be installed with `sudo apt install docker.io`

## Usage

Checkout this repository somewhere on your machine and move to it.
```bash
$ git clone https://github.com/aformusatii/docker-selenium-grid.git
cd docker-selenium-grid
```

Optionally you can edit Dockerfile to customize installation as required, for example add other types of drivers.

Build docker image.
```sh
$ sudo docker build -t selenium-grid .
```

Run standalone image.
```sh
$ sudo docker run -it -d --rm -p 5920:5920 -p 4444:4444 -p 6080:6080 --name seleniumgrid selenium-grid
```

Run via docker compose.
```yaml
version: '3.1'

services:
  seleniumgrid:
    container_name: seleniumgrid
    image: selenium-grid
    restart: always
    ports:
      - 5920:5920
      - 4444:4444
      - 6080:6080
    environment:
      TZ: 'Europe/Chisinau'
```


Sample python code using the Selenium Grid

```python
from selenium import webdriver
from selenium.webdriver.chrome.options import Options

options = Options()
options.add_argument('--no-sandbox')
options.add_argument("--window-size=800,600")

driver = webdriver.Remote(
    command_executor = "http://docker_host_ip:4444/wd/hub",
    desired_capabilities = webdriver.DesiredCapabilities.CHROME,
    options = options
)

driver.get("https://google.com")

driver.save_screenshot("google.png")

driver.quit()
```