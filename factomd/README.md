# Factomd

Custom factomd image, for use with the Helm chart listed below.

## Useful Links

  * [Factomd Helm Chart](https://github.com/BedrockSolutions/helm/tree/master/factomd)
      
  * [Base Image](https://hub.docker.com/r/factominc/factomd)

## Supported tags and Dockerfile links

* [`latest` (*Dockerfile*)](https://github.com/BedrockSolutions/dockerfile/blob/master/factomd/Dockerfile)
  
## Volumes

Two volumes must be attached:

### Database Volume

* **`/home/factomd/.factom/m2`**: Mount a suitable volume here for storage of the blockchain 
database.

### Configuration Volume

* **`/home/factomd/.factom/private`**: Mount a directory here that contains the `factomd.conf`
configuration file.

## Environment variables

The image can accept a single, optional, environment variable:

* **`LOCAL_SERVER_PRIVATE_KEY`**: The server identity's private key 

In order for that environment variable to make its way into the configuration, the `factomd.conf`
configuration file must have the `LocalServerPrivKey` set as follows:
```
LocalServerPrivKey=${LOCAL_SERVER_PRIVATE_KEY}
```
