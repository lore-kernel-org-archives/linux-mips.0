Date: Tue, 1 May 2001 16:29:18 -0700 (PDT)
From: "John D. Davis" <johnd@Stanford.EDU>
Subject: NFS -13 error
Message-ID: <Pine.GSO.4.31.0105011618380.25388-100000@myth1.Stanford.EDU>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010501232918.EhdtOHUYDAfHvzrcbTePH7HrcR6PYfQdbV2n1-_VKw4@z>


I am having a problem installing linux on a 4400 indy.  I downloaded a
"fixed" version from: honk.physik.uni-konstanz,de/linux-mips/install
and downloaded :
root-be-0.04.cpio

I also got the 2.4 vmlinux kernel from the sgi website.  I am trying to
load linux from another Indy running IRIX 6.2. Bootp and tftp seem to work
but the nfs mount fails with an error -13 and getfh says the file or
directory don't exist.  The /etc/hosts has the machine IP address and
name. /etc/ethers has the HW to IP address mapping.  I also modified the
/etc/bootptab and /var/dhcp/config/config... file.  The SYSLOG mount
request on server is this:


May  1 14:39:38 7D:littledipper mountd[861]: <unknown> mount request for
/tftpboot/171.64.72.150: getfh failed: No such file or directory

I set the client as root in /etc/exports:

/ld2 \
    ...
   -root=171.64.72.150,rw

The no_root_squash flag doesn't seem to apply for IRIX.  Should I be using
a different distribution of Linux for SGI?  The NFS mount error of
/tftpboot/171.64.72.150 is a directory that I did not specify.  Am I
missing something? I looked through the archives and searched for the info
on the web and did not find anything that helped.

Thank you for your assistance,
john davis
