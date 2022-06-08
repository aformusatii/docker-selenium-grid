from selenium import webdriver
from selenium.webdriver.chrome.options import Options

options = Options()
options.add_argument('--no-sandbox')
options.add_argument("--window-size=800,600")

driver = webdriver.Remote(
    command_executor = "http://192.168.100.134:4444/wd/hub",
    desired_capabilities = webdriver.DesiredCapabilities.CHROME,
    options = options
)

driver.get("https://google.com")

driver.save_screenshot("google.png")

driver.quit()