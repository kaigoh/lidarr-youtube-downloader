FROM ubuntu
RUN DEBIAN_FRONTEND=noninteractive apt-get update -o Acquire::ForceIPv4=true
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -o Acquire::ForceIPv4=true -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -o Acquire::ForceIPv4=true -y ffmpeg python3 curl python3-pip
RUN pip3 install eyed3 requests numpy youtube-search-python
COPY view /view
COPY lidarr-youtube-downloader.py /
ADD https://github.com/yt-dlp/yt-dlp/releases/download/2022.07.18/yt-dlp_linux /usr/bin/youtube-dl
RUN chmod +x /usr/bin/youtube-dl
CMD ["python3", "/lidarr-youtube-downloader.py"]
