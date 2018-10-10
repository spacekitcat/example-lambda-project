# Test lambda project

In this project, I'm experimenting with AWS Lambda - Amazon's product for microservices - and my goal is to investigate how I might use it for my personal blog and also just to enhance my knowledge a little. I understand it well in the abstract, but I want a more practical working knowledge of it. My blog currently has a fairly low amount of traffic. I use it as a web development playground, I try experiments and try remove preconcieved notions of good visual design and conventional engineering practices. It's also a portfolio of sorts, it lets people follow through to my Github profile and get a feel for the sort of developer I am. Anyway, the important thing is that I think I might lower my monthly AWS bill, currently around £15 per month. It's currently set up with AWS EBS, scaling load balancer with a minimum of 2 micro instances on the lowest load.  

~~# Goals~~

~~The success state is pretty simple, I want to provide a REST endpoint as a lambda and then I want to make my blog reference it.
It would be a bonus if it could also deploy as part of the build and deploy pipeline for spacekitcat.com~~

# Outcome [11-OCT-18]

Created a simple lambda (this repo), configured an AWS Code Pipe Line to watch this repository and redeploy it whenever it gets a commit notification from Github. 


# Details
API endpoint: https://j1gmykxabc.execute-api.eu-west-2.amazonaws.com/default/test-lambda

# Reference material

[Amazon tutorial for creating a Node deployment PKG](https://docs.aws.amazon.com/lambda/latest/dg/nodejs-create-deployment-pkg.html)
