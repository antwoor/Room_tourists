# Или :general, если у кого-то стоит не nvidia
FROM nickodema/hsl_2022:nvidia  

# Обновление списка пакетов и установка необходимых пакетов
RUN sudo apt-get update &&\
    sudo apt-get -y install libzbar0 &&\
    apt install -y python3-pip --fix-missing &&\
    pip3 install opencv-python pyzbar 



# Любые другие команды, которые вы хотите выполнить при сборке образа
# Например, установка дополнительного ПО
# RUN apt-get install -y <additional-packages>

# Установите рабочую директорию
WORKDIR /workspace

# Весь ваш образ теперь будет обновлён
