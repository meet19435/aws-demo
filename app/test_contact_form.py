from playwright.sync_api import Playwright, sync_playwright, expect



def run(playwright: Playwright) -> None:
    browser = playwright.chromium.launch(headless=True)
    context = browser.new_context()
    page = context.new_page()
    print(page)
    f = open("container_ip.txt", "r")
    DOCKER_FLASK_IP = f.read()
    f.close()
    DOCKER_FLASK_IP = DOCKER_FLASK_IP.strip()
    print(DOCKER_FLASK_IP)
    ip ="http://"+DOCKER_FLASK_IP+":8080/"
    print(ip)
    page.goto(ip)
    page.get_by_role("link", name="Contact").click()
    page.locator("input[name=\"name\"]").click()
    page.locator("input[name=\"name\"]").fill("test")
    page.locator("input[name=\"email\"]").click()
    page.locator("input[name=\"email\"]").fill("test@test.com")
    page.get_by_role("spinbutton").click()
    page.get_by_role("spinbutton").fill("123")
    page.locator("textarea[name=\"message\"]").click()
    page.locator("textarea[name=\"message\"]").fill("123")
    page.get_by_role("button", name="Submit").click()

    # ---------------------
    context.close()
    browser.close()


with sync_playwright() as playwright:
    run(playwright)
