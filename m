Message-ID: <00c401c135f0$509d6500$056aaac0@kjlin>
From: "kjlin" <kj.lin@viditec-netmedia.com.tw>
References: <008901c135c6$87b88c60$056aaac0@kjlin> <999696461.4471.15.camel@ez>
Subject: Re: How to install the cross-compiler toolchain?
Date: Wed, 5 Sep 2001 17:51:20 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Jean-Christophe ARNU <jc.arnu@wanadoo.fr>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010905095120.9XKgmC5r5dgVN7_7yv4diwICgtaf9w-0HRBKSpReZ14@z>


----- Original Message -----
Subject: Re: How to install the cross-compiler toolchain?


> On 05 Sep 2001 12:52:13 +0800, kjlin wrote:
> > #rpm -ivh glibc-2.2.3-13.3.i386.rpm
> > error: failed dependencies:
> >                 glibc-common = 2.2.3-13.3 is needed by glibc-2.2.3-13.3
> >                 glibc-devel < 2.2.3 conflicts with glibc-2.2.3-13.3
> > I also tried to install glibc-common-2.2.3-13.3.i386.rpm but still
failed.
> > #rpm -ivh glibc-common-2.2.3-13.3.i386.rpm
> > error: failed dependencies:
> >                 glibc < 2.2.3 conflicts with glibc-common-2.2.3-13.3
> >
> > I am confused by the result.
>
> You should update and not install glibc.
> # rpm -uvh glibc-common-2.2.3-13.3.i386.rpm

It is the same.
Just more error messages.
# rpm -Uvh glibc-common-2.2.3-13.3.i386.rpm
error: failed dependencies:
        glibc < 2.2.3 conflicts with glibc-common-2.2.3-13.3
        glibc-common = 2.2.2-10 is needed by glibc-2.2.2-10

# rpm -Uvh glibc-2.2.3-13.3.i386.rpm
error: failed dependencies:
        glibc-common = 2.2.3-13.3 is needed by glibc-2.2.3-13.3
        glibc-devel < 2.2.3 conflicts with glibc-2.2.3-13.3
        glibc > 2.2.2 conflicts with glibc-common-2.2.2-10
        glibc = 2.2.2 is needed by glibc-devel-2.2.2-10

# rpm -Uvh glibc-devel-2.2.3-13.3.i386.rpm
error: failed dependencies:
        glibc = 2.2.3 is needed by glibc-devel-2.2.3-13.3
