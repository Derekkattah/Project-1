# VPC

variable "cidre-for-vpc" {
description = "the cidre for vpc"
default = "10.0.0.0/16"
type = string

}

# Private Subnets

variable "cidre-for-private-subnet-1" {
description = "name for private subnet 1 "
default = "10.0.1.0/24"
type = string
} 

variable "cidre-for-private-subnet-2" {
description = "name for private subnet 2 "
default = "10.0.2.0/24"
type = string
} 

# Public Subnets

variable "cidre-for-public-sub-1" {
description = "name for public subnet 1 "
default = "10.0.3.0/24"
type = string
} 

variable "cidre-for-public-sub-2" {
description = "name for public subnet 2 "
default = "10.0.4.0/24"
type = string
} 

# Public Route Table

variable "public-route-tale" {
description = "name for public route table "
default = "sept-public-rt"
type = string
} 

# Private Route Table

variable "public-sub-1" {
description = "name for private route table"
default = "sept-private-rt"
type = string
} 

