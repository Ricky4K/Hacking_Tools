import pyautogui
import webbrowser as wb
import time

wb.open("web.whatsapp.com")
time.sleep(30)
for i in range(100):
    pyautogui.press(":")
    pyautogui.press("D")
    pyautogui.press("enter")
