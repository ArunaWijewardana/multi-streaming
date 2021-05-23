# Live game streaming for multiple platforms with different bit-rates

## How to install

You will need git and docker installed and running before further steps.

1. Download / clone the repository
2. Go into the root folder `cd multi-streaming`.
3. Configure the streaming endpoints with their URLs and Keys in `/nginx/nginx.conf`.
4. Build and bring up the container. `docker-compose up --build -d`
5. Start the multi-streaming service. `docker exec -it multistreaming_server service nginx start`
6. Navigate to your web browser to see the stats on [localhost](http://localhost/index.html).
7. Start streaming to the host device IP on port 1935.

*© Aruna Priyankara Wijewardana @ 2021*
