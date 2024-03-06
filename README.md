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

| command                    | description                                                 | example
| --------                   | -------                                                     | ------------- 
| kp (kill process)          | kill all processes based on name                            | kp java
| fp (find process)          | find a process based on name                                | fp java
| dp (docker prune)          | docker prune (stop all containers + remove all containers)  | dp
| gdl (gitlab docker login)  | execute docker login to gitlab registry                     | gdl
| gwb (gradle wrapper build) | executie gradle wrapper build in current dir                | gwb
