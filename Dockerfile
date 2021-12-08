FROM scratch

# set up:
# wget https://partner-images.canonical.com/oci/bionic/current/ubuntu-bionic-oci-amd64-root.tar.gz

# to run:
# docker build -t tcell-test .
# docker run -dp 3000:3000 tcell-test

ADD ubuntu-bionic-oci-amd64-root.tar.gz /
CMD ["bash"]

# install node 14
RUN apt-get update && apt-get install -y curl build-essential && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && apt-get clean

WORKDIR /app

COPY . .

RUN npm install

CMD TCELL_AGENT_HOST_IDENTIFIER=docker-test npm start
