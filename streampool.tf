# Copyright (c) 2021 Oracle and/or its affiliates.
# All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# compute.tf
#
# Purpose: The following file defines the logic to create a Streaming Pool
# Registry: https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/streaming_stream_pool


resource "oci_streaming_stream_pool" "StreamingPool" {
  compartment_id = local.compartment_id
  name           = var.stream_pool_display_name
  kafka_settings {
    auto_create_topics_enable = var.auto_create_topics_enable
    log_retention_hours       = var.spool_log_retention_hours
    num_partitions            = var.spool_num_partitions
  }
  private_endpoint_settings {
    nsg_ids   = local.nsg_id == "" ? [] : [local.nsg_id]
    subnet_id = local.subnet_ocid
  }
}