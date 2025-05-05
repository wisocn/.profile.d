# Introduction
Bash utilities for everday use.

Bash utlities include wrappers around: 

- message/log utils (info, err messages)
- process utils
- docker utils
- find utils

# Pre-requisites
Bash version 5.2.15+ 

# Usage

Usage of bash commands and their decsription

| command                          | description                                                                          | example
| --------                         | -------                                                                              | ------------- 
| kp (kill process)                | kill all processes based on name                                                     | kp java
| fp (find process)                | find a process based on name                                                         | fp java
| dp (docker prune)                | docker prune (stop all containers + remove all containers)                           | dp
| dl (docker list)                 | docker list all active containers                                                    | dl
| dl $1 (docker list with grep)    | docker list                                                                          | dl postgres
| dpa (docker prune all)           | docker prune all(stop all containers + remove all containers + remove all images)    | dp
| dtl $1 $2 (docker tag list)      | search docker hub for tags by name and size                                          | dtl nginx 10
| gdl (gitlab docker login)        | execute docker login to gitlab registry                                              | gdl
| gwb (gradle wrapper build)       | execute gradle wrapper build in current dir                                          | gwb
| ff (find files)                  | Find files in current directory based on string                                      | ff test.txt
| fr (remove file)                 | remove a file in current directory based on full path                                | fr test.txt
| daf (delete all files)           | find all files and delete in current dir compose(ff()+fr())                          | daf test
| lsf (list all functions)         | list all functions in ./profile.d subdir or in specified dir and show                | lsf OR lsf /some-dir

