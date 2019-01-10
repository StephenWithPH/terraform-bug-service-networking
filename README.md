## WHAT
This is a minimal repo to provide repro steps for https://github.com/terraform-providers/terraform-provider-google/issues/2799.


## REPRO

1. `git clone` this repo
1. provide a valid service account key at `account.json`
1. `git checkout fc01d6556b4d39a4b66a7fe77ee562ed47e91061`
1. `terraform init`
1. `terraform apply`
  * enter the gcp project (the service account whose key you provided above must have appropriate permissions in this project)

If all goes well (?), you will get this error:

```
google_service_networking_connection.private_vpc_connection: Creating...
  network:                   "" => "example"
  reserved_peering_ranges.#: "" => "1"
  reserved_peering_ranges.0: "" => "google-managed-services-example"
  service:                   "" => "servicenetworking.googleapis.com"

Error: Error applying plan:

1 error(s) occurred:

* google_service_networking_connection.private_vpc_connection: 1 error(s) occurred:

* google_service_networking_connection.private_vpc_connection: Failed to find Service Networking Connection, err: Failed to retrieve network field value, err: project: required field is not set
```


## WORKAROUND

1. To clean things up from the first run repro'ing the problem, `terraform destroy`
1. `git checkout 121327a68696e7d06ffd384870dea7f3fecb843e`
  * this commit switches to the aliased provider which has the project set
1. `terraform apply`

**NOTE: you will get farther in the process (validating the workaround), but you will get the error below. I excluded the null resource which is running scripts to provision the IP range.**


```
google_service_networking_connection.private_vpc_connection: Creating...
  network:                   "" => "example"
  reserved_peering_ranges.#: "" => "1"
  reserved_peering_ranges.0: "" => "google-managed-services-example"
  service:                   "" => "servicenetworking.googleapis.com"

Error: Error applying plan:

1 error(s) occurred:

* google_service_networking_connection.private_vpc_connection: 1 error(s) occurred:

* google_service_networking_connection.private_vpc_connection: allocated IP range 'google-managed-services-example' not found in network

```
