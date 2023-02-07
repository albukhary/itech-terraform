# Terraform 

### Guideline. Part 1

- Register AWS free account.
- Create IAM user `Terraform`
- Save credantials
- Attach `AdministratorAccess` policy to this user
- Install Terraform and aws cli
- Configure default aws cli profile:
```
    % aws configure
    AWS Access Key ID : <Access Key>
    AWS Secret Access Key : <Secret Key>
    Default region name []: us-east-1
    Default output format [None]:
```
### Terraform user created in IAM
![Alt text](https://i.paste.pics/9ae983b83af65379618959b875346095.png "a title")

### Terraform installed
![Alt text](https://i.paste.pics/06efe8e4dc2c3817256cf026ba72ae1d.png "a title")

### AWS CLI default profile configured
![Alt text](https://i.paste.pics/f08789de1b2002adf4504540a062e6e7.png "a title")

- Create folder `Part1` and go there
- Initialize terraform in the folder
```
    % terraform init
```
- Create resource S3 bucket and attach policies using Terraform

![Alt text](https://i.paste.pics/28c64489a39bdd4cc42ae51ff907155e.png "a title")