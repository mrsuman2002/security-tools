# Project 7 - WordPress Pentesting

Time spent: **7** hours spent in total

> Objective: Find, analyze, recreate, and document **five vulnerabilities** affecting an old version of WordPress

## Pentesting Report

1. (Required) Vulnerability Name or ID
  - [ ] Summary: Created a new user and checked while logging in
    - Vulnerability types:User enumeration
    - Tested in version: 4.2
     
  - [ ] GIF Walkthrough: yes 
  - [ ] Steps to recreate: Created a new user and checked while logging in
  <img src="https://github.com/mrsuman2002/Software-Secure-Engineering/blob/master/WP%204.2%20%20Username%20emumeration.gif">



1. (Required) Vulnerability Name or ID Cross site scripting
  - [ ] Summary: checked on the page of WordPress
    - Vulnerability types:Cross site scripting
    - Tested in version: 4.2
    
  - [ ] GIF Walkthrough:yes
  - [ ] Steps to recreate: XSS on wordpress website
<img src="https://github.com/mrsuman2002/Software-Secure-Engineering/blob/master/WP%204.2%20%20XSS%20on%20a%20WordPress%20site.gif">

1. (Required) Vulnerability Name or ID XSS to upload larger media than 2 mb
  - [ ] Summary: uploaded 56 MB media by XSS on it a file name
    - Vulnerability types: cross- site scripting
    - Tested in version:4.7.4
     
  - [ ] GIF Walkthrough: yes
  - [ ] Steps to recreate: uploaded 56 MB media by XSS on it a file name
   
   <img src='WP 4.7.4 Large File Upload Error XSS.gif' title='WordPress XSS2' width='' alt='' />
   
