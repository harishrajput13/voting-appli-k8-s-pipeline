variable "instance-type" {
  type        = string
  default     = "t3.medium"
  description = "Instance type for node group"
}

variable "cidr-block" {
  type        = string
  default     = "192.168.0.0/16"
  description = "cidr block for eks-vpc"
}

variable "vpc-name" {
  type        = string
  default     = "eks-vpc"
  description = "name of the vpc using for eks cluster"
}

variable "public-subnet-cidr" {
  type        = list(string)
  default     = ["192.168.0.0/17", "192.168.128.0/17"]
  description = "public subnet cider block"
}
