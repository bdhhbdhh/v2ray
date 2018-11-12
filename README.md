# Start a v2ray instance
The following command use default config starts a v2ray container.
> $ docker run -d -p 8080:8080 bdhhbdhh/v2ray

The default config are:
> id: da70fa56-a09b-413c-81bf-65536c5f1a22  
> alterId: 64  
> port: 8080

# Environment Variables
When you start the v2rat image, you can pass the configuration by passing an environment variable on the docker run command line.
#### **CONFIG**
This variable is specifies the json format config.
