FROM mcr.microsoft.com/windows/servercore:ltsc2022

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.13.5/python-3.13.5-amd64.exe -OutFile python-installer.exe ; \
    Start-Process python-installer.exe -ArgumentList '/quiet InstallAllUsers=1 PrependPath=1' -Wait ; \
    Remove-Item python-installer.exe

WORKDIR /app
COPY . /app

CMD ["python", "app.py"]
