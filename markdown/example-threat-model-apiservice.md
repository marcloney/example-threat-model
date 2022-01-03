# api-service

Author: marcloney

## Overview

Example threat model for SevSecOps

See more: https://github.com/marcloney/example-threat-model

Diagram: https://raw.githubusercontent.com/marcloney/example-threat-model/main/architecture.svg

|    |    |
| -- | -- |
| Internet Facing | ✅  |
| New Initiative | ✅  |
| Initiative Size | Medium |

## Information Assets

### api_gateway []

The entrypoint for our API service responsible for routing to our internal services.

### command_service []

Handles commands for our API

### query_service []

Handles queries for our API

### worker []

Handles queued events to update the database.

### database []

Stores our data.


## Threat Scenarios

### Threat

`User` to `API Gateway` spoofing threat.

> STRIDE: Spoofing

#### Proposed Controls

- [ ] All requests are handled by a unified, central authentication and authorisation framework or filter

### Threat

`User` to `API Gateway` tampering threat.

> STRIDE: Tampering

#### Proposed Controls

- [x] TLS, or other cryptographic protocols, are used for all data as it is transmitted over networks

### Threat

`User` to `API Gateway` elevation of privilege threat.

> STRIDE: Elevation Of Privilege

#### Proposed Controls

- [ ] All requests are handled by a unified, central authentication and authorisation framework or filter
- [x] All untrusted input is semanteically validated, where applicable. For example, a start date must be before an end date

### Threat

`User` to `API Gateway` repudiation threat.

> STRIDE: Repudiation

#### Proposed Controls

- [ ] All access control failures are logged

### Threat

`User` to `API Gateway` repudiation threat.

> STRIDE: Denial Of Service

#### Proposed Controls

- [ ] [CloudFront](https://aws.amazon.com/cloudfront/), [WAF](https://aws.amazon.com/waf/), and [Shield](https://aws.amazon.com/shield/) are configured to provide prection against distributed denial of service attacks

### Threat

`API Gateway` to `User` info disclosure threat.

> STRIDE: Info Disclosure

#### Proposed Controls

- [x] Error messages are not verbose on public interfaces

### Threat

`API Gateway` to `Command Service` elevation of privilege threat.

> STRIDE: Elevation Of Privilege

#### Proposed Controls

- [ ] All requests are handled by a unified, central authentication and authorisation framework or filter
- [x] All untrusted input is semanteically validated, where applicable. For example, a start date must be before an end date

### Threat

`API Gateway` to `Query Service` elevation of privilege threat.

> STRIDE: Elevation Of Privilege

#### Proposed Controls

- [ ] All requests are handled by a unified, central authentication and authorisation framework or filter
- [x] All untrusted input is semanteically validated, where applicable. For example, a start date must be before an end date

### Threat

`API Gateway` to `Command Service` tampering threat.

> STRIDE: Tampering

#### Proposed Controls

- [x] TLS, or other cryptographic protocols, are used for all data as it is transmitted over networks

### Threat

`API Gateway` to `Query Service` tampering threat.

> STRIDE: Tampering

#### Proposed Controls

- [x] TLS, or other cryptographic protocols, are used for all data as it is transmitted over networks

### Threat

`Query Service` to `API Gateway` info disclosure threat.

> STRIDE: Info Disclosure

#### Proposed Controls

- [x] Error messages are not verbose on public interfaces

### Threat

`Worker` to `Database` elevation of privilege threat.

> STRIDE: Elevation Of Privilege

#### Proposed Controls

- [ ] All requests are handled by a unified, central authentication and authorisation framework or filter

### Threat

`Worker` to `Database` tampering threat.

> STRIDE: Tampering

#### Proposed Controls

- [x] All untrusted input into database queries is handled with query parameterisation. As per https://www.owasp.org/index.php/Query_Parameterization_Cheat_Sheet
- [x] TLS, or other cryptographic protocols, are used for all data as it is transmitted over networks

### Threat

`Database` to `Query Service` info disclosure threat.

> STRIDE: Info Disclosure

#### Proposed Controls

- [x] Error messages are not verbose on public interfaces


---

Created: 2022-01-02 - Updated: 2022-01-02

