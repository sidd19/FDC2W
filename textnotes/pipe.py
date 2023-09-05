import os, time

pipe_name = '/home/srg/Sarthak/Flutter_Projects/flutter_homescreen/textnotes/pipe_test'

def child():
    pipein = os.open(pipe_name, os.O_RDONLY)
    while True:
        data = os.read(pipein, 20)  # 
        if not data:
            break  
        print(f'Child {os.getpid()} received "{data.decode()}" at {time.time()}')

def parent():
    pipeout = os.open(pipe_name, os.O_WRONLY)
    counter = 0
    while True:
        time.sleep(1)
        data_to_send = f'Number {counter:03d}\n'
        os.write(pipeout, data_to_send.encode())
        counter = (counter + 1) % 5

if not os.path.exists(pipe_name):
    os.mkfifo(pipe_name)

pid = os.fork()
if pid != 0:
    parent()
else:
    child()

