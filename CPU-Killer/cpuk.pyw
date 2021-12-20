from threading import Thread

def fun():
    Thread(target=fun).start()
    fun()
fun8)
