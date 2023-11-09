
echo "Volt IPs"
aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`volt-1`]].PrivateDnsName' --output text
aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`volt-1`]].PublicDnsName' --output text
aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`volt-1`]].PublicIpAddress' --output text


#aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`volt-02`]].PrivateDnsName' --output text
#aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`volt-02`]].PublicDnsName' --output text
#aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`volt-02`]].PublicIpAddress' --output text
#
#aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`volt-03`]].PrivateDnsName' --output text
#aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`volt-03`]].PublicDnsName' --output text
#aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`volt-03`]].PublicIpAddress' --output text

echo "Test Client IPs"
aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`test-1`]].PrivateDnsName' --output text
aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`test-1`]].PublicDnsName' --output text


aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`test-2`]].PrivateDnsName' --output text
aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`test-2`]].PublicDnsName' --output text
#
#
aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`test-3`]].PrivateDnsName' --output text
aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`test-3`]].PublicDnsName' --output text
#
#
#aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`test-04`]].PrivateDnsName' --output text
#aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`test-04`]].PublicDnsName' --output text
#
#
#aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`test-05`]].PrivateDnsName' --output text
#aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`test-05`]].PublicDnsName' --output text
#
#
#aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`test-06`]].PrivateDnsName' --output text
#aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`test-06`]].PublicDnsName' --output text
echo "Monitoring Server IP"
aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`monitoring-server`]].PrivateDnsName' --output text
aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`monitoring-server`]].PublicDnsName' --output text
aws ec2 describe-instances --query 'Reservations[*].Instances[?Tags[?Key==`Name` && Value==`monitoring-server`]].PublicIpAddress' --output text