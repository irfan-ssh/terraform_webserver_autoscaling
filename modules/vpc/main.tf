
data "aws_availability_zones" "zone" {
  
}
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Name = "${var.name}-vpc"
  }
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  availability_zone = data.aws_availability_zones.zone.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name}-public-sub-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)

  vpc_id     = aws_vpc.main.id
  cidr_block = element(var.private_subnet_cidrs, count.index)
  availability_zone = data.aws_availability_zones.zone.names[count.index]

  tags = {
    Name = "${var.name}-private-sub-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.name}-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.name}-public"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public[*].id)
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public.id
}
