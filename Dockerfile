# Use a lighter Windows base image: Nano Server (choose the appropriate tag)
FROM mcr.microsoft.com/windows/nanoserver:ltsc2022

# Use PowerShell as the shell
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]


RUN Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.13.5/python-3.13.5-amd64.exe -OutFile python-installer.exe ; \
    Start-Process python-installer.exe -ArgumentList '/quiet InstallAllUsers=1 PrependPath=1' -Wait ; \
    Remove-Item python-installer.exe

# Verify Python installation
RUN python --version

# Set working directory
WORKDIR /app

# Copy application files
COPY . /app

# Define startup command
CMD ["python", "app.py"]
