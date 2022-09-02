# VPC
resource "aws_vpc" "Sept-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "sept-vpc"
  }
}

# Private Subnets

resource "aws_subnet" "sept-private-sub-1" {
  vpc_id     = aws_vpc.Sept-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "sept-private-sub-1"
  }
}

resource "aws_subnet" "sept-private-sub-2" {
  vpc_id     = aws_vpc.Sept-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "sept-private-sub-2"
  }
}

# Public Subnets

resource "aws_subnet" "sept-public-sub-1" {
  vpc_id     = aws_vpc.Sept-vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "sept-public-sub-1"
  }
}

resource "aws_subnet" "sept-public-sub-2" {
  vpc_id     = aws_vpc.Sept-vpc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "sept-public-sub-2"
  }
}

# Private Route Table

resource "aws_route_table" "Sept-private-rt" {
  vpc_id = aws_vpc.Sept-vpc.id

  tags = {
    Name = "sept-private-rt"
  }
}

# Public Route Table

resource "aws_route_table" "sept-public-rt" {
  vpc_id = aws_vpc.Sept-vpc.id

  tags = {
    Name = "sept-public-rt"
  }
}

# Public Sunbet 1 Association With Route Table

resource "aws_route_table_association" "public-route-table-association-1" {
  subnet_id      = aws_subnet.sept-public-sub-1.id
  route_table_id = aws_route_table.sept-public-rt.id
}

# Public Sunbet 2 Association With Route Table

resource "aws_route_table_association" "public-route-table-association-2" {
  subnet_id      = aws_subnet.sept-public-sub-2.id
  route_table_id = aws_route_table.sept-public-rt.id
}

# Private Sunbet 1 Association With Route Table

resource "aws_route_table_association" "private-route-table-association-1" {
  subnet_id      = aws_subnet.sept-private-sub-1.id
  route_table_id = aws_route_table.Sept-private-rt.id
}

# Private Sunbet 2 Association With Route Table

resource "aws_route_table_association" "private-route-table-association-2" {
  subnet_id      = aws_subnet.sept-private-sub-2.id
  route_table_id = aws_route_table.Sept-private-rt.id
}

# Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.Sept-vpc.id

  tags = {
    Name = "igw"
  }
}

# Route

resource "aws_route" "sept-public-igw-rt" {
  route_table_id            = aws_route_table.sept-public-rt.id
  gateway_id                = aws_internet_gateway.igw.id
  destination_cidr_block    = "0.0.0.0/0"
}