resource "aws_vpc" "eks-vpc" {
  cidr_block = var.cidr-block

  tags = {
    Name = "${var.vpc-name}"
  }
}

resource "aws_subnet" "public-subnet" {
  count                   = length(var.public-subnet-cidr)
  vpc_id                  = aws_vpc.eks-vpc.id
  cidr_block              = element(var.public-subnet-cidr, count.index)
  availability_zone       = data.aws_availability_zones.eks-vpc.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-${data.aws_availability_zones.eks-vpc.names[count.index]}"
  }
}


resource "aws_internet_gateway" "eks-vpc-igw" {
  vpc_id = aws_vpc.eks-vpc.id

  tags = {
    Name = "eks-vpc-igw"
  }
}


resource "aws_route_table" "public-RT" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks-vpc-igw.id
  }

  tags = {
    Name = "public-RT"
  }
}
resource "aws_route_table_association" "pub-1-rt-associate" {
  count          = length(aws_subnet.public-subnet)
  route_table_id = aws_route_table.public-RT.id
  subnet_id      = aws_subnet.public-subnet[count.index].id
}
