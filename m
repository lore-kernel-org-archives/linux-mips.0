Message-ID: <008101c110c4$de161c70$9400a8c0@jefflee>
From: "jeff_lee" <jeff_lee@coventive.com>
References: <3B572EFC.9090903@pacbell.net>
Subject: Re: hard hat linux 2.0
Date: Fri, 20 Jul 2001 10:37:02 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: ppopov@pacbell.net, linux-mips-kernel@lists.sourceforge.net, linux-mips@oss.sgi.com
Message-ID: <20010720023702.rjP_vwkJWOBcSUy8yYdFEvC6nfrxYmcnwQE_oPaZgZY@z>

Hi ,
    How can I ftp the site ??
Do I need the user name or passward ?? 
Or how is the port number ??

Thanks !!!
----- Original Message ----- 
From: "Pete Popov" <ppopov@pacbell.net>
To: <linux-mips-kernel@lists.sourceforge.net>; <linux-mips@oss.sgi.com>
Sent: Friday, July 20, 2001 3:03 AM
Subject: hard hat linux 2.0


> Looks like ftp.mvista.com was updated last night to include the mips 
> journeyman edition. The images of interest would be 
> ftp.mvista.com:/pub/Journeyman/cdimages/{je-d1-hhl2.0.cdimage, 
> je-src-hhl2.0.cdimage}.  They are rather large so it takes a while to 
> download them.
> 
> In addition to the userland packages, there is an up to date cross 
> toolchain which can build the kernel as well as useland apps. There is 
> also a native toolchain.  The toolchain is 2.95.3 based; glibc is 2.2.3. 
>   Since there was some perl interest recently, perl is included. 
> Rebuilding any of the userland packages, for those interested in doing 
> that, is pretty trivial (cross based building!).
> 
> This is an embedded linux distribution so it's not as large as a RedHat 
> desktop system. For embedded work though, I think it's more than 
> sufficient.  One note, to anyone trying it.  A number of binaries are 
> linked with pthreads, so you'll need either the new sysmips fix that 
> Ralf is working on, when he completes it, or the patch from Florian. 
> Otherwise binaries like ls, tar, and many others will seg fault.
> 
> Pete
