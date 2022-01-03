spec_version = "0.1.0"

threatmodel "api-service" {
    description  = "Example threat model for SevSecOps"
    imports      = ["aws-security-checklist.hcl", "owasp-proactive-controls.hcl"]
    link         = "https://github.com/marcloney/example-threat-model"
    diagram_link = "https://raw.githubusercontent.com/marcloney/example-threat-model/main/architecture.svg"
    author       = "marcloney"
    created_at   = 1641125499
    updated_at   = 1641125499

    attributes {
        new_initiative  = true
        internet_facing = true
        initiative_size = "Medium"
    }

    # Assets
    information_asset "api_gateway" {
        description = "The entrypoint for our API service responsible for routing to our internal services."
    } 

    information_asset "command_service" {
        description = "Handles commands for our API"
    } 

    information_asset "query_service" {
        description = "Handles queries for our API"
    } 

    information_asset "worker" {
        description = "Handles queued events to update the database."
    }

    information_asset "database" {
        description = "Stores our data."
    } 

    # Threats
    threat {
        description = "`User` to `API Gateway` spoofing threat."
        stride      = ["Spoofing"]

        # Authentication
        proposed_control {
            implemented = false 
            description = import.control.owasp-access-centralacl.description
        }
    }

    threat {
        description = "`User` to `API Gateway` tampering threat."
        stride      = ["Tampering"]

        # TLS
        proposed_control {
            implemented = true
            description = import.control.owasp-dataprotection-transit.description
        }
    }

    threat {
        description = "`User` to `API Gateway` elevation of privilege threat."
        stride      = ["Elevation Of Privilege"]

        # Authentication
        proposed_control {
            implemented = false 
            description = import.control.owasp-access-centralacl.description
        }

        # Validate untrusted input
        proposed_control {
            implemented = true
            description = import.control.owasp-validinput-semantic.description
        }


    }

    threat {
        description = "`User` to `API Gateway` repudiation threat."
        stride      = ["Repudiation"]

        # Access logging & monitoring
        proposed_control {
            implemented = false 
            description = import.control.owasp-access-logs.description
        }
    }

    threat {
        description = "`User` to `API Gateway` repudiation threat."
        stride      = ["Denial Of Service"]

        # AWS WAF
        proposed_control {
            implemented = false 
            description = import.control.aws-infra-ddos.description
        }
    }

    threat {
        description = "`API Gateway` to `User` info disclosure threat."
        stride      = ["Info Disclosure"]

        # Configure error messages to not be verbose
        proposed_control {
            implemented = true
            description = import.control.owasp-errors-infoleak.description
        }
    }

    threat {
        description = "`API Gateway` to `Command Service` elevation of privilege threat."
        stride      = ["Elevation Of Privilege"]

        # Authentication
        proposed_control {
            implemented = false 
            description = import.control.owasp-access-centralacl.description
        }

        # Validate untrusted input
        proposed_control {
            implemented = true
            description = import.control.owasp-validinput-semantic.description
        }
    }

    threat {
        description = "`API Gateway` to `Query Service` elevation of privilege threat."
        stride      = ["Elevation Of Privilege"]

        # Authentication
        proposed_control {
            implemented = false 
            description = import.control.owasp-access-centralacl.description
        }

        # Validate untrusted input
        proposed_control {
            implemented = true
            description = import.control.owasp-validinput-semantic.description
        }
    }

    threat {
        description = "`API Gateway` to `Command Service` tampering threat."
        stride      = ["Tampering"]

        # TLS
        proposed_control {
            implemented = true
            description = import.control.owasp-dataprotection-transit.description
        }
    }

    threat {
        description = "`API Gateway` to `Query Service` tampering threat."
        stride      = ["Tampering"]

        # TLS
        proposed_control {
            implemented = true
            description = import.control.owasp-dataprotection-transit.description
        }
    }
    
    threat {
        description = "`Query Service` to `API Gateway` info disclosure threat."
        stride      = ["Info Disclosure"]

        # Configure error messages to not be verbose
        proposed_control {
            implemented = true
            description = import.control.owasp-errors-infoleak.description
        }
    }

    threat {
        description = "`Worker` to `Database` elevation of privilege threat."
        stride      = ["Elevation Of Privilege"]

        # Authentication
        proposed_control {
            implemented = false 
            description = import.control.owasp-access-centralacl.description
        }
    }

    threat {
        description = "`Worker` to `Database` tampering threat."
        stride      = ["Tampering"]

        # Parameterised SQL queries
        proposed_control {
            implemented = true
            description = import.control.owasp-secdb-secqury.description
        }

        # TLS
        proposed_control {
            implemented = true
            description = import.control.owasp-dataprotection-transit.description
        }
    }

    threat {
        description = "`Database` to `Query Service` info disclosure threat."
        stride      = ["Info Disclosure"]

        # Configure error messages to not be verbose
        proposed_control {
            implemented = true
            description = import.control.owasp-errors-infoleak.description
        }
    }
}