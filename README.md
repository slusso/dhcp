Run ISC dhcp in Docker container
=================================

Run the ISC dhcp daemon in centos7  


### Prerequisites

Make sure you have a `</netservices/DHCP/cfg>` and `</netservices/DHCP/logs>` owned by `<dhcpd:dhcpd>` (`<177:177>`)

## Build

```
docker build -t isc-dhcpd .
```

Run detached listening on `<eth2>` :

```
docker run -d --net=host -v /netservices/DHCP/cfg:/cfg -v /netservices/DHCP/logs:/logs --name dhcpd isc-dhcpd eth2
```
