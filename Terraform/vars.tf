variable "ssh_key" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCtZdkj4QaWLKl+2Zr76Ua0m7Iu350uAPc7FtvBLWeHijYGOIcfqJjieE88zfqgg5gOK764Ghd998isJ9PWKrfnk46ckCDy5EdO8u5PGYhlLQODIHitcIL80YnkJH5oyl7VBSpct1snv4HEiH0fCMYtwT6dEnEezHF2HwddiqE5Ydtr/rBnEsF4ZJdT+YFACatSXz9vepDpnQgcBPm9QV91ndhgU0vpf8hWC+p+USU9xd0vRnD+a1D3qlQuyfSlCzGBYhOCxCxV1coPCYxgrNHinkm1Vc2r0yw1cs36XPOBSvp6JtCavE4g9qFlM3LKM0RgcegZEd63G6SAU1uPj5NjKCIQxxvsXgL4qtlfOwbrRS7xrD4KmCM4IszxlKjIjI8XUL92bDTGdPftgSkBB6Cts/6se3EhZHjwcqU1IpVimRr2iLmtdZJ7yjzjJ8kyl4Lgt9Z51y6OwsZnfHb8sYF9yfdqK3xKr6BLmy1mDUr2TU3WYYXKnxKjk2euTSaV+fM= ciber2@pcredes13"
}

variable "proxmox_host" {
    default = "pve01"
}

variable "template_name" {
    default = "ubuntu-template"
}