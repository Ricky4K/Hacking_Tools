import pyautogui
import webbrowser as wb
import time

wb.open("web.whatsapp.com")
time.sleep(30)
for i in range(100):
    pyautogui.press("i")
    pyautogui.press("n")
    pyautogui.press("d")
    pyautogui.press("y")
    pyautogui.press("enter")
