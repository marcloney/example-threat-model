spec_version = "0.1.0"

threatmodel "api-service" {
    description  = ""
    imports      = null
    link         = ""
    diagram_link = ""
    author       = "marcloney"
    created_at   = 1641125499
    updated_at   = 1641125499

    attributes {
        new_initiative  = true
        internet_facing = true
        initiative_size = "Medium"
    }

    information_asset "api_gateway" {
        description = "The entrypoint for our API service responsible for routing to our internal services."
    } 

    threat {
        description = "`User` to `API Gateway` spoofing threat."
        stride      = ["Spoofing"]
    }

    threat {
        description = "`User` to `API Gateway` tampering threat."
        stride      = ["Tampering"]

        # TLS
        proposed_control {
            implemented = true
            #description = import.control.owasp-dataprotection-transit.description
            description = "test"
        }
    }

    threat {
        description = "`User` to `API Gateway` elevation of privilege threat."
        stride      = ["Elevation Of Privilege"]
    }

    threat {
        description = "`User` to `API Gateway` repudiation threat."
        stride      = ["Repudiation"]
    }

    threat {
        description = "`User` to `API Gateway` repudiation threat."
        stride      = ["Denial Of Service"]
    }

    threat {
        description = "`API Gateway` to `User` info disclosure threat."
        stride      = ["Info Disclosure"]
    }

    threat {
        description = "`API Gateway` to `Command Service` elevation of privilege threat."
        stride      = ["Elevation Of Privilege"]
    }

    threat {
        description = "`API Gateway` to `Query Service` elevation of privilege threat."
        stride      = ["Elevation Of Privilege"]
    }

    threat {
        description = "`API Gateway` to `Command Service` tampering threat."
        stride      = ["Tampering"]
    }

    threat {
        description = "`API Gateway` to `Query Service` tampering threat."
        stride      = ["Tampering"]
    }
    
    threat {
        description = "`Query Service` to `API Gateway` info disclosure threat."
        stride      = ["Info Disclosure"]
    }

    threat {
        description = "`Worker` to `Database` elevation of privilege threat."
        stride      = ["Elevation Of Privilege"]
    }

    threat {
        description = "`Worker` to `Database` tampering threat."
        stride      = ["Tampering"]
    }

    threat {
        description = "`Database` to `Query Service` info disclosure threat."
        stride      = ["Info Disclosure"]
    }

}