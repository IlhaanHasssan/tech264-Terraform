# ***TERRAFORM*** 🏗️
- [***TERRAFORM*** 🏗️](#terraform-️)
  - [***What is Terraform? What is it used for?*** 🏭](#what-is-terraform-what-is-it-used-for-)
  - [***Why use Terraform? The benefits?*** 👍🏾](#why-use-terraform-the-benefits-)
  - [***Alternatives to Terraform*** 🧟‍♀️](#alternatives-to-terraform-️)
  - [***Who is using Terraform in the industry?*** 👨🏾‍👩🏾‍👧🏾‍👦🏾](#who-is-using-terraform-in-the-industry-)
  - [***In IaC, what is orchestration? How does Terraform act as an "orchestrator"?*** 🎺](#in-iac-what-is-orchestration-how-does-terraform-act-as-an-orchestrator-)
  - [***Credentials*** 🔐](#credentials-)
    - [***How Terraform looks up AWS credentials (priority order)*** 🎁](#how-terraform-looks-up-aws-credentials-priority-order-)
    - [***Best practices for supplying AWS credentials to Terraform*** 🗝️](#best-practices-for-supplying-aws-credentials-to-terraform-️)
    - [***How AWS credentials should never be passed to Terraform*** ⛔](#how-aws-credentials-should-never-be-passed-to-terraform-)
  - [***Why use Terraform for different environments (e.g., production, testing, etc.)*** 🖥️](#why-use-terraform-for-different-environments-eg-production-testing-etc-️)


## ***What is Terraform? What is it used for?*** 🏭

**Terraform** is an open-source tool created by HashiCorp that allows you to define and provision infrastructure using a configuration language. Instead of manually setting up cloud resources like servers, databases, and networks, you can use Terraform to write code that automates this process. It's widely used for managing resources across various cloud providers such as AWS, Google Cloud, and Azure.

## ***Why use Terraform? The benefits?*** 👍🏾

Terraform is used because it offers several advantages:

- **Infrastructure as Code (IaC)**: You define infrastructure in code, making it easier to manage, version, and share.
- **Multi-Cloud Support**: You can use it with multiple cloud providers (e.g., AWS, GCP, Azure) or on-premise systems.
- **Consistency**: Ensures that the same configuration can be used in different environments, reducing human error.
- **Automation**: Automates the provisioning and de-provisioning of infrastructure, saving time and reducing manual work.
- **State Management**: Keeps track of the current state of your infrastructure, so changes are automatically applied based on differences.
- **Modularity**: Enables reusing code with modules, making configurations more manageable and scalable.

## ***Alternatives to Terraform*** 🧟‍♀️

Some alternatives to Terraform for managing infrastructure are:

- **AWS CloudFormation**: AWS-specific tool for managing infrastructure as code.
- **Ansible**: A configuration management tool that can also provision infrastructure.
- **Pulumi**: Similar to Terraform, but allows you to define infrastructure using standard programming languages.
- **Chef/Puppet**: Primarily used for configuration management but can provision infrastructure as well.
- **Kubernetes Helm**: For managing infrastructure and deployments in Kubernetes environments.

## ***Who is using Terraform in the industry?*** 👨🏾‍👩🏾‍👧🏾‍👦🏾

Many large organizations use Terraform across various industries, including:

- **Netflix**
- **Uber**
- **Airbnb**
- **Lyft**
- **Tesla**
- **Adobe**

It's especially popular among companies that use multi-cloud environments or need to automate complex infrastructure setups.

## ***In IaC, what is orchestration? How does Terraform act as an "orchestrator"?*** 🎺

**Orchestration** in Infrastructure as Code (IaC) refers to the automated coordination and management of various infrastructure components. Instead of manually configuring each part, an orchestrator handles the process of building, configuring, and linking them together.

Terraform acts as an **orchestrator** by automating the provisioning of cloud infrastructure. It takes care of the dependencies between resources, ensuring that things happen in the right order (e.g., creating a database before creating the application that uses it). It manages the entire lifecycle of infrastructure—from creation to updates and eventual teardown.

## ***Credentials*** 🔐

### ***How Terraform looks up AWS credentials (priority order)*** 🎁

When Terraform needs access to AWS, it looks for credentials in the following order (from highest to lowest precedence):

1. **Environment Variables**: `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.
2. **Shared Credentials File**: Usually located at `~/.aws/credentials`.
3. **AWS Configuration File**: Typically at `~/.aws/config`.
4. **IAM Role (for EC2 instances)**: Automatically picked up if running inside an EC2 instance with an attached IAM role.
5. **AWS CLI Profile**: If you've configured multiple profiles, Terraform will use the default one unless you specify otherwise.

### ***Best practices for supplying AWS credentials to Terraform*** 🗝️

1. **Use IAM Roles**: If you're running Terraform from an EC2 instance, assign an IAM role to the instance instead of hardcoding credentials.
2. **Environment Variables**: For local development, use environment variables to supply AWS credentials (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`).
3. **Shared Credentials File**: Store credentials in the `~/.aws/credentials` file for local setups, but keep this file secure.
4. **AWS Secrets Manager**: For a more secure approach, you can manage credentials using AWS Secrets Manager.

### ***How AWS credentials should never be passed to Terraform*** ⛔

- **Never hardcode credentials in Terraform files**. Including sensitive data in configuration files is a major security risk, as it can accidentally be committed to version control.

## ***Why use Terraform for different environments (e.g., production, testing, etc.)*** 🖥️

Terraform makes it easy to manage multiple environments (like production, testing, and development) by allowing you to reuse the same infrastructure definitions with different configurations. The benefits include:

- **Consistency**: You ensure that all environments are consistent, reducing bugs that arise from manual configuration differences.
- **Separation of Concerns**: You can isolate environments to prevent accidental changes in production while testing new features.
- **Version Control**: Track infrastructure changes in different environments with version control, which adds traceability and accountability.
- **Automation**: Each environment can be easily deployed, updated, or destroyed through automated scripts, saving time and reducing errors.
