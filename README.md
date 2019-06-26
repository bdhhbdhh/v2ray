# Start a V2Ray instance
The following command use default config starts a V2Ray container.
> $ docker run -d -p 8080:8080 bdhhbdhh/v2ray

The default config are:
> id: da70fa56-a09b-413c-81bf-65536c5f1a22  
> alterId: 64  
> port: 8080

# Environment Variables
When you start the V2Ray image, you can pass the config by passing an environment variable on the docker run command line.
- CONFIG  
This variable is specifies the json format config.

# Using a custom config file
The default config for V2Ray can be found in /etc/v2ray/config.json. You can mount your specifie config file by -v params on the docker run command line.

# Create certificate
> $ openssl req -newkey rsa:2048 -nodes -keyout cert.key -x509 -days 3650 -out cert.crt

---
---
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)
