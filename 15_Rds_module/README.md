1. [DONE] To understand and use RDS resource and its required resources in terrraform
2. [DONE] Create a module
3. [DONE] Implement variabe validation
4. Implement networking validation 
  4.1 Recieve subnet ids and security group ids via variables
  4.2 For subnets:
    4.2.1 Make sure that they are not in the default VPC
    4.2.2 Make sure that they are private
  4.3 For security groups:
    4.3.1 Make sure that there are no inbound rules for IP adresses
5. Create the necessary resources and make dure the validation is working
6. Create the RDS instacne inside of the module